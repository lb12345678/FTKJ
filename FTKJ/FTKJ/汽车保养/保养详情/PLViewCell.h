//
//  PLViewCell.h
//  JZGL
//
//  Created by ios on 2019/8/6.
//  Copyright © 2019年 ios. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PLViewCell : UITableViewCell


@property(nonatomic,retain)UIView *bigView;

-(void)setUpWithNewBigView:(NSMutableArray *)dataArray;

+(CGFloat)setUpWithBigHeightWithArray:(NSMutableArray *)dataArray;

@property(nonatomic,retain)NSMutableArray *dataArray;


@end

NS_ASSUME_NONNULL_END
