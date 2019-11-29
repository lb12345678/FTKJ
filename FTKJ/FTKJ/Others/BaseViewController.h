//
//  BaseViewController.h
//  FRY
//
//  Created by ios on 2019/8/11.
//  Copyright © 2019年 iOS 开发. All rights reserved.
//

#import <UIKit/UIKit.h>


#import "AppDelegate.h"
#import "TabBarController.h"
#import <ShareSDK/ShareSDK.h>
#import <ShareSDKUI/ShareSDK+SSUI.h>
//#import <AlipaySDK/AlipaySDK.h>
#import <WXApi.h>
#import <WXApiObject.h>

@interface BaseViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate,UITextViewDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate>


@property(nonatomic,retain)UITableView *tableView;




- (AppDelegate *)getCJAppDelegate;



/**
 隐藏自定义tabbar
 
 @param ishid ishid
 */
- (void)setHidTabbar:(BOOL)ishid;

/**
 拨打电话
 
 @param phone 电话号码
 */
- (void)callPhone:(NSString *)phone;




@property(nonatomic,copy)void(^imgurl)(NSString *imgUrl);


- (void)setUpWithMyImage:(UIViewController *)myView isFrom:(NSString *)isFrom;

@property(nonatomic,copy)void(^myImage)(NSDictionary *newDic);

@property(nonatomic,retain)NSString *bigFrom;

-(NSURL *)setPath:(NSString *)path;

#pragma mark---分享
-(void)setUpWithShare:(NSDictionary *)tempDic;
#pragma mark---微信支付
-(void)setUpWithWeiXin:(NSDictionary *)newDic;

- (void)zhiFubao:(NSString *)string;

#pragma mark----照相机或者相册
-(void)setUpWithNewBigHeaderImage:(NSString *)type;
@end


