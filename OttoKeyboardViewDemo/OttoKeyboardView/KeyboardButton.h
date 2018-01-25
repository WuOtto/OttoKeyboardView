//
//  KeyboardButton.h
//  OttoKeyboardView
//
//  Created by otto on 2018/1/24.
//  Copyright © 2018年 otto. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KeyboardButton : UIView

@property (nonatomic, strong) UIButton * button;
@property (nonatomic, strong) UIView * lineView;

+ (UIImage *)imageColor:(UIColor *)color;

- (void)setButtonTitle:(NSString *)title;

@end
