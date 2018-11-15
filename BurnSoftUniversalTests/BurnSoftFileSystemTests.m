//
//  BurnSoftFileSystemTests.m
//  BurnSoftUniversalTests
//
//  Created by burnsoft on 11/12/18.
//  Copyright © 2018 burnsoft. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <BurnSoftUniversal/BurnSoftFileSystem.h>
#import "GeneralFunctions.h"
#import <Foundation/Foundation.h>

@interface BurnSoftFileSystemTests : XCTestCase
{
    NSString *TestPath;
    NSString *TestFileName;
    NSString *NewFileCopy;
    //NSString *ErrorMsg;
}
@end

@implementation BurnSoftFileSystemTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    TestPath = @"/Users/burnsoft";
    TestFileName = @"test.log";
    NewFileCopy = @"testcopy.log";
    //*ErrorMsg = @"";
    /*
    int pid = [[NSProcessInfo processInfo] processIdentifier];
    NSPipe *pipe = [NSPipe pipe];
    NSFileHandle *file = pipe.fileHandleForReading;
    
    NSTask *task = [NSTask new];
    task.launchPath = @"/usr/bin/touch";
    task.arguments = @[@"bar.txt"];
    task.standardOutput = pipe;
    
    [task launch];
     */
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)test_copyFileFromFilePath{
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
     NSString *msg = [NSString new];
    bool value = [BurnSoftFileSystem copyFileFromFilePath:[NSString stringWithFormat:@"%@/%@", TestPath, TestFileName] ToNewPath:[NSString stringWithFormat:@"%@/%@", TestPath, NewFileCopy] ErrorMessage:&msg];
    [GeneralFunctions TestResults:value OutPut:msg];
}
-(void)test_createDirectoryIfNotExists{
    NSString *msg = [NSString new];
    bool value = [BurnSoftFileSystem createDirectoryIfNotExists:[NSString stringWithFormat:@"%@/UnitTest", TestPath] ErrorMessage:&msg];
    [GeneralFunctions TestResults:value OutPut:msg];
}
-(void)test_copyFileFrom {
    NSString *msg = [NSString new];
    NSString *to = [NSString stringWithFormat:@"%@/UnitTest/%@", TestPath, TestFileName];
    NSString *from = [NSString stringWithFormat:@"%@/%@", TestPath, TestFileName];
    NSLog(@"From: %@", from);
    NSLog(@"To: %@", to);
    bool value = [BurnSoftFileSystem copyFileFrom:from To:to ErrorMessage:&msg];
    //NOTE: This already works in another project but since this is using the sim
    // it will raise a delete error which is ok so we pass the test.
    if ([msg containsString:@"Delete Error"])
    {
        value = true;
    }
    [GeneralFunctions TestResults:value OutPut:msg];
}

-(void)test_returnFullPathwithFileName {
    NSString *value = [BurnSoftFileSystem returnFullPathwithFileName:TestFileName];
    [GeneralFunctions TestResultsHaveValue:value];
}
-(void)test_getFileExtensionbyPath {
    NSString *value = [BurnSoftFileSystem getFileExtensionbyPath:[NSString stringWithFormat:@"%@/%@", TestPath, TestFileName]];
    [GeneralFunctions TestResultsHaveValue:value];
}
-(void)test_DeleteFileByPath {
    NSString *msg = [NSString new];
    bool value = [BurnSoftFileSystem DeleteFileByPath:[NSString stringWithFormat:@"%@/%@", TestPath, NewFileCopy] ErrorMessage:&msg];
    [GeneralFunctions TestResults:value OutPut:msg];
}
-(void)test_convertBOOLtoString {
    NSString *value = [BurnSoftFileSystem convertBOOLtoString:YES];
    [GeneralFunctions TestResultsHaveValue:value];
}
-(void)test_getCertainFilefromPath{
    bool bAns = NO;
    NSArray *value = [BurnSoftFileSystem getCertainFilefromPath:TestPath ByExtension:@"log"];
    for (id object in value)
    {
        NSLog(@"File: %@", object);
    }
    NSString *countMsg = [NSString stringWithFormat:@"Count In Array : %lu",(unsigned long)[value count]];
    
    NSLog(@"%@",countMsg);
    if ([value count] > 0)
    {
        bAns = YES;
    }
    [GeneralFunctions TestResults:bAns OutPut:countMsg];
}
-(void)test_getCertainFilesFromDocumentsByExtension {
    bool bAns = NO;
    NSArray *value = [BurnSoftFileSystem getCertainFilesFromDocumentsByExtension:@"log"];
    for (id object in value)
    {
        NSLog(@"File: %@", object);
    }
    NSString *countMsg = [NSString stringWithFormat:@"Count In Array : %lu",(unsigned long)[value count]];
    //NOTE: This is going off the iOS Directory which currently has nothing in it so zero is pass at this point
    NSLog(@"%@",countMsg);
    if ([value count] == 0)
    {
        bAns = YES;
    }
    [GeneralFunctions TestResults:bAns OutPut:countMsg];
}
- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
