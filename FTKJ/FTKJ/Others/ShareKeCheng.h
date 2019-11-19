//
//  ShareKeCheng.h
//  ZJLM
//
//  Created by ios on 2019/5/31.
//  Copyright © 2019年 ios. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ShareKeCheng : UIView

@property(nonatomic,copy)void (^ClickBlock)(NSString *title);

@property(nonatomic,retain)NSString *categoryID;

@property(nonatomic,retain)NSDictionary *bigDic;

@property(nonatomic,retain)NSString *type;//1.练习 2.邀请和毕业证书

@property(nonatomic,retain)UIImage *shareBigImage;

@property(nonatomic,retain)NSString *shareImageUrl;

@property(nonatomic,retain)NSString *MovieID;






@end

NS_ASSUME_NONNULL_END
