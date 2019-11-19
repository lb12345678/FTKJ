//
//  UIViewController+MBProgressHUD.m
//  BGLT
//
//  Created by zhangjinyang on 2019/9/17.
//  Copyright © 2019 iOS 开发. All rights reserved.
//

#import "UIViewController+MBProgressHUD.h"

@implementation UIViewController (MBProgressHUD)

- (void)showToastMsg:(NSString *)msg
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];
    hud.userInteractionEnabled = false;
    hud.mode = MBProgressHUDModeText;
    hud.label.text = msg;
    hud.label.textColor = [UIColor whiteColor];
    hud.label.numberOfLines = 0;
    hud.bezelView.backgroundColor = [UIColor blackColor];
    [hud hideAnimated:YES afterDelay:2.5f];
}

@end
