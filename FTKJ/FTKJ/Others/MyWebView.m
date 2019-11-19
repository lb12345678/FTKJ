//
//  MyWebView.m
//  YXGL
//
//  Created by ios on 2017/12/9.
//  Copyright © 2017年 ios. All rights reserved.
//

#import "MyWebView.h"
#import "MyWebViewController.h"

@implementation MyWebView
+(void)setUpWith:(UIViewController *)view url:(NSString *)url {
    MyWebViewController *webView = [[MyWebViewController alloc]init];
    webView.isFrom = url;
    [view.navigationController pushViewController:webView animated:YES];
    
    
    
}



@end
