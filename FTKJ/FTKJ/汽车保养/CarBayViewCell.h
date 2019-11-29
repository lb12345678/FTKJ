//
//  CarBayViewCell.h
//  FTKJ
//
//  Created by ios on 2019/11/20.
//  Copyright © 2019年 ios. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CarBayViewCell : UITableViewCell
@property(nonatomic,retain)UIImageView *bigImage;

@property(nonatomic,retain)UIImageView *categoryImage;

@property(nonatomic,retain)UILabel *nameLabel;

@property(nonatomic,retain)UILabel *moneyLabel;

@property(nonatomic,retain)UILabel *XiaoLabel;

@property(nonatomic,retain)UIButton *shareBT;



-(void)setUpWithNewBigDic:(NSDictionary *)newDic;
@end

NS_ASSUME_NONNULL_END
