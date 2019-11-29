//
//  SCFLView.h
//  JZGL
//
//  Created by ios on 2019/8/6.
//  Copyright © 2019年 ios. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^queDing)(NSString *oneString,NSString *twoString,NSString *threeString,NSString *fourString,NSString *beginMoney,NSString *endMoney);


typedef void(^qianDao)(NSString *type);


@interface SCFLView : UIView



@property(nonatomic,copy)qianDao QD;

@property(nonatomic,copy)queDing QueDing;

@property(nonatomic,retain)NSString *bigType;

@property(nonatomic,retain)NSMutableArray *bigArray;

@property(nonatomic,retain)NSMutableArray *oneArray;

@property(nonatomic,retain)NSMutableArray *twoArray;

-(void)setUpWithBigArray:(NSMutableArray *)oneArray twoArray:(NSMutableArray *)twoArray;
@end

NS_ASSUME_NONNULL_END
