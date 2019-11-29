//
//  DingWeiOneViewCell.h
//  YXKJ
//
//  Created by ios on 2018/10/19.
//  Copyright © 2018年 ios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DingWeiOneViewCell : UITableViewCell

@property(nonatomic,retain)UIView *bigView;

@property(nonatomic,retain)NSArray *dataArray;

@property(nonatomic,copy)void(^ClickBlock)(NSDictionary *newDic);

-(void)setUpWithNewArray:(NSArray *)newArray;



+(CGFloat)setUpWitiHeightWithArray:(NSArray *)nameArray;


@end
