//
//  DDSPViewCell.h
//  JZGL
//
//  Created by ios on 2019/8/9.
//  Copyright © 2019年 ios. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DDSPViewCell : UITableViewCell

@property(nonatomic,retain)UIImageView *bigImage;

@property(nonatomic,retain)UIImageView *categoryImage;

@property(nonatomic,retain)UILabel *nameLabel;

@property(nonatomic,retain)UILabel *moneyLabel;

@property(nonatomic,retain)UILabel *XiaoLabel;

@property(nonatomic,retain)UILabel *lineLabel;


-(void)setUpWithNewDic:(NSDictionary *)tempDic;


@end

NS_ASSUME_NONNULL_END
