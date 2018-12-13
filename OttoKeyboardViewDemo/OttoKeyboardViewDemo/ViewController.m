//
//  ViewController.m
//  OttoKeyboardViewDemo
//
//  Created by otto on 2018/1/25.
//  Copyright © 2018年 otto. All rights reserved.
//

#import "ViewController.h"
#import "OttoKeyboardView.h"

@interface ViewController ()<TextViewClickReturnDelegate,TextFieldClickReturnDelegate,UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet OttoTextField *hexTextField;
@property (nonatomic, strong) OttoTextField *numberTextField;
@property (nonatomic, strong) OttoTextField *doubleTextField;
@property (nonatomic, strong) OttoTextField *certNoTextField;
@property (nonatomic, strong) OttoTextView *hexTextView;
@property (nonatomic, strong) OttoTextField *randomTextField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.hexTextField setKeyboardType:KeyboardTypeNumber];
    [self.hexTextField setNumberKeyboardType:NumberKeyboardTypeHEX];
    self.hexTextField.textFieldClickReturnDelegate = self;
    
    self.numberTextField = [[OttoTextField alloc] initWithFrame:CGRectMake(50, 100, CGRectGetWidth(self.view.bounds) - 100, 30)];
    self.numberTextField.placeholder = @"纯数字键盘";
    self.numberTextField.borderStyle = UITextBorderStyleLine;
    self.numberTextField.clearButtonMode = UITextFieldViewModeAlways;
    [self.numberTextField setKeyboardType:KeyboardTypeNumber];
    [self.numberTextField setNumberKeyboardType:NumberKeyboardTypeNumber];
    [self.view addSubview:self.numberTextField];
    
    self.doubleTextField = [[OttoTextField alloc] initWithFrame:CGRectMake(50, 140, CGRectGetWidth(self.view.bounds) - 100, 30)];
    self.doubleTextField.placeholder = @"小数点键盘";
    self.doubleTextField.borderStyle = UITextBorderStyleBezel;
    self.doubleTextField.clearButtonMode = UITextFieldViewModeAlways;
    [self.doubleTextField setKeyboardType:KeyboardTypeNumber];
    [self.doubleTextField setNumberKeyboardType:NumberKeyboardTypeDouble];
    [self.view addSubview:self.doubleTextField];
    
    self.certNoTextField = [[OttoTextField alloc] initWithFrame:CGRectMake(50, 180, CGRectGetWidth(self.view.bounds) - 100, 30)];
    self.certNoTextField.placeholder = @"身份证键盘";
    self.certNoTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.certNoTextField.clearButtonMode = UITextFieldViewModeAlways;
    [self.certNoTextField setKeyboardType:KeyboardTypeNumber];
    [self.certNoTextField setNumberKeyboardType:NumberKeyboardTypeCertNo];
    [self.view addSubview:self.certNoTextField];
    
    self.hexTextView = [[OttoTextView alloc] initWithFrame:CGRectMake(50, 220, KWidth - 100, 100)];
    self.hexTextView.font = [UIFont systemFontOfSize:20.0];
    self.hexTextView.layer.borderColor = [UIColor colorWithRed:51/255.0f green:51/255.0f blue:51/255.0f alpha:1.0f].CGColor;
    self.hexTextView.layer.borderWidth = 1;
    self.hexTextView.layer.cornerRadius =5;
    self.hexTextView.textViewClickReturnDelegate = self;
    [self.hexTextView setTextViewKeyboardType:TextViewKeyboardTypeNumber];
    [self.hexTextView setNumberKeyboardType:NumberKeyboardTypeHEX];
    [self.view addSubview:self.hexTextView];
    
    self.randomTextField = [[OttoTextField alloc] initWithFrame:CGRectMake(50, 350, CGRectGetWidth(self.view.bounds) - 100, 30)];
    self.randomTextField.placeholder = @"安全键盘";
    self.randomTextField.borderStyle = UITextBorderStyleBezel;
    //    [self.randomTextField setSecureTextEntry:YES];
    [self.randomTextField setKeyboardType:KeyboardTypeNumber];
    self.randomTextField.textFieldClickReturnDelegate = self;
    self.randomTextField.delegate = self;
    [self.randomTextField setNumberKeyboardType:NumberKeyboardTypeRandom];
    [self.view addSubview:self.randomTextField];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSArray *subviews = [self.view subviews];
    for (UITextField *textField in subviews) {
        if (textField == self.numberTextField) {
            [self.numberTextField resignFirstResponder];
        } else if (textField == self.doubleTextField) {
            [self.doubleTextField resignFirstResponder];
        } else if (textField == self.certNoTextField) {
            [self.certNoTextField resignFirstResponder];
        } else if (textField == self.hexTextField){
            [self.hexTextField resignFirstResponder];
        }else if (textField == self.randomTextField){
            [self.randomTextField resignFirstResponder];
        }
    }
    
    if ([self.hexTextView isFirstResponder]) {
        [self.hexTextView resignFirstResponder];
    }
}

#pragma mark - TextViewClickReturnDelegate
- (void)textViewClickReturn:(OttoTextView *)textView{
    [textView resignFirstResponder];
    NSLog(@"return - %@",textView.text);
}

#pragma mark - TextFieldClickReturnDelegate
- (void)textFieldClickReturn:(OttoTextField *)textField{
    [textField resignFirstResponder];
    NSLog(@"return - %@",textField.text);
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    [self.randomTextField setKeyboardType:KeyboardTypeNumber];
    [self.randomTextField setNumberKeyboardType:NumberKeyboardTypeRandom];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
