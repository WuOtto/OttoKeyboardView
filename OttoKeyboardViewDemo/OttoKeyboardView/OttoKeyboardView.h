//
//  OttoKeyboardView.h
//  OttoKeyboardView
//
//  Created by otto on 2018/1/24.
//  Copyright © 2018年 otto. All rights reserved.
//

#ifndef OttoKeyboardView_h
#define OttoKeyboardView_h
#import "OttoTextField.h"
#import "OttoTextView.h"

#define UIColorFromHexA(hexValue, a)     [UIColor colorWithRed:(((hexValue & 0xFF0000) >> 16))/255.0f green:(((hexValue & 0xFF00) >> 8))/255.0f blue:((hexValue & 0xFF))/255.0f alpha:a]
#define UIColorFromHex(hexValue)        UIColorFromHexA(hexValue, 1.0f)
#define UIColorFrom255RGBA(r, g, b, a)  ([UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a])
#define UIColorFrom255RGB(r, g, b)      UIColorFrom255RGBA(r,g,b,1.0f)

#define KWidth  [UIScreen mainScreen].bounds.size.width
#define KHeight [UIScreen mainScreen].bounds.size.height

#endif /* OttoKeyboardView_h */
