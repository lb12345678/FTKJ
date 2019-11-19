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


-(void)setUpWithNewBigTimeStr:(NSString *)timeStr;





@end

NS_ASSUME_NONNULL_END
