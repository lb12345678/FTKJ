//
//  Contest.h
//  ISP
//
//  Created by Master on 16/4/6.
//  Copyright © 2016年 rryy. All rights reserved.
//

/**
 *
 *   常量
 *
 */

#import <Foundation/Foundation.h>

/**
 
  位置和大小
 
 */


#import <AVFoundation/AVFoundation.h>
#import <UIKit/UIKit.h>

#import "MBProgressHUD.h"
//判断是否是ipad
#define isPad ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
//判断iPhone4系列
#define kiPhone4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
//判断iPhone5系列
#define kiPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
//判断iPhone6 6s 7系列
#define kiPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
//判断iPhone6p 6sp 7p系列
#define kiPhone6Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
//判断iPhoneX，Xs（iPhoneX，iPhoneXs）
#define IS_IPHONE_X ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
//判断iPhoneXr
#define IS_IPHONE_Xr ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(828, 1792), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
//判断iPhoneXsMax
#define IS_IPHONE_Xs_Max ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2688), [[UIScreen mainScreen] currentMode].size)&& !isPad : NO)

//判断iPhoneX所有系列
#define IS_PhoneXAll (IS_IPHONE_X || IS_IPHONE_Xr || IS_IPHONE_Xs_Max)
#define k_Height_NavContentBar 44.0f
#define k_Height_StatusBar (IS_PhoneXAll? 44.0 : 20.0)
#define k_Height_NavBar (IS_PhoneXAll ? 88.0 : 64.0)
#define k_Height_TabBar (IS_PhoneXAll ? 83.0 : 49.0)
#define HexColorInt32_t(rgbValue) \
[UIColor colorWithRed:((float)((0x##rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((0x##rgbValue & 0x00FF00) >> 8))/255.0 blue:((float)(0x##rgbValue & 0x0000FF))/255.0  alpha:1]


#define RGBColor(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


#define PI 3.1415926

#define Font(x) [UIFont systemFontOfSize:x]

#define APP_URl @"http://bagua.59156.cn/api"
#define APP_IMAGEURl @"http://bagua.59156.cn"
#define NewAPP_URlImage @"http://bagua.59156.cn"

#define IOS8 ([[[UIDevice currentDevice] systemVersion] doubleValue] >=8.0 ? YES : NO)

#define BLOCK_SAFE_RUN(block, ...) block ? block(__VA_ARGS__) : nil;

#define kStatusBarHeight [[UIApplication sharedApplication] statusBarFrame].size.height//顶部栏
#define AMAPLOC_DEG_TO_RAD      0.0174532925199432958f //0.017453292519943295769236907684886
#define AMAPLOC_EARTH_RADIUS    6378137.0f
#define kNavBarHeight 44.0 //顶部导航栏

#define kTabBarHeight ([[UIApplication sharedApplication] statusBarFrame].size.height>20?83:49)//底部导航栏

#define kTopHeight (kStatusBarHeight + kNavBarHeight)

#define SCREEN_BOUNDS   [UIScreen mainScreen].bounds
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define downH ([[UIApplication sharedApplication] statusBarFrame].size.height>20?34:0)//底部导航栏
#define kWidthChange(A) (A * [UIScreen mainScreen].bounds.size.width / 375)
#define kHeightChange(A) (A * ([UIScreen mainScreen].bounds.size.height - kTopHeight - kTabBarHeight) / (667- kTopHeight - kTabBarHeight))



#define kScreenHeightNew  [UIApplication sharedApplication].keyWindow.rootViewController.view.bounds.size.height



#define newColor(r,g,b,a) [UIColor colorWithRed:r / 255.0 green:g / 255.0 blue:b / 255.0 alpha:a]


/**
 
 颜色
 
 */

#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#define Nav_Height ([[UIApplication sharedApplication] statusBarFrame].size.height + self.navigationController.navigationBar.frame.size.height)
#define colorrgb(a,b,c,d) [UIColor colorWithRed:a/255.0 green:b/255.0 blue:c/255.0 alpha:d]

#define labBlack [UIColor colorWithRed:40.0/255.0 green:40.0/255.0 blue:40.0/255.0 alpha:1]
#define labGray [UIColor colorWithRed:187.0/255.0 green:187.0/255.0 blue:187.0/255.0 alpha:1]
#define bkGray [UIColor colorWithRed:246.0/255.0 green:246.0/255.0 blue:246.0/255.0 alpha:1]


#define RedColor [UIColor colorWithRed:206.0/255.0 green:69.0/255.0 blue:66.0/255.0 alpha:1]

#define lineColor_gary [UIColor colorWithRed:239.0/255.0 green:239.0/255.0 blue:239.0/255.0 alpha:1]

//限制输入英文和数字
#define kAlphaNum   @"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"

#define WeiXin [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"weixin://wx972749ca6b5d9d6a"]]

#define QQ  [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"mqq://QQ101804761"]]




//工具
#import "Toos.h"
#import "Masonry.h"

#import "BaseViewController.h"

#import "GeneralView.h"

#import "AllSearchView.h"

#import <SDImageCache.h>

#import <UIButton+WebCache.h>

#import <UIImageView+WebCache.h>

#import <MJRefresh/MJRefresh.h>

#import <TZImagePickerController/TZImagePickerController.h>

#import <AFNetworking.h>

#import <IQKeyboardManager.h>

#import <SDCycleScrollView.h>

#import "CountDownButton.h"

#import "DataBaseManager.h"

#import "IQKeyboardManager.h"

#import "UIBarButtonItem+LKBarButtonItem.h"

#import "LBAlertView.h"

#import "UIButton+NewButton.h"

#import "ZFNavigationController.h"

#import "UserModel.h"
#import "Masonry.h"

#import "UIColor+CZAddition.h"

#import "AddXuanImage.h"

#import "UIView+Additions.h"

#import "UIViewExt.h"

#import "DownPickerView.h"

#import "MyWebView.h"

#import "UIFont+Setting.h"

#import "EWMViewController.h"

#import <CoreLocation/CoreLocation.h>
#import <Foundation/Foundation.h>


//#import "iCarousel.h"
//
//#import "XHPageControl.h"
//
//#import "SearchViewController.h"
//

#import "PGGLinScrillButtonView.h"

#import "UIView+Extension.h"

#import "UIColor+Extension.h"
