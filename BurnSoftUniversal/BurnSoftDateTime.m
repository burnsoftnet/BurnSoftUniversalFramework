//
//  BurnSoftDateTime.m
//  BurnSoftUniversal
//
//  Created by burnsoft on 11/1/18.
//  Copyright © 2018 burnsoft. All rights reserved.
//

#import "BurnSoftDateTime.h"

@implementation BurnSoftDateTime
/*! @brief  Gets the current Date and Time in a certain format
    @return yyyy-MM-dd HH:mm:ss as string
 */
+(NSString *) getCurrentDateTime
{
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    return [dateFormatter stringFromDate:[NSDate date]];
}

#pragma mark Format Date
    /*! @brief Format date to mm/dd/yyyy
     */
+(NSString *)formatDate:(NSDate *)date
    {
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateStyle:NSDateFormatterShortStyle];
        [dateFormatter setDateFormat:@"MM'/'dd'/'yyyy"];
        NSString *formattedDate = [dateFormatter stringFromDate:date];
        return formattedDate;
    }
#pragma mark Format Date and Time Long By Provided DateTime
    /*! @brief Pass a Date and Time Stampe and have it returned in a connected format
     */
+(NSString *)formatLongConnectedByDateAndTIme:(NSDate *)mydate
    {
        NSString *sAns = [NSString new];
        NSDateFormatter *dateFormatter=[NSDateFormatter new];
        [dateFormatter setDateFormat:@"yyyy-MM-dd_HH_mm_ss"];
        //[dateFormatter stringFromDate:[NSDate date]
        sAns = [NSString stringWithFormat:@"%@",[dateFormatter stringFromDate:mydate]];
        return sAns;
    }
#pragma mark Format Date and Time Long By Current DateTime
    /*! @brief  Get the Current Date and Time Stampe and have it returned in a connected format
     */
+(NSString *)formatLongConnectedDateTimeStamp
    {
        NSString *sAns = [NSString new];
        NSDateFormatter *dateFormatter=[NSDateFormatter new];
        [dateFormatter setDateFormat:@"yyyy-MM-dd_HH_mm_ss"];
        
        sAns = [NSString stringWithFormat:@"%@",[dateFormatter stringFromDate:[NSDate date]]];
        
        return sAns;
    }
@end
