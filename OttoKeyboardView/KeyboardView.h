//
//  KeyboardView.h
//  OttoKeyboardView
//
//  Created by otto on 2018/1/24.
//  Copyright © 2018年 otto. All rights reserved.
//

#import <UIKit/UIKit.h>

/** NumberKeyboardType自定义键盘类型
 *
 *  纯数字键盘:      NumberKeyboardNumber
 *  小数点键盘:      NumberKeyboardDouble
 *  身份证键盘:      NumberKeyboardCertNo
 *  十六进制键盘:     NumberKeyboardTypeHEX
 *  随机数键盘:      NumberKeyboardTypeHEX
 */
typedef NS_ENUM(NSInteger,NumberKeyboardType) {
    NumberKeyboardTypeNumber = 0,
    NumberKeyboardTypeDouble,
    NumberKeyboardTypeCertNo,
    NumberKeyboardTypeHEX,
    NumberKeyboardTypeRandom
};

@protocol KeyboardViewDelegate;

@interface KeyboardView : UIView

@property (nonatomic, weak) id<KeyboardViewDelegate> delegate;

- (void)createdKeyboard;

@end

@protocol KeyboardViewDelegate <NSObject>

/** 点击删除按钮 */
- (BOOL)textFieldShouldDelete:(KeyboardView *)numberKeyboard;
/** 点击键盘输入相应数字及特殊字符 */
- (void)numberKeyboard:(KeyboardView *)numberKeyboard replacementString:(NSString *)string;
/** 获取键盘类型 */
- (NumberKeyboardType)numberKeyboardType:(KeyboardView *)numberKeyboard;
/** 点击清除按钮 */
- (BOOL)textFieldShouldClear:(KeyboardView *)numberKeyboard;
/** 点击空格按钮 */
- (BOOL)textFieldShouldSpace:(KeyboardView *)numberKeyboard;
/** 点击回车按钮 */
- (BOOL)textFieldShouldReturn:(KeyboardView *)numberKeyboard;
@end
