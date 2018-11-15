//
//  GeneralFunctions.h
//  BurnSoftUniversalTests
//
//  Created by burnsoft on 11/12/18.
//  Copyright © 2018 burnsoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <XCTest/XCTest.h>
NS_ASSUME_NONNULL_BEGIN

@interface GeneralFunctions : XCTestCase
+(void) TestResults:(bool) value OutPut:(NSString *) output;
+(void) TestResultsHaveValue:(NSString *) value;
+(void) TestResultsHaveValue:(NSString *) value ErrorMessage:(NSString *) errMsg;
+(void) TestResultsHaveValueGreaterThanZero:(unsigned long) value;
@end

NS_ASSUME_NONNULL_END
