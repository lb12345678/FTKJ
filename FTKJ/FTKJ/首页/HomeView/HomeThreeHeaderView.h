//
//  HomeThreeHeaderView.h
//  FTKJ
//
//  Created by ios on 2019/11/20.
//  Copyright © 2019年 ios. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HomeThreeHeaderView : UITableViewHeaderFooterView

@property(nonatomic,retain)UIImageView *lineImage;

@property(nonatomic,retain)UILabel *nameLabel;

@property(nonatomic,retain)UIScrollView *bigScrollerView;


-(void)setUpWithNewBigDic:(NSDictionary *)newDic;






@end

NS_ASSUME_NONNULL_END
