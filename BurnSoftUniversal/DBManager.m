//
//  DBManager.m
//  SQLite3DBSample
//
//  Created by burnsoft on 2/3/15.
//  Copyright (c) 2015 burnsoft. All rights reserved.
//

#import "DBManager.h"
#import <sqlite3.h>

@interface DBManager()
@property (nonatomic, strong) NSString *documentsDirectory;
@property (nonatomic, strong) NSString *databaseFilename;
@property (nonatomic, strong) NSMutableArray *arrResults;

-(void)copyDatabaseIntoDocumentsDirectory;
-(void)runQuery:(const char *) query isQueryExecutable:(BOOL)queryExecutable;

@end

@implementation DBManager
#pragma mark Init Database with File name
/*! @brief Initialize the database with the file name
 */
-(instancetype)initWithDatabaseFileName:(NSString *)dbFilename {
    self = [super init];
    if (self ) {
        //Set the documents directory path to the documentsDirectoy property
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES);
        self.documentsDirectory = [paths objectAtIndex:0];
        //self.documentsDirectory = [paths objectAtindex:0];
        
        //Keep the database filename
        self.databaseFilename = dbFilename;
        
        //Copy the database file into the documents directoy if nessary.
        //[self copyDatabaseIntoDocumentsDirectory];
        [self copyDatabaseIntoDocumentsDirectory];
        
    }
    return self;
}

#pragma mark  PRIVATE - Copy DB to Docs Directory
/*! @brief Copy the database from the application path to the users documents path
 Since when the application is updated, the database is replaced and to prevent that we copy the database to the user docs path to retain the data.
 */
-(void)copyDatabaseIntoDocumentsDirectory {
    //Check if the database file exists in the docuents directory.
    NSString *destinationPath = [self.documentsDirectory stringByAppendingPathComponent:self.databaseFilename];
    if (![[NSFileManager defaultManager] fileExistsAtPath:destinationPath]) {
        NSString *sourcePath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:self.databaseFilename];
        NSError *error;
        [[NSFileManager defaultManager] copyItemAtPath:sourcePath toPath:destinationPath error:&error];
        
        //Check if any error occured during copying and displaying it
        if (error != nil) {
            NSLog(@"%@", [error localizedDescription]);
        }
    }
}

#pragma mark PRIVATE - Run SQL statement
/*! @brief pass a sqlstatement to be executed, select with resulte set into the Array.
 */
-(void)runQuery:(const char *)query isQueryExecutable:(BOOL)queryExecutable{
    // Create a sqlite object.
    sqlite3 *sqlite3Database;
    
    // Set the database file path.
    NSString *databasePath = [self.documentsDirectory stringByAppendingPathComponent:self.databaseFilename];
    NSLog(@"DatabasePath: %@",databasePath);
    // Initialize the results array.
    if (self.arrResults != nil) {
        [self.arrResults removeAllObjects];
        self.arrResults = nil;
    }
    self.arrResults = [[NSMutableArray alloc] init];
    
    // Initialize the column names array.
    if (self.arrColumnNames != nil) {
        [self.arrColumnNames removeAllObjects];
        self.arrColumnNames = nil;
    }
    self.arrColumnNames = [[NSMutableArray alloc] init];
    
    
    // Open the database.
    int openDatabaseResult = sqlite3_open([databasePath UTF8String], &sqlite3Database);
    // == SQLITE_OK)
    if(openDatabaseResult == SQLITE_OK) {
        // Declare a sqlite3_stmt object in which will be stored the query after having been compiled into a SQLite statement.
        sqlite3_stmt *compiledStatement;
        
        // Load all data from database to memory.
        int prepareStatementResult = sqlite3_prepare_v2(sqlite3Database, query, -1, &compiledStatement, NULL);
        // == SQLITE_OK)
        if(prepareStatementResult == SQLITE_OK) {
            // Check if the query is non-executable.
            if (!queryExecutable){
                // In this case data must be loaded from the database.
                
                // Declare an array to keep the data for each fetched row.
                NSMutableArray *arrDataRow;
                
                // Loop through the results and add them to the results array row by row.
                while(sqlite3_step(compiledStatement) == SQLITE_ROW) {
                    // Initialize the mutable array that will contain the data of a fetched row.
                    arrDataRow = [[NSMutableArray alloc] init];
                    
                    // Get the total number of columns.
                    int totalColumns = sqlite3_column_count(compiledStatement);
                    
                    // Go through all columns and fetch each column data.
                    for (int i=0; i<totalColumns; i++){
                        // Convert the column data to text (characters).
                        char *dbDataAsChars = (char *)sqlite3_column_text(compiledStatement, i);
                        
                        // If there are contents in the currenct column (field) then add them to the current row array.
                        if (dbDataAsChars != NULL) {
                            // Convert the characters to string.
                            [arrDataRow addObject:[NSString  stringWithUTF8String:dbDataAsChars]];
                        }
                        
                        // Keep the current column name.
                        if (self.arrColumnNames.count != totalColumns) {
                            dbDataAsChars = (char *)sqlite3_column_name(compiledStatement, i);
                            [self.arrColumnNames addObject:[NSString stringWithUTF8String:dbDataAsChars]];
                        }
                    }
                    
                    // Store each fetched data row in the results array, but first check if there is actually data.
                    if (arrDataRow.count > 0) {
                        [self.arrResults addObject:arrDataRow];
                    }
                }
            }
            else {
                // This is the case of an executable query (insert, update, ...).
                
                // Execute the query.
                int executeQueryResults = sqlite3_step(compiledStatement);
                //This was SQLITE_DONE, but the comiler was saying it was a constat value of 101, and that it will always
                //return false, so i took it out
                if (executeQueryResults == SQLITE_DONE) {
                    // Keep the affected rows.
                    self.affectedRows = sqlite3_changes(sqlite3Database);
                    
                    // Keep the last inserted row ID.
                    self.lastInsertedRowID = sqlite3_last_insert_rowid(sqlite3Database);
                }
                else {
                    // If could not execute the query show the error message on the debugger.
                    NSLog(@"DB Error: %s", sqlite3_errmsg(sqlite3Database));
                }
            }
        }
        else {
            // In the database cannot be opened then show the error message on the debugger.
            NSLog(@"%s", sqlite3_errmsg(sqlite3Database));
        }
        
        // Release the compiled statement from memory.
        sqlite3_finalize(compiledStatement);
    }
    else {
        // In the database cannot be opened then show the error message on the debugger.
        NSLog(@"%s", sqlite3_errmsg(sqlite3Database));
    }
    
    // Close the database.
    sqlite3_close(sqlite3Database);
}
#pragma mark Load Data from DB into Array
/*! @brief  Pass a STL statement to have the data loaded into an Array
 */
