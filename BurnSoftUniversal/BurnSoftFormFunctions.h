//
//  BurnSoftFormFunctions.h
//  BurnSoftUniversal
//
//  Created by burnsoft on 8/12/17.
//  Copyright © 2017 burnsoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BurnSoftFormFunctions : UIViewController
#pragma mark Textbox View Layouts
+(void) setBordersTextView :(UITextView *) myObj;

#pragma mark Textbox Layout
+(void) setBorderTextBox :(UITextField *) myObj;

#pragma mark Label Borders
+(void) setBorderLabel :(UILabel *) myObj;

#pragma mark Common Alert/Message Handling
-(void)sendMessage:(NSString *) msg MyTitle:(NSString *) mytitle ViewController:(UIViewController *) MyViewController;

@end
