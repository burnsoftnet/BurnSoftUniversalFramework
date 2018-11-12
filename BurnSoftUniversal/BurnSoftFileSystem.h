//
//  BurnSoftFileSystem.h
//  BurnSoftUniversal
//
//  Created by burnsoft on 8/12/17.
//  Copyright © 2017 burnsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BurnSoftFileSystem : NSObject
#pragma mark CopyFile
+(BOOL) copyFileFromFilePath:(NSString *) fromPath ToNewPath:(NSString *) toPath ErrorMessage:(NSString **) msg;

#pragma mark Delete File byPath
+(BOOL)DeleteFileByPath:(NSString *) sPath ErrorMessage:(NSString **) msg;

#pragma mark Load Files in Path by Extension
+(NSArray *) getCertainFilefromPath:(NSString *) sPath ByExtension:(NSString *) myExt;

#pragma mark Load Files in Local Directory by Extension
+(NSArray *) getCertainFilesFromDocumentsByExtension:(NSString *) myExt;

#pragma mark Return Full Path of App Documents with file name
+(NSString *) returnFullPathwithFileName:(NSString *) myFile;

#pragma mark CopyFile 2
+(BOOL) copyFileFrom:(NSString *) sFrom To:(NSString *) sTo ErrorMessage:(NSString **) errorMessage;

#pragma mark Create a Directory
+(BOOL)createDirectoryIfNotExists:(NSString *) sPath ErrorMessage:(NSString **) errMsg;

#pragma mark Convert Bool to String
+(NSString *) convertBOOLtoString:(BOOL) bValue;

#pragma mark Get File Exteension From File Path
+(NSString *) getFileExtensionbyPath:(NSString *) filePath;
@end
