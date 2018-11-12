//
//  DBManager.h
//  SQLite3DBSample
//
//  Created by burnsoft on 2/3/15.
//  Copyright (c) 2015 burnsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DBManager : NSObject

@property (nonatomic, strong) NSMutableArray *arrColumnNames;
@property (nonatomic) int affectedRows;
@property (nonatomic) long long lastInsertedRowID;;

#pragma mark Init Database with File name
-(instancetype)initWithDatabaseFileName:(NSString *)dbFilename;

#pragma mark Load Data from DB into Array
-(NSArray *)loadDataFromDB:(NSString *)query;

#pragma mark Execute SQL statement
-(void)executeQuery:(NSString *)query;

#pragma mark Error Handling
-(NSString *)dbErrors:(int) ret;

#pragma mark Get Database Path
-(NSString *) getDatabasePath :(NSString *) DBNAME;

#pragma mark Copy DB if Needed
-(void) copyDbIfNeeded :(NSString *) DBNAME MessageHandler:(NSString **) msg;

#pragma mark Check Database
-(void)checkDB :(NSString *) DBNAME MessageHandler:(NSString **) msg;

#pragma mark Restory Factory Database
-(void) restoreFactoryDB :(NSString *) DBNAME MessageHandler:(NSString **) msg;
@end
