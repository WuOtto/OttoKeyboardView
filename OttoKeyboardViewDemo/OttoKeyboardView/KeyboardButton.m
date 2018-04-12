//
//  KeyboardButton.m
//  OttoKeyboardView
//
//  Created by otto on 2018/1/24.
//  Copyright © 2018年 otto. All rights reserved.
//

#import "KeyboardButton.h"
#import "OttoKeyboardView.h"

@implementation KeyboardButton

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.lineView = [[UIView alloc] initWithFrame:(CGRect){0, 0, frame.size.width, frame.size.height}];
        self.lineView.layer.borderColor = UIColorFrom255RGB(206, 207, 208).CGColor;
        self.lineView.layer.borderWidth = 0.5;
        [self addSubview:self.lineView];
        
        self.button = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.button.titleLabel.font = [UIFont systemFontOfSize:28];
        self.button.frame = CGRectMake(0, 0, frame.size.width, frame.size.height -0.5);
        self.button.backgroundColor = [UIColor colorWithRed:231/255.0 green:232/255.0 blue:233/255.0 alpha:1];
        [self.button setBackgroundImage:[KeyboardButton imageColor:UIColorFromHex(0xf7f7f7)] forState:UIControlStateNormal];
        [self.button setBackgroundImage:[KeyboardButton imageColor:UIColorFromHex(0xE7E8E9)] forState:UIControlStateHighlighted];
        [self addSubview:self.button];
    }
    return self;
}

- (void)setButtonTitle:(NSString *)title {
    [self.button setTitle:title forState:UIControlStateNormal];
}

+ (UIImage *)imageColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineCap(context, kCGLineCapSquare);
    CGContextSetLineWidth(context, 1.0);
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
