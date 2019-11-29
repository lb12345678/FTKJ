//
//  MyViewCell.h
//  YXKJ
//
//  Created by ios on 2018/10/12.
//  Copyright © 2018年 ios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyViewCell : UITableViewCell

@property(nonatomic,retain)UIImageView *cateImage;

@property(nonatomic,retain)UILabel *namelabel;

@property(nonatomic,retain)UIImageView *rightImage;

@property(nonatomic,retain)UILabel *lineLabel;

-(void)setUpWithNewDic:(NSDictionary *)newDic;


@end
