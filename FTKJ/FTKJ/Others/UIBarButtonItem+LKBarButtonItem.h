//
//  UIBarButtonItem+LKBarButtonItem.h
//  Longkin
//
//  Created by Administrator on 2017/7/18.
//  Copyright © 2017年 Winson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (LKBarButtonItem)

/**
 自定义BarButtonItem1：标题字体默认 16号，默认不可以返回

 @param title 标题
 @param target 代理
 @param action 代理执行的方法
 @return 返回自定义BarButtonItem
 */
+ (UIBarButtonItem *)lk_barButtonWithTitle:(NSString *)title target:(id)target action:(SEL)action;

/**
 自定义BarButtonItem2：默认不可以返回

 @param title 标题
 @param fontsize 标题字体
 @param target 代理
 @param action 代理执行方法
 @return 返回自定义BarButtonItem
 */
+ (UIBarButtonItem *)lk_barButtonWithTitle:(NSString *)title fontSize:(CGFloat)fontsize target:(id)target action:(SEL)action;

/**
 自定义BarButtonItem3：标题字体：默认 16号

 @param title 标题
 @param target 代理
 @param action 代理执行方法
 @param isBack 是否可以返回
 @return 返回自定义BarButtonItem
 */
+ (UIBarButtonItem *)lk_barButtonWithTitle:(NSString *)title target:(id)target action:(SEL)action isBack:(BOOL)isBack;

/**
 自定义BarButtonItem4

 @param title 标题
 @param fontsize 字体
 @param target 代理
 @param action 代理执行方法
 @param isBack 是否可以返回
 @return 返回自定义BarButtonItem
 */
+ (UIBarButtonItem *)lk_barButtonWithTitle:(NSString *)title fontSize:(CGFloat)fontsize target:(id)target action:(SEL)action isBack:(BOOL)isBack;

@end
