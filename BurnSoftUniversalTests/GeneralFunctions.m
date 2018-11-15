//
//  GeneralFunctions.m
//  BurnSoftUniversalTests
//
//  Created by burnsoft on 11/12/18.
//  Copyright © 2018 burnsoft. All rights reserved.
//

#import "GeneralFunctions.h"
#import <XCTest/XCTest.h>

@implementation GeneralFunctions
+(void) TestResults:(bool) value OutPut:(NSString *) output
{
    NSLog(@"Test Output: %@",output);
    XCTAssertTrue(value);
}
+(void) TestResultsHaveValue:(NSString *) value
{
    bool bValue = NO;
    if ([value length] > 0)
    {
        bValue = YES;
    }
    [self TestResults:bValue OutPut:value];
}
+(void) TestResultsHaveValue:(NSString *) value ErrorMessage:(NSString *) errMsg
{
    bool bValue = NO;
    if ([errMsg length] > 0)
    {
        NSLog(@"%@",errMsg);
    } else {
        if ([value length] > 0)
        {
            bValue = YES;
        }
    }
    [self TestResults:bValue OutPut:value];
}
+(void) TestResultsHaveValueGreaterThanZero:(unsigned long) value
{
    bool bValue = NO;
    if ( value > 0){
        bValue = YES;
    }
    [self TestResults:bValue OutPut:[NSString stringWithFormat:@"%lu", value]];
}

+(void) TestResultsHaveValueGreaterThanZeroNSNumber:(NSNumber *) value
{
    bool bValue = NO;
    if ( value > 0){
        bValue = YES;
    }
    [self TestResults:bValue OutPut:[NSString stringWithFormat:@"%@", value]];
}

+(void) TestResultsHaveValueGreaterThanZeroDbl:(double) value
{
    bool bValue = NO;
    if ( value > 0){
        bValue = YES;
    }
    [self TestResults:bValue OutPut:[NSString stringWithFormat:@"%f", value]];
}

+(void) TestResultsHaveValueGreaterThanZeroInt:(int) value
{
    bool bValue = NO;
    if ( value > 0){
        bValue = YES;
    }
    [self TestResults:bValue OutPut:[NSString stringWithFormat:@"%ul", value]];
}
@end
