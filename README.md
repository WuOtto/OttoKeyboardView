## OttoKeyboardView

自定义键盘，支持多种样式（数字键盘、小数点键盘、身份证键盘、十六进制数键盘、随机布局的安全数字键盘），切合项目需求。支持`UITextField`和`UITextView`。


<p align="center">
<img src="https://raw.githubusercontent.com/WuOtto/imgSrc/master/OttoKeyboardView1.png" width="200"/>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
<img src="https://raw.githubusercontent.com/WuOtto/imgSrc/master/OttoKeyboardView5.png" width="200"/>
</p>

<p align="center">
<img src="https://raw.githubusercontent.com/WuOtto/imgSrc/master/OttoKeyboardView3.png" width="200"/>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
<img src="https://raw.githubusercontent.com/WuOtto/imgSrc/master/OttoKeyboardView4.png" width="200"/>
</p>

安全键盘
![](https://raw.githubusercontent.com/WuOtto/imgSrc/master/OttoKeyboardView6.gif)

### 具体使用  

在需要用到的地方导入头文件`#import "OttoKeyboardView.h"`  
根据需求使用`OttoTextField`和`OttoTextView`  

```
@property (nonatomic, strong) OttoTextField *certNoTextField;
@property (nonatomic, strong) OttoTextView *hexTextView;

    self.hexTextView.textViewClickReturnDelegate = self;
    //设置是否使用自定义键盘
    [self.hexTextView setTextViewKeyboardType:TextViewKeyboardTypeNumber];
    //设置自定义键盘类型
    [self.hexTextView setNumberKeyboardType:NumberKeyboardTypeHEX];
```

#### 安全键盘的使用注意事项
如果想要实现每次收起键盘之后再次弹出新的随机布局，那么需要实现`delegate`方法
```
- (void)textFieldDidEndEditing:(UITextField *)textField{
[self.randomTextField setKeyboardType:KeyboardTypeNumber];
[self.randomTextField setNumberKeyboardType:NumberKeyboardTypeRandom];
}
```

### 安装
##### 1.使用CocoaPods安装
```
pod 'OttoKeyboardView'
```

##### 2.直接使用，将`OttoKeyboardView`文件夹拖到你的工程里面

### 版本更新记录
#### v0.0.5
- 【新增】: 随机布局的安全数字键盘。
- 【新增】: 删除键增加长按清空功能。

### 其他
本库没有导入任何其他的第三方内容，可以放心使用。在使用前，您可以下载查看示例程序
> 如果在使用过程中遇到bug，希望你能Issues我，谢谢 
> 
> 如果您有什么建议可以Issues我，谢谢
> 
> 后续我会持续更新，为它添加更多的功能，欢迎star ^.^
