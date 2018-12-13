//
//  OttoTextView.h
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
typedef NS_ENUM(NSInteger,TextViewKeyboardType) {
    TextViewKeyboardTypeDefault = 0,  // 系统默认键盘
    TextViewKeyboardTypeNumber = 1   // 自定义键盘
};

@protocol TextViewClickReturnDelegate;

@interface OttoTextView : UITextView

@property (nonatomic,assign) NumberKeyboardType NumberKeyboardType;

@property (nonatomic,weak) id <TextViewClickReturnDelegate> textViewClickReturnDelegate;

- (void)setTextViewKeyboardType:(TextViewKeyboardType)keyboardType;

@end

@protocol TextViewClickReturnDelegate <NSObject>

- (void)textViewClickReturn:(OttoTextView *)textView;

@end

@interface UITextView (ExtentRange)

- (NSRange)selectedRange;

- (void)setSelectedRange:(NSRange)range;

@end
