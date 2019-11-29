//
//  MyOrderViewCell.h
//  FTKJ
//
//  Created by ios on 2019/11/25.
//  Copyright © 2019年 ios. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyOrderViewCell : UITableViewCell

@property(nonatomic,retain)UIView *bigView;

-(void)setUpWithOneBigView:(NSMutableDictionary *)tempDic indexPath:(NSIndexPath *)indexPath;

+(CGFloat)setUpWithHeightWithNewDic:(NSMutableDictionary *)newDic;

@property(nonatomic,retain)NSMutableDictionary *tempDic;

@property(nonatomic,copy)void(^ClickBlock)(NSString *title,NSMutableDictionary *tempDic);


@end

NS_ASSUME_NONNULL_END
