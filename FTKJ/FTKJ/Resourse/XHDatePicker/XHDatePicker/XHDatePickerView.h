//
//  XHDatePickerView.h
//  XHDatePicker
//
//  Created by Administrator on 2016/7/2.
//  Copyright © 2017年 Winson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSDate+Extension.h"

typedef enum{
    DateStyleShowYearMonthDayHourMinute  = 0,
    DateStyleShowMonthDayHourMinute,
    DateStyleShowYearMonthDay,
    DateStyleShowMonthDay,
    DateStyleShowHourMinute
    
}XHDateStyle;

typedef enum{
    DateTypeStartDate,
    DateTypeEndDate
    
}XHDateType;

@interface XHDatePickerView : UIView

@property (nonatomic,assign)XHDateStyle datePickerStyle;
@property (nonatomic,assign)XHDateType dateType;
@property (nonatomic,strong)UIColor *themeColor;

@property (nonatomic, retain) NSDate *maxLimitDate;//限制最大时间（没有设置默认2049）
@property (nonatomic, retain) NSDate *minLimitDate;//限制最小时间（没有设置默认1970）


@property (nonatomic, copy) void(^cleanDate)();

-(instancetype)initWithCompleteBlock:(void(^)(NSDate *,NSDate *))completeBlock;


-(instancetype)initWithCompleteBlock:(void(^)(NSDate *,NSDate *))completeBlock dismissBlock:(void(^)())dismissBlock;

/**
 *   设置打开选择器时的默认时间，
 *   minLimitDate < currentDate < maxLimitDate  显示 currentDate;
 *   currentDate < minLimitDate ||  currentDate > maxLimitDate   显示minLimitDate;
 */
-(instancetype)initWithCurrentDate:(NSDate *)currentDate completeBlock:(void(^)(NSDate *,NSDate *))completeBlock dismissBlock:(void(^)())dismissBlock;

/**
   只能选择一个日期

 @param completeBlock 回调block
 @param dismissBlock 消失回调block
 @return 本类
 */
-(instancetype)initWithSingleDate:(void(^)(NSDate *date))completeBlock dismissBlock:(void(^)())dismissBlock;

-(void)show;


@end
