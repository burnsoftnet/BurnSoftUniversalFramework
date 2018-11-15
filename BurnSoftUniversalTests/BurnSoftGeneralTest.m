//
//  BurnSoftGeneralTest.m
//  BurnSoftUniversalTests
//
//  Created by burnsoft on 11/12/18.
//  Copyright © 2018 burnsoft. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <BurnSoftUniversal/BurnSoftGeneral.h>
#import "GeneralFunctions.h"

@interface BurnSoftGeneralTest : XCTestCase

@end

@implementation BurnSoftGeneralTest

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)test_FCString {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    NSString *value = [BurnSoftGeneral FCString:@"double'qoute'test"];
    [GeneralFunctions TestResultsHaveValue:value];
}
- (void)test_FCStringXML {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    NSString *value = [BurnSoftGeneral FCStringXML:@"XML & Type's Format & stuff"];
    [GeneralFunctions TestResultsHaveValue:value];
}

- (void)test_FCLong {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    unsigned long value = [BurnSoftGeneral FCLong:@"1024"];
    [GeneralFunctions TestResultsHaveValueGreaterThanZero:value];
}

-(void) test_getValueFromLongString{
    NSString *value = [BurnSoftGeneral getValueFromLongString:@"1,2,3,4,5" Separater:@"," AtIndex:4];
    [GeneralFunctions TestResultsHaveValue:value];
}

-(void) test_CountCharacters{
    unsigned long value = [BurnSoftGeneral CountCharacters:@"123456789"];
    [GeneralFunctions TestResultsHaveValueGreaterThanZero:value];
}

-(void) test_isNumeric{
    NSString *myValue = @"4";
    bool value = [BurnSoftGeneral isNumeric: myValue];
    [GeneralFunctions TestResults:value OutPut:myValue];
}

-(void) test_convertToNSNumberByString{
    NSString *myValue = @"4";
    NSNumber *value = [BurnSoftGeneral convertToNSNumberByString:myValue];
    [GeneralFunctions TestResults:value OutPut:myValue];
}

-(void) test_convertBOOLtoString{
    NSString *value = [BurnSoftGeneral convertBOOLtoString:YES];
    [GeneralFunctions TestResultsHaveValue:value];
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
