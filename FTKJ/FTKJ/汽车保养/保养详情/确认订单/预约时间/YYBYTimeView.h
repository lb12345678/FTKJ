//
//  YYBYTimeView.h
//  FTKJ
//
//  Created by ios on 2019/11/20.
//  Copyright © 2019年 ios. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YYBYTimeView : UIView


@property(nonatomic,copy)void(^ClickBlock)(NSString *timeStr);

@property(nonatomic,retain)NSString *bigType;


@end

NS_ASSUME_NONNULL_END
