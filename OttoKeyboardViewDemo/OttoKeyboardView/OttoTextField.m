//
//  OttoTextField.m
//  OttoKeyboardView
//
//  Created by otto on 2018/1/24.
//  Copyright © 2018年 otto. All rights reserved.
//

#import "OttoTextField.h"

@interface OttoTextField ()<KeyboardViewDelegate>
{
    KeyboardView *numberKeyboard;
}
@end

@implementation OttoTextField

- (void)awakeFromNib {
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
    if ([self.delegate respondsToSelector:@selector(textField:shouldChangeCharactersInRange:replacementString:)]) {
        canEditor = [self.delegate textField:self shouldChangeCharactersInRange:self.selectedRange replacementString:@""];
    }
    if (canEditor) {
        [self deleteBackward];
    }
    return canEditor;
}

- (void)numberKeyboard:(KeyboardView *)numberKeyboard replacementString:(NSString *)string {
    BOOL canEditor = YES;
    if ([self.delegate respondsToSelector:@selector(textField:shouldChangeCharactersInRange:replacementString:)]) {
        canEditor = [self.delegate textField:self shouldChangeCharactersInRange:self.selectedRange replacementString:string];
    }
    
    if (canEditor) {
        [self replaceRange:self.selectedTextRange withText:string];
    }
}

/** 点击清除按钮 */
- (BOOL)textFieldShouldClear:(KeyboardView *)numberKeyboard{
    BOOL canEditor = YES;
    if ([self.delegate respondsToSelector:@selector(textField:shouldChangeCharactersInRange:replacementString:)]) {
        canEditor = [self.delegate textField:self shouldChangeCharactersInRange:self.selectedRange replacementString:@""];
    }
    if (canEditor) {
        [self setText:@""];
    }
    return canEditor;
}
/** 点击空格按钮 */
- (BOOL)textFieldShouldSpace:(KeyboardView *)numberKeyboard{
    BOOL canEditor = YES;
    if ([self.delegate respondsToSelector:@selector(textField:shouldChangeCharactersInRange:replacementString:)]) {
        canEditor = [self.delegate textField:self shouldChangeCharactersInRange:self.selectedRange replacementString:@""];
    }
    if (canEditor) {
        [self insertText:@" "];
    }
    
    return canEditor;
}
/** 点击回车按钮 */
- (BOOL)textFieldShouldReturn:(KeyboardView *)numberKeyboard{
    BOOL canEditor = YES;
    if ([self.delegate respondsToSelector:@selector(textField:shouldChangeCharactersInRange:replacementString:)]) {
        canEditor = [self.delegate textField:self shouldChangeCharactersInRange:self.selectedRange replacementString:@""];
    }
    if (canEditor) {
        if ([self.textFieldClickReturnDelegate respondsToSelector:@selector(textFieldClickReturn:)]) {
            [self.textFieldClickReturnDelegate textFieldClickReturn:self];
        }
    }
    return canEditor;
}

- (void)setKeyboardType:(KeyboardType)keyboardType {
    switch (keyboardType) {
        case KeyboardTypeDefault:
            self.inputView = nil;
            break;
        case KeyboardTypeNumber:
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
