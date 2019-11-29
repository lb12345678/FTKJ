//
//  AnimationTextFlied.m
//  JMSX
//
//  Created by Hxx on 2019/6/21.
//  Copyright © 2019 Hxx rights reserved.
//

#import "AnimationTextFlied.h"
@interface AnimationTextFlied()<UITextFieldDelegate>

@property (nonatomic,strong)UIView *xiahuaxian;
@property (nonatomic,strong)UILabel *placeholderLab;
@property (nonatomic,strong)UIButton *isSecureTextEntry;
@property (nonatomic,assign)float ty;
@end
@implementation AnimationTextFlied

-(void)setFont:(UIFont *)font{
    _placeholderLab.font=font;
    _textField.font=font;
}
-(void)setTextColor:(UIColor *)textColor{
    _textField.textColor=textColor;
}
-(void)setPlaceholder:(NSString *)placeholder{
    _placeholderLab.text=placeholder;
}
-(void)setPlaceholderColor:(UIColor *)placeholderColor{
    _placeholderLab.textColor=placeholderColor;
}
-(void)setXiahuaxianHidden:(BOOL)xiahuaxianHidden{
    _xiahuaxian.hidden=xiahuaxianHidden;
}
-(void)setSecureTextEntry:(BOOL)secureTextEntry{
    _secureTextEntry=secureTextEntry;
    _textField.secureTextEntry=secureTextEntry;
    if (!_secureTextEntry) {
        _isSecureTextEntry.selected=!_isSecureTextEntry.selected;
    }
    _isSecureTextEntry.hidden=NO;
    [_isSecureTextEntry addTarget:self action:@selector(clickHidden:) forControlEvents:UIControlEventTouchUpInside];
}

- (UILabel*)placeholderLab {
    if (!_placeholderLab) {
        _placeholderLab = [UILabel new];
        _placeholderLab.font=Font(kWidthChange(14));
        _placeholderLab.textColor=[UIColor lightGrayColor];
    }
    return _placeholderLab;
}
- (UIView*)xiahuaxian {
    if (!_xiahuaxian) {
        _xiahuaxian = [UIView new];
        _xiahuaxian.backgroundColor=newColor(222, 222, 222, 1);
    }
    return _xiahuaxian;
}
- (UIButton*)isSecureTextEntry {
    if (!_isSecureTextEntry) {
        _isSecureTextEntry = [UIButton new];
        [_isSecureTextEntry setImage:[UIImage imageNamed:@"box19-1"] forState:UIControlStateNormal];
        [_isSecureTextEntry setImage:[UIImage imageNamed:@"box20-1"] forState:UIControlStateSelected];
        _isSecureTextEntry.hidden=YES;

    }
    return _isSecureTextEntry;
}
- (UITextField*)textField {
    if (!_textField) {
        _textField = [UITextField new];
        _textField.delegate=self;
        _textField.font=Font(kWidthChange(14));
        _textField.textColor=[UIColor blackColor];
        
        
    }
    return _textField;
}
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupView];
        [self setupProperty];
    }
    return self;
}

-(void)setupView{
    self.ty = 8.5;
    [self addSubview:self.textField];
    [self.textField addSubview:self.placeholderLab];
    [self.textField addTarget:self action:@selector(changedTextField:) forControlEvents:UIControlEventEditingChanged];

    [self addSubview:self.xiahuaxian];
    [self addSubview:self.isSecureTextEntry];
    
    
  
    
    
    
}
-(void)setupProperty {
    
}
-(void)setupFrame{
    CGFloat viewWidth = CGRectGetWidth(self.bounds)
    , viewHeight = CGRectGetHeight(self.bounds);
    
    
    _textField.frame=CGRectMake(0, viewHeight*0.33, viewWidth, viewHeight*0.66);
    
    
    //要修改transform的时候 不能使用frame布局
    
    _placeholderLab.bounds=CGRectMake(0, 0, viewWidth, viewHeight*0.66);
    _placeholderLab.layer.anchorPoint=CGPointMake(0, 0);
    _placeholderLab.bounds=CGRectMake(0, 0, viewWidth, viewHeight*0.66);
    _ty=viewHeight*0.33/2;
    
    _isSecureTextEntry.frame=CGRectMake(viewWidth-viewHeight*0.33, viewHeight*0.33+viewHeight*0.33/2, viewHeight*0.33, viewHeight*0.33);

    
    
    
    _xiahuaxian.frame=CGRectMake(0, viewHeight*0.99, viewWidth, 1);
    
}
- (void)layoutSubviews {
    [super layoutSubviews];
    [self setupFrame];
}
-(void)any{
    
    
    [UIView animateWithDuration:0.5 animations:^{
        
        CGAffineTransform newTransform1 =  CGAffineTransformScale(self.placeholderLab.transform, 0.5, 0.5);//数字表示放大的大小
        CGAffineTransform rtans=CGAffineTransformMakeTranslation(0, -self.ty);
        
        self.placeholderLab.transform =CGAffineTransformConcat(newTransform1,rtans);
        
    } completion:^(BOOL finished) {
        
        
        
    }];
    
    
    
}
-(void)end{
    
    
    [UIView animateWithDuration:0.5 animations:^{
        
        CGAffineTransform newTransform1 =  CGAffineTransformScale(self.placeholderLab.transform, 2, 2);//数字表示放大的大小
        CGAffineTransform rtans=CGAffineTransformMakeTranslation(0, self.ty);
        
        self.placeholderLab.transform =CGAffineTransformConcat(newTransform1,rtans);
        
    } completion:^(BOOL finished) {
        
        
        
    }];
    
}
-(void)clickHidden:(UIButton *)btn{
    btn.selected=!btn.selected;
    self.textField.secureTextEntry=!self.textField.secureTextEntry;
}
/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */





-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    NSLog(@"2");// 准备开始输入 文本字段将成为第一响应者
    
//    if (textField.text.length==0) {
        [self any];
    //}
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    if (textField.text.length==0) {
        [self end];
    }
    _content=textField.text;
    [textField resignFirstResponder];
}


-(void)changedTextField:(UITextField *)textField
{
//    NSLog(@"值是---%@",textField.text);
    self.content=textField.text;
    if (self.ctext) {
        self.ctext(textField.text);
    }
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.textField resignFirstResponder];
}
@end
