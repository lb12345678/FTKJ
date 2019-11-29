//
//  MyMoneyTimeView.h
//  FTKJ
//
//  Created by ios on 2019/11/26.
//  Copyright © 2019年 ios. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^monthDayBlock)(NSInteger dateType,NSString *startTime,NSString *endTime);


@interface MyMoneyTimeView : UIView

@property (copy,nonatomic)monthDayBlock block;


@end

NS_ASSUME_NONNULL_END
