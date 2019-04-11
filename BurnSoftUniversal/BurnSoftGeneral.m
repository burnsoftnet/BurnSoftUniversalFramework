//
//  BurnSoftGeneral.m
//  BurnSoftGeneral
//
//  Created by burnsoft on 1/31/17.
//  Copyright © 2017 burnsoft. All rights reserved.
//

#import "BurnSoftGeneral.h"

@implementation BurnSoftGeneral

#pragma mark Fluff Content String
/*! @briefThis will Fluff/Prep the string for inserting value into a database
    It will mostly take out things that can conflict, such as the single qoute
 */
+(NSString *) FCString: (NSString *) sValue {
    NSString *sAns = [NSString new];
    sAns = [sValue stringByReplacingOccurrencesOfString:@"'" withString:@"''"];
    sAns = [sAns stringByReplacingOccurrencesOfString:@"`" withString:@"''"];
    sAns = [sAns stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    return sAns;
}

#pragma mark Fluff Content String for XML
/*! @briefThis will Fluff/Prep the string for inserting value into a database and XML File
    It will mostly take out things that can conflict, such as the single qoute
 */
+(NSString *) FCStringXML: (NSString *) sValue {
    NSString *sAns = [NSString new];
    sAns = [sValue stringByReplacingOccurrencesOfString:@"'" withString:@"''"];
    sAns = [sAns stringByReplacingOccurrencesOfString:@"`" withString:@"''"];
    sAns = [sAns stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"];
    sAns = [sAns stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    return sAns;
}

#pragma mark Fluff Content String to Long
/*! @brief This will convert a string into a long value
 */
+(unsigned long) FCLong:(NSString *) sValue;{
    NSUInteger uAns = [sValue longLongValue];
    unsigned long iAns = uAns;
    return iAns;
}

#pragma mark Get Value from Long String
/*! @brief This will get the value that is store in a long string
    Pass the string, the common seperater, and the ares it should be located at
    @code
    sValue = @"brown,cow,how,two"
    mySeperator = @","
    myIndex = 2
    Result = @"how"
    @endcode
 */
+(NSString *)getValueFromLongString:(NSString *)sValue Separater:(NSString *)mySeparater AtIndex:(NSInteger) myIndex
{
    NSString *sAns = [NSString new];
    NSArray *myArray = [sValue componentsSeparatedByString:mySeparater];
    sAns = [myArray objectAtIndex:myIndex];
    return sAns;
}

#pragma mark Count Characters
/*! @briefThis will return the number of characters in a string
 */
+(unsigned long) CountCharacters:(NSString *)sValue{
    NSUInteger uAns = [sValue length];
    unsigned long iAns = uAns;
    return iAns;
}

#pragma mark Is Numeric
/*! @brief This will return true if the value is a number, false if it isn't
*/
+(BOOL) isNumeric :(NSString *) sValue
{
    static BOOL bAns = NO;
    NSScanner *scanner = [NSScanner scannerWithString:sValue];
    if ([sValue length] != 0)
    {
        if ([scanner scanInteger:NULL] && [scanner isAtEnd])
        {
            bAns = YES;
        }
    } else {
        bAns = YES;
    }
    return bAns;
}


#pragma mark Convert String to NSNumber
/*! @brief Convert a string to NSNumber
*/
+(NSNumber *) convertToNSNumberByString:(NSString *) sValue
{
    NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
    f.numberStyle = NSNumberFormatterDecimalStyle;
    NSNumber *nNumber = [f numberFromString:sValue];
    return nNumber;
}

#pragma mark Convert Boolean to String
/*! @brief  Convert the boolen to a string yes or No
 @return yes or no as string
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

#pragma mark Convert String to Boolean
/*!
 @brief: Converts a string to a boolean value, if the string is "yes/Yes/y/Y/YES/TRUE/True/true then it will return YES
 Otherwise it will return NO/FALSE;
 */
+(BOOL) convertStringToBool:(NSString *) value
{
    BOOL bAns = NO;
    if ((value == @"yes") || (value==@"y") || (value==@"Yes") || (value==@"Y") || (value==@"true") || (value==@"True") || (value==@"YES")|| (value==@"TRUE"))
    {
        bAns = YES;
    }
    
    return bAns;
}
@end
