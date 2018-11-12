//
//  BurnSoftMath.h
//  BurnSoftMath
//
//  Created by burnsoft on 1/31/17.
//  Copyright © 2017 burnsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BurnSoftMath : NSObject

#pragma mark Get Price Per Item
+(double)getPricePerItem:(NSString *) price QTY:(NSString *) qty;

#pragma mark Multiply Two Items
+(int) multiplyTwoItems:(NSString *) itemOne itemTwo:(NSString *) itemTwo;

#pragma markMultiply Two Items as Double Two Decimals
+(double) multiplyTwoItems2DecDouble:(NSString *) itemOne itemTwo:(NSString *) itemTwo;

#pragma markMultiply Two Items as Double
+(double) multiplyTwoItemsFullDouble:(NSString *) itemOne itemTwo:(NSString *) itemTwo;

#pragma mark Add two Values as Integer
+(int) AddTwoItemsAsInteger:(NSString *) itemOne itemTwo:(NSString *) itemTwo;

#pragma mark Add Two Values as Double
+(double) AddTwoItemsAsDouble:(NSString *) itemOne itemTwo:(NSString *) itemTwo;

#pragma mark Convert Double To String
+(NSString *)convertDoubleToString :(double) dValue;

#pragma mark Get Price per item as String
+(NSString *)getPricePerItemString :(NSString *) price QTY:(NSString *) qty;

#pragma mark Multiply Two Strings to Return String
+(NSString *) multiplyTwoItemsString :(NSString *) itemOne itemTwo:(NSString *) itemTwo;

#pragma mark  Multiply Two Strings to Return Double Two Decimals
+(NSString *) multiplyTwoItems2DecDoubleString:(NSString *) itemOne itemTwo:(NSString *) itemTwo;

#pragma mark Multiply To Items to return as Full Double String Values
+(NSString *) multiplyTwoItemsFullDoubleString:(NSString *) itemOne itemTwo:(NSString *) itemTwo;

#pragma mark Add Two Strings as Integers
+(NSString *) AddTwoItemsAsIntegerString:(NSString *) itemOne itemTwo:(NSString *) itemTwo;

#pragma mark Add Two Strings as Double Two Decimal
+(NSString *) AddTwoItemsAsDoubleString:(NSString *) itemOne itemTwo:(NSString *) itemTwo;

#pragma mark Get the Average
+(NSNumber *)averageOf:(NSArray *)data;

#pragma mark Get Standard Devisation
+(NSNumber *) getStandardDeviation:(NSArray*) data;
@end
