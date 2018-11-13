//
//  BurnSoftDateTime.m
//  BurnSoftUniversalTests
//
//  Created by burnsoft on 11/11/18.
//  Copyright © 2018 burnsoft. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <BurnSoftUniversal/BurnSoftDateTime.h>
#import "GeneralFunctions.h"


@interface BurnSoftDateTimeTests : XCTestCase

@end

@implementation BurnSoftDateTimeTests
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
    [GeneralFunctions TestResultsHaveValue:DateTimeStamp];
}

-(void)test_formatLongConnectedDateTimeStamp {
    NSString *DateTimeStamplong = [BurnSoftDateTime formatLongConnectedDateTimeStamp];
    [GeneralFunctions TestResultsHaveValue:DateTimeStamplong];
}
- (void)test_formatDate
{
    NSString *newDate = [BurnSoftDateTime formatDate:[NSDate date]];
    [GeneralFunctions TestResultsHaveValue:newDate];
}
- (void) test_formatLongConnectedByDateAndTIme {
    NSString *newDate = [BurnSoftDateTime formatLongConnectedByDateAndTIme:[NSDate date]];
    [GeneralFunctions TestResultsHaveValue:newDate];
}
- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
