//
//  BurnSoftDateTime.h
//  BurnSoftUniversal
//
//  Created by burnsoft on 11/1/18.
//  Copyright © 2018 burnsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BurnSoftDateTime : NSObject

+(NSString *) getCurrentDateTime;
+(NSString *)formatDate:(NSDate *)date;
+(NSString *)formatLongConnectedByDateAndTIme:(NSDate *)mydate;
+(NSString *)formatLongConnectedDateTimeStamp;

@end

NS_ASSUME_NONNULL_END
