//
//  KeyboardView.m
//  OttoKeyboardView
//
//  Created by otto on 2018/1/24.
//  Copyright © 2018年 otto. All rights reserved.
//

#import "KeyboardView.h"
#import "KeyboardButton.h"
#import "OttoKeyboardView.h"

#define screenHeight [UIScreen mainScreen].bounds.size.height
#define SafeAreaBottomHeight (screenHeight == 812.0 ? 34 : 0)

@interface KeyboardView ()

@property (nonatomic,copy) NSArray *keyboardTitle;

@end

@implementation KeyboardView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = UIColorFrom255RGB(206, 207, 208);
        self.frame = CGRectMake(0, KHeight - 216 - SafeAreaBottomHeight, KWidth, 216 + SafeAreaBottomHeight);
    }
    return self;
}

- (void)createdKeyboard {
    if ([self.delegate numberKeyboardType:self] == NumberKeyboardTypeCertNo) {
        self.keyboardTitle = [self keyboardTypeCertNoButtonTitle];
    } else if ([self.delegate numberKeyboardType:self] == NumberKeyboardTypeNumber){
        self.keyboardTitle = [self keyboardTypeNumberButtonTitle];
    }else if ([self.delegate numberKeyboardType:self] == NumberKeyboardTypeDouble) {
        self.keyboardTitle = [self keyboardTypeDoubleButtonTitle];
    }else if([self.delegate numberKeyboardType:self] == NumberKeyboardTypeRandom){
        self.keyboardTitle = [self keyboardTypeRandomButtonTitle];
    }else if ([self.delegate numberKeyboardType:self] == NumberKeyboardTypeHEX){
        self.keyboardTitle = [self keyboardTypeHEXButtonTitle];
        CGFloat buttonWidth = (KWidth - 1.5) / 5;
        CGFloat top = 0;
        for (NSInteger index = 0; index < 20; index ++) {
            if (index == 17) {
                KeyboardButton * button = [[KeyboardButton alloc] initWithFrame:(CGRect){(11 % 3) * (buttonWidth+0.5),top+(11 / 3) * 54,buttonWidth,54}];
                [button.button setImage:[UIImage imageNamed:@"keyboard_delete"] forState:UIControlStateNormal];
                [button.button setBackgroundImage:[KeyboardButton imageColor:UIColorFromHex(0xE7E8E9)] forState:UIControlStateNormal];
                [button.button setBackgroundImage:[KeyboardButton imageColor:UIColorFromHex(0xf7f7f7)] forState:UIControlStateHighlighted];
                [button.button addTarget:self action:@selector(deleteButtonOnclick:) forControlEvents:UIControlEventTouchUpInside];
                UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(deleteBtnLongPress:)];
                [button.button addGestureRecognizer:longPress];
                [self addSubview:button];
                continue;
            }
            KeyboardButton * button = [[KeyboardButton alloc] initWithFrame:(CGRect){(index % 5) * (buttonWidth+0.5),top+(index / 5) * 54,buttonWidth,54}];
            button.tag = 1000 + index;
            
            if (index == 15 || index == 18 || index == 19) {
                button.button.titleLabel.font = [UIFont systemFontOfSize:18.0];
                switch (index) {
                    case 15:
                    {
                        [button.button addTarget:self action:@selector(clearButtonOnclick:) forControlEvents:UIControlEventTouchUpInside];
                    }
                        break;
                    case 18:
                    {
                        [button.button addTarget:self action:@selector(spaceButtonOnclick:) forControlEvents:UIControlEventTouchUpInside];
                    }
                        break;
                    case 19:
                    {
                        [button.button addTarget:self action:@selector(returnButtonOnclick:) forControlEvents:UIControlEventTouchUpInside];
                    }
                        break;
                    default:
                        break;
                }
            }else{
                button.button.titleLabel.font = [UIFont systemFontOfSize:20.0];
                [button.button addTarget:self action:@selector(keyButtonOnclick:) forControlEvents:UIControlEventTouchUpInside];
            }
            [button setButtonTitle:self.keyboardTitle[index]];
            
            [self addSubview:button];
        }
        return;
    }
    
    CGFloat buttonWidth = (KWidth - 1.5) / 3;
    CGFloat top = 0;
    for (NSInteger index = 0; index < 11; index ++) {
        KeyboardButton * button = [[KeyboardButton alloc] initWithFrame:(CGRect){(index % 3) * (buttonWidth+0.5),top+(index / 3) * 54,buttonWidth,54}];
        button.tag = 1000 + index;
        if ([self.delegate numberKeyboardType:self] == NumberKeyboardTypeNumber && index == 9) {
            button.button.enabled = NO;
            [button.button setTitleColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.1] forState:UIControlStateNormal];
            [button.button setBackgroundImage:[KeyboardButton imageColor:UIColorFromHex(0xE7E8E9)] forState:UIControlStateNormal];
        }
        if ([self.delegate numberKeyboardType:self] != NumberKeyboardTypeRandom) {
            [button.button setBackgroundImage:[KeyboardButton imageColor:UIColorFromHex(0xf7f7f7)] forState:UIControlStateNormal];
            [button.button setBackgroundImage:[KeyboardButton imageColor:UIColorFromHex(0xE7E8E9)] forState:UIControlStateHighlighted];
        }else{
            if (index == 9) {
                button.button.titleLabel.font = [UIFont systemFontOfSize:16.0];
            }else{
                button.button.titleLabel.font = [UIFont systemFontOfSize:20.0];
            }
            
            [button.button setBackgroundImage:nil forState:UIControlStateNormal];
            [button.button setBackgroundImage:nil forState:UIControlStateHighlighted];
        }
        [button setButtonTitle:self.keyboardTitle[index]];
        
        if ([self.delegate numberKeyboardType:self] == NumberKeyboardTypeRandom && index == 9) {
            [button.button addTarget:self action:@selector(returnButtonOnclick:) forControlEvents:UIControlEventTouchUpInside];
        }else{
            [button.button addTarget:self action:@selector(keyButtonOnclick:) forControlEvents:UIControlEventTouchUpInside];
        }
        [self addSubview:button];
    }
    
    KeyboardButton * button = [[KeyboardButton alloc] initWithFrame:(CGRect){(11 % 3) * (buttonWidth+0.5),top+(11 / 3) * 54,buttonWidth,54}];
    [button.button setImage:[UIImage imageNamed:@"keyboard_delete"] forState:UIControlStateNormal];
    [button.button setBackgroundImage:[KeyboardButton imageColor:UIColorFromHex(0xE7E8E9)] forState:UIControlStateNormal];
    [button.button setBackgroundImage:[KeyboardButton imageColor:UIColorFromHex(0xf7f7f7)] forState:UIControlStateHighlighted];
    [button.button addTarget:self action:@selector(deleteButtonOnclick:) forControlEvents:UIControlEventTouchUpInside];
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(deleteBtnLongPress:)];
    [button.button addGestureRecognizer:longPress];
    [self addSubview:button];
}

