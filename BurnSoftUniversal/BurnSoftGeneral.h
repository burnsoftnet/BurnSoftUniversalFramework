//
//  BurnSoftGeneral.h
//  BurnSoftGeneral
//
//  Created by burnsoft on 1/31/17.
//  Copyright © 2017 burnsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BurnSoftGeneral : NSObject

#pragma mark Fluff Content String
+(NSString *) FCString:(NSString *) sValue;

#pragma mark Fluff Content String for XML
+(NSString *) FCStringXML: (NSString *) sValue;

#pragma mark Fluff Content String to Long
+(unsigned long) FCLong:(NSString *) sValue;

#pragma mark Get Value from Long String
+(NSString *)getValueFromLongString:(NSString *)sValue Separater:(NSString *)mySeparater AtIndex:(NSInteger) myIndex;

#pragma mark Count Characters
+(unsigned long) CountCharacters:(NSString *) sValue;

#pragma mark Is Numeric
+(BOOL) isNumeric :(NSString *) sValue;

#pragma mark Convert String to NSNumber
+(NSNumber *) convertToNSNumberByString:(NSString *) sValue;

#pragma mark Convert Boolean to String
+(NSString *) convertBOOLtoString:(BOOL) bValue;

#pragma mark Convert String to Boolean
+(BOOL) convertStringToBool:(NSString *) value;
@end
