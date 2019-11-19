//
//  UIButton+NewButton.h
//  CarPocket
//
//  Created by ios on 2017/10/29.
//  Copyright © 2017年 ios. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, MKButtonEdgeInsetsStyle) {
    MKButtonEdgeInsetsStyleTop, // image在上，label在下
    MKButtonEdgeInsetsStyleLeft, // image在左，label在右
    MKButtonEdgeInsetsStyleBottom, // image在下，label在上
    MKButtonEdgeInsetsStyleRight // image在右，label在左
};





@interface UIButton (NewButton)
- (void)layoutButtonWithEdgeInsetsStyle:(MKButtonEdgeInsetsStyle)style
                        imageTitleSpace:(CGFloat)space weight:(CGFloat)weight;





/**
 创建文本按钮
 
 @param title            标题文字
 @param fontSize         字体大小
 @param normalColor      默认颜色
 @param highlightedColor 高亮颜色
 
 @return UIButton
 */
+ (instancetype)cz_textButton:(NSString *)title fontSize:(CGFloat)fontSize normalColor:(UIColor *)normalColor highlightedColor:(UIColor *)highlightedColor;


/**
 创建文本按钮
 
 @param title               标题文字
 @param fontSize            字体大小
 @param normalColor         默认颜色
 @param highlightedColor    高亮颜色
 @param backgroundImageName 背景图像名称
 
 @return UIButton
 */
+ (instancetype)cz_textButton:(NSString *)title fontSize:(CGFloat)fontSize normalColor:(UIColor *)normalColor highlightedColor:(UIColor *)highlightedColor backgroundImageName:(NSString *)backgroundImageName;

/**
 创建图像按钮
 
 @param imageName           图像名称
 @param backgroundImageName 背景图像名称
 
 @return UIButton
 */
+ (instancetype)cz_imageButton:(NSString *)imageName backgroundImageName:(NSString *)backgroundImageName;





@end
