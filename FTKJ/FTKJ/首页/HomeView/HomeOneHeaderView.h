//
//  HomeOneHeaderView.h
//  FTKJ
//
//  Created by ios on 2019/11/19.
//  Copyright © 2019年 ios. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HomeOneHeaderView : UITableViewHeaderFooterView


@property(nonatomic,retain)UIView *bigView;


-(void)setUpWithNewBigDic:(NSDictionary *)newDic;


@end

NS_ASSUME_NONNULL_END
