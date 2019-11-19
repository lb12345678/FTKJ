//
//  ZYTextField.m
//  QuZhiFu
//
//  Created by ios on 2017/10/25.
//  Copyright © 2017年 ios. All rights reserved.
//

#define Default_FontColor ZYRGBColor(77, 150, 132)
#import "ZYTextField.h"
@implementation ZYTextField
//通过代码创建
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpUI];
    }
    return self;
}

- (void)setUpUI
{
    //    设置border
    //    self.layer.masksToBounds = YES;
    //    self.layer.cornerRadius = 22;
    //    self.backgroundColor = Default_FontColor;
    //    self.layer.borderColor = [UIColor blackColor].CGColor;
    //    self.layer.borderWidth = 1;
    //字体大小
    self.font = [UIFont systemFontOfSize:15];
    //字体颜色
  
    //光标颜色
    self.tintColor= self.textColor;
    //占位符的颜色和大小
 
    // 不成为第一响应者
    [self resignFirstResponder];
}
/**
 * 当前文本框聚焦时就会调用
 */
//- (BOOL)becomeFirstResponder
//{
//    // 修改占位文字颜色
//    [self setValue:self.textColor forKeyPath:@"_placeholderLabel.textColor"];
//    return [super becomeFirstResponder];
//}

/**
 * 当前文本框失去焦点时就会调用
 */
- (BOOL)resignFirstResponder
{
    // 修改占位文字颜色
    [self setValue:[UIColor grayColor] forKeyPath:@"_placeholderLabel.textColor"];
    return [super resignFirstResponder];
}
//控制placeHolder的位置
-(CGRect)placeholderRectForBounds:(CGRect)bounds
{
    CGRect inset = CGRectMake(bounds.origin.x, bounds.origin.y + bounds.size.height / 2, bounds.size.width -15, bounds.size.height / 2);
    return inset;
}

//控制显示文本的位置
-(CGRect)textRectForBounds:(CGRect)bounds
{
    CGRect inset = CGRectMake(bounds.origin.x, bounds.origin.y, bounds.size.width -15, bounds.size.height );
    return inset;
}

//控制编辑文本的位置
-(CGRect)editingRectForBounds:(CGRect)bounds
{
    CGRect inset = CGRectMake(bounds.origin.x, bounds.origin.y, bounds.size.width -15, bounds.size.height );
    return inset;
}


@end
