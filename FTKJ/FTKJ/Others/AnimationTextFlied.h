//
//  AnimationTextFlied.h
//  JMSX
//
//  Created by Hxx on 2019/6/21.
//  Copyright © 2019 Hxx rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AnimationTextFlied : UIView
// 字体默认14
@property (nonatomic, strong) UIFont *font;
// 隐藏下划线 默认NO
@property (nonatomic, assign) BOOL xiahuaxianHidden;
// 隐藏字符 默认NO  值为YES时显示按钮
@property (nonatomic, assign) BOOL secureTextEntry;
// placeholder
@property (nonatomic, strong) NSString *placeholder;
// textFiled字体颜色，默认 blackColor
@property (nonatomic, strong) UIColor *textColor;
// placeholder字体颜色，默认 lightGrayColor
@property (nonatomic, strong) UIColor *placeholderColor;
// textFiled的text
@property (nonatomic, strong) NSString *content;

@property(nonatomic,copy)void(^ctext)(NSString *text);

- (instancetype)initWithFrame:(CGRect)frame ;
   
@end

NS_ASSUME_NONNULL_END
