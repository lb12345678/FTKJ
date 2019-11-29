//
//  MyMoneyViewCell.h
//  FTKJ
//
//  Created by ios on 2019/11/26.
//  Copyright © 2019年 ios. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyMoneyViewCell : UITableViewCell

@property(nonatomic,retain)UILabel *oneLabel;

@property(nonatomic,retain)UILabel *timeLabel;

@property(nonatomic,retain)UILabel *moneyLabel;

@property(nonatomic,retain)UILabel *lineLabel;

-(void)setUpWithNewBigView:(NSDictionary *)tempDic;



@end

NS_ASSUME_NONNULL_END
