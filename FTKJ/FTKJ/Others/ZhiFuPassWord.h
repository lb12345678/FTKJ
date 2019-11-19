//
//  ZhiFuPassWord.h
//  KuaiPai
//
//  Created by ios on 2018/6/13.
//  Copyright © 2018年 ios. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ReturnPasswordStringBlock)(NSString *password);

@interface ZhiFuPassWord : UIView

@property (copy, nonatomic) ReturnPasswordStringBlock returnPasswordStringBlock;

@property(nonatomic,retain)NSString *isName;

@property(nonatomic,retain)NSString *ZFMoney;

- (void)setUpWithName:(NSString *)name money:(NSString *)money;




@end
