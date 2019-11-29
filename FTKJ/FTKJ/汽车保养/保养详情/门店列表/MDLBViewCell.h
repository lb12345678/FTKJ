//
//  MDLBViewCell.h
//  FTKJ
//
//  Created by ios on 2019/11/20.
//  Copyright © 2019年 ios. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MDLBViewCell : UITableViewCell

@property(nonatomic,retain)UIImageView *bigImage;

@property(nonatomic,retain)UIImageView *categoryImage;

@property(nonatomic,retain)UILabel *nameLabel;

@property(nonatomic,retain)UILabel *ZTLabel;



@property(nonatomic,retain)UILabel *JuLiLabel;

@property(nonatomic,retain)UILabel *AddressLabel;

@property(nonatomic,retain)UIButton *shareBT;

@property(nonatomic,retain)UIImageView *rightImage;

@property(nonatomic,retain)UILabel *lineLabel;


-(void)setUpWithNewBigDic:(NSDictionary *)newDic;






@end

NS_ASSUME_NONNULL_END
