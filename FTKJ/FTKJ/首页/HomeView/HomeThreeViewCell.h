//
//  HomeThreeViewCell.h
//  FTKJ
//
//  Created by ios on 2019/11/20.
//  Copyright © 2019年 ios. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HomeThreeViewCell : UITableViewCell

@property(nonatomic,retain)UIView *bigView;

-(void)setUpWithNewBigDic:(NSDictionary *)tempDic;

+(CGFloat)setUpWithHeightWithNewDic:(NSDictionary *)newDic;


@end

NS_ASSUME_NONNULL_END
