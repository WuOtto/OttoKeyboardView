//
//  OttoTextView.m
//  OttoKeyboardView
//
//  Created by otto on 2018/1/24.
//  Copyright © 2018年 otto. All rights reserved.
//

#import "OttoTextView.h"

@interface OttoTextView ()<KeyboardViewDelegate>
{
    KeyboardView *numberKeyboard;
}
@end

@implementation OttoTextView

- (void)awakeFromNib{
    [super awakeFromNib];
    numberKeyboard = [[KeyboardView alloc] init];
    self.inputView = numberKeyboard;
    numberKeyboard.delegate = self;
    [numberKeyboard createdKeyboard];
}

- (instancetype)initWithFrame:(CGRect)frame {
    if ( self = [super initWithFrame:frame]) {
        [self awakeFromNib];
    }
    return self;
}

#pragma mark - BANumberKeyboardDelegate
- (BOOL)textFieldShouldDelete:(KeyboardView *)numberKeyboard {
    BOOL canEditor = YES;
    if ([self.delegate respondsToSelector:@selector(textView:shouldChangeTextInRange:replacementText:)]) {
        canEditor = [self.delegate textView:self shouldChangeTextInRange:self.selectedRange replacementText:@""];
    }
    if (canEditor) {
        [self deleteBackward];
    }
    return canEditor;
}

- (void)numberKeyboard:(KeyboardView *)numberKeyboard replacementString:(NSString *)string {
    BOOL canEditor = YES;
    if ([self.delegate respondsToSelector:@selector(textView:shouldChangeTextInRange:replacementText:)]) {
        canEditor = [self.delegate textView:self shouldChangeTextInRange:self.selectedRange replacementText:string];
    }
    
    if (canEditor) {
        [self replaceRange:self.selectedTextRange withText:string];
    }
}

/** 点击清除按钮 */
- (BOOL)textFieldShouldClear:(KeyboardView *)numberKeyboard{
    BOOL canEditor = YES;
    if ([self.delegate respondsToSelector:@selector(textView:shouldChangeTextInRange:replacementText:)]) {
        canEditor = [self.delegate textView:self shouldChangeTextInRange:self.selectedRange replacementText:@""];
    }
    if (canEditor) {
        [self setText:@""];
    }
    return canEditor;
}
/** 点击空格按钮 */
- (BOOL)textFieldShouldSpace:(KeyboardView *)numberKeyboard{
    BOOL canEditor = YES;
    if ([self.delegate respondsToSelector:@selector(textView:shouldChangeTextInRange:replacementText:)]) {
        canEditor = [self.delegate textView:self shouldChangeTextInRange:self.selectedRange replacementText:@""];
    }
    if (canEditor) {
        [self insertText:@" "];
    }
    
    return canEditor;
}
/** 点击回车按钮 */
- (BOOL)textFieldShouldReturn:(KeyboardView *)numberKeyboard{
    BOOL canEditor = YES;
    if ([self.delegate respondsToSelector:@selector(textView:shouldChangeTextInRange:replacementText:)]) {
        canEditor = [self.delegate textView:self shouldChangeTextInRange:self.selectedRange replacementText:@""];
    }
    if (canEditor) {
        if ([self.textViewClickReturnDelegate respondsToSelector:@selector(textViewClickReturn:)]) {
            [self.textViewClickReturnDelegate textViewClickReturn:self];
        }
    }
    return canEditor;
}

- (void)setTextViewKeyboardType:(TextViewKeyboardType)keyboardType {
    switch (keyboardType) {
        case TextViewKeyboardTypeDefault:
            self.inputView = nil;
            break;
        case TextViewKeyboardTypeNumber:
            self.inputView = numberKeyboard;
            break;
        default:
            break;
    }
}

- (void)setNumberKeyboardType:(NumberKeyboardType)numberKeyboardType {
    _NumberKeyboardType = numberKeyboardType;
    numberKeyboard = [[KeyboardView alloc] init];
    self.inputView = numberKeyboard;
    numberKeyboard.delegate = self;
    [numberKeyboard createdKeyboard];
}

- (NumberKeyboardType)numberKeyboardType:(KeyboardView *)numberKeyboard {
    return self.NumberKeyboardType;
}

@end
