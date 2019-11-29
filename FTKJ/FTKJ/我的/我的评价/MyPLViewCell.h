//
//  MyPLViewCell.h
//  FTKJ
//
//  Created by ios on 2019/11/26.
//  Copyright © 2019年 ios. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XHStarRateView.h"

NS_ASSUME_NONNULL_BEGIN

@interface MyPLViewCell : UITableViewCell

@property(nonatomic,retain)UIImageView *headerImage;

@property(nonatomic,retain)UILabel *phoneLabel;

@property(nonatomic,retain)XHStarRateView *starView;

@property(nonatomic,retain)UILabel *GuiGeLabel;

@property(nonatomic,retain)UILabel *messageLabel;

@property(nonatomic,retain)UIView *bigView;


@property(nonatomic,retain)UIView *oneBigView;






@property(nonatomic,retain)UIView *alphaView;

@property(nonatomic,retain)UIImageView *SpImage;

@property(nonatomic,retain)UILabel *SPNameLabel;

@property(nonatomic,retain)UILabel *SpMoneyLabel;

@property(nonatomic,retain)UILabel *timeLabel;


@property(nonatomic,retain)UILabel *lineLabel;


+(CGFloat)setUpWithHeightWithNewDic:(NSDictionary *)tempDic;



@end

NS_ASSUME_NONNULL_END
