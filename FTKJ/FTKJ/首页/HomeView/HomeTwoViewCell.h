//
//  HomeTwoViewCell.h
//  FTKJ
//
//  Created by ios on 2019/11/20.
//  Copyright © 2019年 ios. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HomeTwoViewCell : UITableViewCell


@property(nonatomic,retain)UIView *bigView;

-(void)setUpWithBigDic:(NSDictionary *)bigDic;



@end

NS_ASSUME_NONNULL_END
