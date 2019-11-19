//
//  WebModel.h
//  KuaiPai
//
//  Created by ios on 2018/12/12.
//  Copyright © 2018年 ios. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseViewController.h"
#import <JavaScriptCore/JavaScriptCore.h>
#import <WebKit/WebKit.h>
NS_ASSUME_NONNULL_BEGIN

@protocol JavaScriptObjectiveCDelegate <JSExport>

// JS调用此方法来调用OC的系统相册方法
- (void)returnHomeView;
// 在JS中调用时，函数名应该为showAlertMsg(arg1, arg2)
// 这里是只两个参数的。
- (void)showAlert:(NSString *)title msg:(NSString *)msg;
// 通过JSON传过来
- (void)HuoQuDingDan:(NSDictionary *)params;
// JS调用Oc，然后在OC中通过调用JS方法来传值给JS。
- (void)jsCallObjcAndObjcCallJsWithDict:(NSDictionary *)params;

@end



@interface WebModel : NSObject<JavaScriptObjectiveCDelegate>


@property (nonatomic, weak) JSContext *jsContext;
@property (nonatomic, weak) UIWebView *webView;

@property(nonatomic,copy)void (^ClickBlock)(NSString *type,NSDictionary *tempDic);


@end

NS_ASSUME_NONNULL_END
