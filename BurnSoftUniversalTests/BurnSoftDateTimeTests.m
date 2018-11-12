//
//  BurnSoftDateTime.m
//  BurnSoftUniversalTests
//
//  Created by burnsoft on 11/11/18.
//  Copyright © 2018 burnsoft. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <BurnSoftUniversal/BurnSoftDateTime.h>



@interface BurnSoftDateTimeTests : XCTestCase

@end

@implementation BurnSoftDateTimeTests

- (void) TestResults:(bool) value OutPut:(NSString *) output
{
    NSLog(@"Test Output: %@",output);
    XCTAssertTrue(value);
}
-(void) TestResultsHaveValue:(NSString *) value
{
    bool bValue = NO;
    if ([value length] > 0)
    {
        bValue = YES;
    }
    [self TestResults:bValue OutPut:value];
}
    
- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)test_getCurrentDateTime {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    NSString *DateTimeStamp = [BurnSoftDateTime getCurrentDateTime];
    [self TestResultsHaveValue:DateTimeStamp];
}

-(void)test_formatLongConnectedDateTimeStamp {
    NSString *DateTimeStamplong = [BurnSoftDateTime formatLongConnectedDateTimeStamp];
    [self TestResultsHaveValue:DateTimeStamplong];
}
- (void)test_formatDate
{
    NSString *newDate = [BurnSoftDateTime formatDate:[NSDate date]];
    [self TestResultsHaveValue:newDate];
}
- (void) test_formatLongConnectedByDateAndTIme {
    NSString *newDate = [BurnSoftDateTime formatLongConnectedByDateAndTIme:[NSDate date]];
    [self TestResultsHaveValue:newDate];
}
- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
