//
//  SPXQOneHeaderView.h
//  JZGL
//
//  Created by ios on 2019/8/6.
//  Copyright © 2019年 ios. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SPXQOneHeaderView : UITableViewHeaderFooterView

@property(nonatomic,retain)SDCycleScrollView *oneScrollerView;

@property(nonatomic,retain)UILabel *pageLabel;

@property(nonatomic,retain)UIView *oneView;

@property(nonatomic,retain)UIView *TwoView;

@property(nonatomic,retain)UILabel *numberlabel;

@property(nonatomic,retain)UITextField *XiaoLabel;


-(void)setUpWithBigView:(NSDictionary *)tempDic bigType:(NSString *)bigType;

@property(nonatomic,retain)NSDictionary *bigDic;

@property(nonatomic,assign)BOOL isLove;

+(CGFloat)setUpWithHeightWithBigArray:(NSDictionary *)tempDic;
@end

NS_ASSUME_NONNULL_END
