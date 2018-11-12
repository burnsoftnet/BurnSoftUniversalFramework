//
//  BurnSoftFileSystem.m
//  BurnSoftUniversal
//
//  Created by burnsoft on 8/12/17.
//  Copyright © 2017 burnsoft. All rights reserved.
//

#import "BurnSoftFileSystem.h"

@implementation BurnSoftFileSystem
#pragma mark CopyFile
/*! @brief Simplify the copy and replace method with overwriteoption
 */
+(BOOL) copyFileFromFilePath:(NSString *) fromPath ToNewPath:(NSString *) toPath ErrorMessage:(NSString **) msg
{
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSError *error;
    NSString *deleteError = [NSString new];
    BOOL success;
    BOOL bAns = NO;
    
    BOOL FileExistsAtDest = [fileManager fileExistsAtPath:toPath];
    BOOL FileExistsAtSource = [fileManager fileExistsAtPath:fromPath];
    BOOL DESTDELETESUCCESSFUL = NO;
    
    if (FileExistsAtSource && FileExistsAtDest) {
        DESTDELETESUCCESSFUL = [self DeleteFileByPath:toPath ErrorMessage:&deleteError];
    } else if (!FileExistsAtDest && FileExistsAtSource) {
        DESTDELETESUCCESSFUL = YES;
    } else if (!FileExistsAtSource && !FileExistsAtDest) {
        DESTDELETESUCCESSFUL = NO;
        *msg = [NSString stringWithFormat:@"File Does not Exist at Source or Destination!"];
    }
    
    if (DESTDELETESUCCESSFUL)
    {
        success = [fileManager copyItemAtPath:fromPath toPath:toPath error:&error];
        if (!success)
        {
            *msg = [NSString stringWithFormat:@"Error coping file: %@",[error localizedDescription]];
        } else {
            *msg = [NSString stringWithFormat:@"Copy Successful!"];
            bAns = YES;
        }
    } else {
        if ([*msg isEqualToString:@""])
        {
            *msg = deleteError;
        }
    }
    
    return bAns;
}
#pragma mark Delete File byPath
/*! @brief  Pass the path and file to delete that file
 */
+(BOOL)DeleteFileByPath:(NSString *) sPath ErrorMessage:(NSString **) msg
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL success = NO;
    NSError *error;
    
    success = [fileManager removeItemAtPath:sPath error:&error];
    if (!success)
    {
        *msg = [NSString stringWithFormat:@"Error deleting database: %@",[error localizedDescription]];
    }else {
        *msg = [NSString stringWithFormat:@"Delete Successful!"];
    }
    return success;
}
#pragma mark Load Files in Path by Extension
/*! @brief Load all the files in the target path that have a certain type of extension
*/
+(NSArray *) getCertainFilefromPath:(NSString *) sPath ByExtension:(NSString *) myExt
{
    NSArray *filePathsArray = [NSArray new];
    NSArray *dirFiles = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:sPath error:nil];
    NSString *filefilter = [NSString stringWithFormat:@"self ENDSWITH '.%@'",myExt];
    filePathsArray = [dirFiles filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:filefilter]];
    
    return filePathsArray;
}
#pragma mark Load Files in Local Directory by Extension
/*! @brief  Load all the files in the Local documents directory by a certain extension.
*/
+(NSArray *) getCertainFilesFromDocumentsByExtension:(NSString *) myExt
{
    NSArray *filePathsArray = [NSArray new];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSArray *dirFiles = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:documentsDirectory error:nil];
    NSString *filefilter = [NSString stringWithFormat:@"self ENDSWITH '.%@'",myExt];
    filePathsArray = [dirFiles filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:filefilter]];
    
    return filePathsArray;
}
#pragma mark Return Full Path of App Documents with file name
/*! @brief Return Full Path of App Documents with file name attached
 */
+(NSString *) returnFullPathwithFileName:(NSString *) myFile
{
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    return [docPath stringByAppendingPathComponent:myFile];
}
#pragma mark CopyFile 2
/*! @brief  Simplify the copy and replace method with overwriteoption
*/
+(BOOL) copyFileFrom:(NSString *) sFrom To:(NSString *) sTo ErrorMessage:(NSString **) errorMessage
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *deleteError = [NSString new];
    NSError *error;
    BOOL bAns = NO;
    BOOL FileExistsInTo = [fileManager fileExistsAtPath:sTo];
    BOOL FileExistsInFrom = [fileManager fileExistsAtPath:sFrom];
    BOOL FileClearedInDestination = NO;
    
    if (FileExistsInTo && FileExistsInFrom)
    {
        FileClearedInDestination = [self DeleteFileByPath:sTo ErrorMessage:&deleteError];
    } else if (!FileExistsInFrom && FileExistsInTo) {
        FileClearedInDestination = YES;
    } else if (!FileExistsInFrom && !FileExistsInTo) {
        FileClearedInDestination = NO;
        *errorMessage = @"File doesn't exist in source or destination!";
    }
    
    if (FileClearedInDestination)
    {
        if (![fileManager copyItemAtPath:sFrom toPath:sTo error:&error])
        {
            *errorMessage = [NSString stringWithFormat:@"Error copying file: %@",[error localizedDescription]];
        } else {
            *errorMessage = [NSString stringWithFormat:@"Backup Successful!"];
            bAns = YES;
        }
    } else {
        if ([*errorMessage isEqualToString:@""]) {
            *errorMessage = [NSString stringWithFormat:@"Delete Error: %@",deleteError];
        }
    }
    
    return bAns;
}
#pragma mark Create a Directory
/*! @brief Create a directory if it doesn't already exist
 */
+(BOOL)createDirectoryIfNotExists:(NSString *) sPath ErrorMessage:(NSString **) errMsg
{
    BOOL bAns = NO;
    BOOL isDir;
    NSError *error;
    NSFileManager *fileManager= [NSFileManager defaultManager];
    if(![fileManager fileExistsAtPath:sPath isDirectory:&isDir]) {
        if(![fileManager createDirectoryAtPath:sPath withIntermediateDirectories:YES attributes:nil error:&error]) {
            *errMsg = [NSString stringWithFormat:@"%@",[error localizedDescription]];
        } else {
            bAns = YES;
        }
    } else {
        bAns = YES;
    }
    return bAns;
}
#pragma mark Convert Bool to String
/*! @brief Convert a boolean value to string Yes or No
 */
+(NSString *) convertBOOLtoString:(BOOL) bValue
{
    NSString *sAns = [NSString new];
    if (bValue) {
        sAns = @"Yes";
    } else {
        sAns = @"No";
    }
    return sAns;
}

#pragma mark Get File Exteension From File Path
/*! @brief Get the extension of the file from the full path
 */
+(NSString *) getFileExtensionbyPath:(NSString *) filePath
{
    NSArray *pathArray = [filePath componentsSeparatedByString:@"."];
    NSString *fileExtension = [pathArray lastObject];
    return fileExtension;
}

@end
