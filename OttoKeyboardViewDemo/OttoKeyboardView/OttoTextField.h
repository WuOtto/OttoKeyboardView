//
//  OttoTextField.h
//  OttoKeyboardView
//
//  Created by otto on 2018/1/24.
//  Copyright © 2018年 otto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KeyboardView.h"

/** KeyboardType键盘类型
 *
 *  系统默认键盘:KeyboardTypeDefault
 *  自定义键盘:KeyboardTypeNumber
 */
typedef NS_ENUM(NSInteger,KeyboardType) {
    KeyboardTypeDefault = 0,  // 系统默认键盘
    KeyboardTypeNumber = 1   // 自定义键盘
};

@protocol TextFieldClickReturnDelegate;

@interface OttoTextField : UITextField

@property (nonatomic,assign) NumberKeyboardType NumberKeyboardType;

@property (nonatomic,weak) id <TextFieldClickReturnDelegate> textFieldClickReturnDelegate;

- (void)setKeyboardType:(KeyboardType)keyboardType;

@end

@protocol TextFieldClickReturnDelegate <NSObject>

- (void)textFieldClickReturn:(OttoTextField *)textField;

@end

@interface UITextField (ExtentRange)

- (NSRange)selectedRange;

- (void)setSelectedRange:(NSRange)range;

@end
