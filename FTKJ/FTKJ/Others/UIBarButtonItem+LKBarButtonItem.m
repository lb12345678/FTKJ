//
//  UIBarButtonItem+LKBarButtonItem.m
//  Longkin
//
//  Created by Administrator on 2017/7/18.
//  Copyright © 2017年 Winson. All rights reserved.
//

#import "UIBarButtonItem+LKBarButtonItem.h"
#import "CZAdditions.h"

@implementation UIBarButtonItem (LKBarButtonItem)

/**
 自定义BarButtonItem1

 @param title 标题
 @param target 代理
 @param action 代理执行的方法
 @return 返回自定义BarButtonItem
 */
+ (UIBarButtonItem *)lk_barButtonWithTitle:(NSString *)title target:(id)target action:(SEL)action {

    return [self lk_barButtonWithTitle:title fontSize:16.0 target:target action:action isBack:NO];
}

/**
 自定义BarButtonItem2

 @param title 标题
 @param fontsize 标题字体
 @param target 代理
 @param action 代理执行方法
 @return 返回自定义BarButtonItem
 */
+ (UIBarButtonItem *)lk_barButtonWithTitle:(NSString *)title fontSize:(CGFloat)fontsize target:(id)target action:(SEL)action {

    return [self lk_barButtonWithTitle:title fontSize:fontsize target:target action:action isBack:NO];
}

/**
  自定义BarButtonItem3

 @param title 标题
 @param target 代理
 @param action 代理执行方法
 @param isBack 是否可以返回
 @return 返回自定义BarButtonItem
 */
+ (UIBarButtonItem *)lk_barButtonWithTitle:(NSString *)title target:(id)target action:(SEL)action isBack:(BOOL)isBack {

    return [self lk_barButtonWithTitle:title fontSize:16 target:target action:action isBack:isBack];
}

/**
 自定义BarButtonItem4

 @param title 标题
 @param fontsize 字体
 @param target 代理
 @param action 代理执行方法
 @param isBack 是否可以返回
 @return 返回自定义BarButtonItem
 */
+ (UIBarButtonItem *)lk_barButtonWithTitle:(NSString *)title fontSize:(CGFloat)fontsize target:(id)target action:(SEL)action isBack:(BOOL)isBack {

    UIButton *btn = [UIButton cz_textButton:title fontSize:fontsize normalColor:[UIColor whiteColor] highlightedColor:[UIColor lightGrayColor]];

    if (isBack) {

        NSString *imageName = @"box14-1";
        NSString *highlighted_imageName = @"box14-1";
        [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:highlighted_imageName] forState:UIControlStateHighlighted];
       
    }
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];

    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];

    return barButtonItem;
}

@end
