//
//  BurnSoftMathTests.m
//  BurnSoftUniversalTests
//
//  Created by burnsoft on 11/14/18.
//  Copyright © 2018 burnsoft. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <BurnSoftUniversal/BurnSoftMath.h>
#import "GeneralFunctions.h"

@interface BurnSoftMathTests : XCTestCase

@end

@implementation BurnSoftMathTests
{
    NSMutableArray *myValues;
}
- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    myValues = [NSMutableArray new];
    [myValues addObject:@"1100"];
    [myValues addObject:@"1110"];
    [myValues addObject:@"1120"];
    [myValues addObject:@"1130"];
    [myValues addObject:@"1140"];
    [myValues addObject:@"1150"];
    [myValues addObject:@"1160"];
    [myValues addObject:@"1170"];
    
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)test_getPricePerItem {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    double value = [BurnSoftMath getPricePerItem:@"19.99" QTY:@"50"];
    [GeneralFunctions TestResultsHaveValueGreaterThanZeroDbl:value];
}


- (void)test_multiplyTwoItems {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    int value = [BurnSoftMath multiplyTwoItems:@"2" itemTwo:@"2"];
    [GeneralFunctions TestResultsHaveValueGreaterThanZeroInt:value];
}

- (void)test_multiplyTwoItems2DecDouble {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    double value = [BurnSoftMath multiplyTwoItems2DecDouble:@"1.5" itemTwo:@"1.5"];
    [GeneralFunctions TestResultsHaveValueGreaterThanZeroDbl:value];
}
- (void)test_multiplyTwoItemsFullDouble {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    double value = [BurnSoftMath multiplyTwoItemsFullDouble:@"1.5" itemTwo: @"1.5"];
    [GeneralFunctions TestResultsHaveValueGreaterThanZeroDbl:value];
}

- (void)test_AddTwoItemsAsInteger {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    int value = [BurnSoftMath AddTwoItemsAsInteger:@"2" itemTwo:@"2"];
    [GeneralFunctions TestResultsHaveValueGreaterThanZeroInt:value];
}

- (void)test_AddTwoItemsAsDouble {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    double value = [BurnSoftMath AddTwoItemsAsDouble:@"1.5" itemTwo: @"1.5"];
    [GeneralFunctions TestResultsHaveValueGreaterThanZeroDbl:value];
}
-(void)test_convertDoubleToString {
    NSString *value = [BurnSoftMath convertDoubleToString:5.5];
    [GeneralFunctions TestResultsHaveValue:value];
}
- (void)test_getPricePerItemString {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    NSString *value = [BurnSoftMath getPricePerItemString:@"19.99" QTY:@"50"];
    [GeneralFunctions TestResultsHaveValue:value];
}

- (void)test_multiplyTwoItemsString {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    NSString *value = [BurnSoftMath multiplyTwoItemsString:@"1.5" itemTwo:@"1.5"];
    [GeneralFunctions TestResultsHaveValue:value];
}

- (void)test_multiplyTwoItems2DecDoubleString {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    NSString *value = [BurnSoftMath multiplyTwoItems2DecDoubleString:@"1.5" itemTwo: @"1.5"];
    [GeneralFunctions TestResultsHaveValue:value];
}

- (void)test_multiplyTwoItemsFullDoubleString {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    NSString *value = [BurnSoftMath multiplyTwoItemsFullDoubleString:@"1.5" itemTwo: @"1.5"];
    [GeneralFunctions TestResultsHaveValue:value];
}

- (void)test_AddTwoItemsAsIntegerString {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    NSString *value = [BurnSoftMath AddTwoItemsAsIntegerString:@"1.5" itemTwo: @"1.5"];
    [GeneralFunctions TestResultsHaveValue:value];
}

- (void)test_AddTwoItemsAsDoubleString {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    NSString *value = [BurnSoftMath AddTwoItemsAsDoubleString:@"1.5" itemTwo: @"1.5"];
    [GeneralFunctions TestResultsHaveValue:value];
}
-(void) test_averageOf {
    NSNumber *value = [BurnSoftMath averageOf:myValues];
    [GeneralFunctions TestResultsHaveValueGreaterThanZeroNSNumber:value];
}
-(void) test_getStandardDeviation {
    NSNumber *value = [BurnSoftMath getStandardDeviation:myValues];
    [GeneralFunctions TestResultsHaveValueGreaterThanZeroNSNumber:value];
}

@end
