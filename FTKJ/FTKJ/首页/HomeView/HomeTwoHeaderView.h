//
//  HomeTwoHeaderView.h
//  FTKJ
//
//  Created by ios on 2019/11/19.
//  Copyright © 2019年 ios. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HomeTwoHeaderView : UITableViewHeaderFooterView


@property(nonatomic,retain)UILabel *oneLabel;

@property(nonatomic,retain)UIView *timeView;

@property(nonatomic,retain)UIButton *MoreBT;

@property(nonatomic,retain)NSMutableArray *timeArray;

@property(nonatomic,retain)NSString *timeStr;

-(void)setUpWithNewBigTimeStr:(NSString *)timeStr type:(NSString *)type;

@property(nonatomic,retain)NSTimer *addressTime;



@end

NS_ASSUME_NONNULL_END
