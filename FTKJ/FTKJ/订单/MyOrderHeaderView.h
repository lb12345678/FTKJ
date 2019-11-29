//
//  MyOrderHeaderView.h
//  FTKJ
//
//  Created by ios on 2019/11/25.
//  Copyright © 2019年 ios. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyOrderHeaderView : UITableViewHeaderFooterView

@property(nonatomic,retain)UIView *bigView;


-(void)setUpWithBigArray:(NSArray *)bigArray;


@end

NS_ASSUME_NONNULL_END