-(NSArray *)loadDataFromDB:(NSString *)query {
    //run the query and indicate that is not executable
    //the query string is converted to a char * object
    [self runQuery:[query UTF8String] isQueryExecutable:NO];
    
    //return the loaded results
    return (NSArray *)self.arrResults;
}

#pragma mark Execute SQL statement
/*! @brief pass a sqlstatement to be executed, usually INSERT,UPDATE, DELETE, etc.
 */
-(void)executeQuery:(NSString *)query {
    [self runQuery:[query UTF8String] isQueryExecutable:YES];
}

#pragma mark Error Handling
/*! @brief  Translate Errors from SQLITE integer to English
 @remark USEDBY: GENERAL
 */
-(NSString *) dbErrors:(int)ret
{
    NSString *msg;
    switch (ret) {
        case SQLITE_ERROR :
            msg = [NSString stringWithFormat:@"SQL error or missing database, ERROR #: %d",ret];
            break;
        case SQLITE_INTERNAL :
            msg = [NSString stringWithFormat:@"Internal logic error in SQLite, ERROR #: %d",ret];
            break;
        case SQLITE_PERM :
            msg = [NSString stringWithFormat:@"Access permission denied, ERROR #: %d",ret];
            break;
        case SQLITE_ABORT :
            msg = [NSString stringWithFormat:@"Callback routine requested an abort, ERROR #: %d",ret];
            break;
        case SQLITE_BUSY :
            msg = [NSString stringWithFormat:@"The database file is locked, ERROR #: %d",ret];
            break;
        case SQLITE_LOCKED :
            msg = [NSString stringWithFormat:@"A table in the database is locked, ERROR #: %d",ret];
            break;
        case SQLITE_NOMEM :
            msg = [NSString stringWithFormat:@"A malloc() failed, ERROR #: %d",ret];
            break;
        case SQLITE_READONLY :
            msg = [NSString stringWithFormat:@"Attempt to write a readonly database, ERROR #: %d",ret];
            break;
        case SQLITE_INTERRUPT :
            msg = [NSString stringWithFormat:@"Operation terminated by sqlite3_interrupt(), ERROR #: %d",ret];
            break;
        case SQLITE_IOERR :
            msg = [NSString stringWithFormat:@"Some kind of disk I/O error occurred, ERROR #: %d",ret];
            break;
        case SQLITE_CORRUPT :
            msg = [NSString stringWithFormat:@"The database disk image is malformed, ERROR #: %d",ret];
            break;
        case SQLITE_NOTFOUND :
            msg = [NSString stringWithFormat:@"Unknown opcode in sqlite3_file_control(), ERROR #: %d",ret];
            break;
        case SQLITE_FULL :
            msg = [NSString stringWithFormat:@"Insertion failed because database is full, ERROR #: %d",ret];
            break;
        case SQLITE_CANTOPEN :
            msg = [NSString stringWithFormat:@"Unable to open the database file, ERROR #: %d",ret];
            break;
        case SQLITE_PROTOCOL :
            msg = [NSString stringWithFormat:@"Database lock protocol error, ERROR #: %d",ret];
            break;
        case SQLITE_EMPTY :
            msg = [NSString stringWithFormat:@"Database is empty, ERROR #: %d",ret];
            break;
        case SQLITE_SCHEMA :
            msg = [NSString stringWithFormat:@"The database schema changed, ERROR #: %d",ret];
            break;
        case SQLITE_TOOBIG :
            msg = [NSString stringWithFormat:@"String or BLOB exceeds size limit, ERROR #: %d",ret];
            break;
        case SQLITE_CONSTRAINT :
            msg = [NSString stringWithFormat:@"Abort due to constraint violation, ERROR #: %d",ret];
            break;
        case SQLITE_MISMATCH :
            msg = [NSString stringWithFormat:@"Data type mismatch, ERROR #: %d",ret];
            break;
        case SQLITE_MISUSE :
            msg = [NSString stringWithFormat:@"Library used incorrectly, ERROR #: %d",ret];
            break;
        case SQLITE_NOLFS :
            msg = [NSString stringWithFormat:@"Uses OS features not supported on host, ERROR #: %d",ret];
            break;
        case SQLITE_AUTH :
            msg = [NSString stringWithFormat:@"Authorization denied, ERROR #: %d",ret];
            break;
        case SQLITE_FORMAT :
            msg = [NSString stringWithFormat:@"Auxiliary database format error, ERROR #: %d",ret];
            break;
        case SQLITE_RANGE :
            msg = [NSString stringWithFormat:@"2nd parameter to sqlite3_bind out of range, ERROR #: %d",ret];
            break;
        case SQLITE_NOTADB :
            msg = [NSString stringWithFormat:@"File opened that is not a database file, ERROR #: %d",ret];
            break;
        case SQLITE_NOTICE :
            msg = [NSString stringWithFormat:@"Notifications from sqlite3_log(), ERROR #: %d",ret];
            break;
        case SQLITE_WARNING :
            msg = [NSString stringWithFormat:@"Warnings from sqlite3_log(), ERROR #: %d",ret];
            break;
        case SQLITE_ROW :
            msg = [NSString stringWithFormat:@"sqlite3_step() has another row ready, ERROR #: %d",ret];
            break;
        case SQLITE_DONE :
            msg = [NSString stringWithFormat:@"sqlite3_step() has finished executing , ERROR #: %d",ret];
            break;
        default:
            msg = [NSString stringWithFormat:@"UNKNOWN Error Number: %d",ret];
            break;
    }
    return msg;
}

