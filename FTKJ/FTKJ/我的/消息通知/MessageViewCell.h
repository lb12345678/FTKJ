//
//  MessageViewCell.h
//  JZGL
//
//  Created by ios on 2019/8/9.
//  Copyright © 2019年 ios. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MessageViewCell : UITableViewCell

@property(nonatomic,retain)UIView *bigView;

-(void)setUpWithNewBigDic:(NSDictionary *)newDic;

+(CGFloat)setUpWithBigHeightWithDic:(NSDictionary *)newDic;

@property(nonatomic,copy)void(^ClickDelete)(NSDictionary *tempDic);

@property(nonatomic,retain)NSDictionary *tempDic;



@end

NS_ASSUME_NONNULL_END