- (NSArray *)keyboardTypeCertNoButtonTitle {
    return @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"X",@"0",@""];
}

- (NSArray *)keyboardTypeDoubleButtonTitle {
    return @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@".",@"0",@""];
}

- (NSArray *)keyboardTypeNumberButtonTitle {
    return @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"",@"0",@""];
}

- (NSArray *)keyboardTypeHEXButtonTitle {
    return @[@"7",@"8",@"9",@"A",@"B",@"4",@"5",@"6",@"C",@"D",@"1",@"2",@"3",@"E",@"F",@"clear",@"0",@"",@"space",@"return"];
}

- (NSArray *)keyboardTypeRandomButtonTitle {
    NSMutableArray *arr = [NSMutableArray array];
    for (NSInteger i = 0; i < 10; i++) {
        while (1) {
            NSInteger titleNum = arc4random()%10;
            NSString *titltString = [NSString stringWithFormat:@"%ld",(long)titleNum];
            
            if (![arr containsObject:titltString] ) {
                [arr addObject:titltString];
                break;
            }
            if (arr.count == 10) {
                break;
            }
        }
    }
    
    [arr insertObject:@"完成" atIndex:9];
    [arr addObject:@""];
    return arr;
}

- (void)keyButtonOnclick:(UIButton *) button {
    if([self.delegate respondsToSelector:@selector(numberKeyboard:replacementString:)]) {
        NSInteger index = [button.superview tag] - 1000;
        if (self.keyboardTitle.count > index) {
            [self.delegate numberKeyboard:self replacementString:self.keyboardTitle[index]];
        }
    }
}

- (void)deleteButtonOnclick:(UIButton *) button {
    [self.delegate textFieldShouldDelete:self];
}

- (void)clearButtonOnclick:(UIButton *) button {
    [self.delegate textFieldShouldClear:self];
}

- (void)spaceButtonOnclick:(UIButton *) button {
    [self.delegate textFieldShouldSpace:self];
}

- (void)returnButtonOnclick:(UIButton *) button {
    [self.delegate textFieldShouldReturn:self];
}

- (void)deleteBtnLongPress:(UILongPressGestureRecognizer *)longPress{
    //    if (longPress.state == UIGestureRecognizerStateEnded) {
    [self.delegate textFieldShouldClear:self];
    //    }
}

@end