#pragma mark Get Database Path
/*! @brief  Pass the Database Name to find the Path of the database
 */
-(NSString *) getDatabasePath :(NSString *) DBNAME
{
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    return [docPath stringByAppendingPathComponent:DBNAME];
}
#pragma mark Copy DB if Needed
/*! @brief  Pass the name of the database to see if we need to copy the database from the application directory to the documents directory
 */
-(void) copyDbIfNeeded :(NSString *) DBNAME MessageHandler:(NSString **) msg
{
    NSString *myDBinAppPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:DBNAME];
    NSString *myDBinDocsPath = [self getDatabasePath:DBNAME];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:myDBinDocsPath]) {
        NSError *error;
        BOOL success;
        success = [fileManager copyItemAtPath:myDBinAppPath toPath:myDBinDocsPath error:&error];
        if (!success) {
            *msg = [NSString stringWithFormat:@"Error coping database: %@.",[error localizedDescription]];
        }
    }
    
}

#pragma mark Check Database
/*! @brief  Pass the Database name to see if the database is in the path that we need it to be in
 */
-(void)checkDB :(NSString *) DBNAME MessageHandler:(NSString **) msg
{
    NSString *dbPathString = [self getDatabasePath:DBNAME];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:dbPathString]) {
        *msg = [NSString stringWithFormat:@"Database is missing from Path! %@", dbPathString];
    } else {
        *msg = @"Database found!";
    }
}

#pragma mark Restory Factory Database
/*! @brief  Retore the Factory Database by deleting the database in the user docs and copying it back over.
 */
-(void) restoreFactoryDB :(NSString *) DBNAME MessageHandler:(NSString **) msg
{
    NSString *myDBinDocsPath = [self getDatabasePath:DBNAME];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:myDBinDocsPath]){
        NSError *error;
        BOOL success;
        success = [fileManager removeItemAtPath:myDBinDocsPath error:&error];
        if (!success) {
            *msg = [NSString stringWithFormat:@"Error deleting database: %@",[error localizedDescription]];
        } else {
            [self copyDbIfNeeded:DBNAME MessageHandler:msg];
        }
    }
}

@end
