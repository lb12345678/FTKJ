//
//  GuiGeView.h
//  FTKJ
//
//  Created by ios on 2019/11/22.
//  Copyright © 2019年 ios. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GuiGeView : UIView
@property(nonatomic,retain)NSString *bigType;//1 选择分类 2 加入购物车或购买


-(void)setUpWithNewBigView:(NSMutableDictionary *)tempDic bigType:(NSString *)bigType sptype:(NSString *)spType;

@property(nonatomic,retain)NSMutableDictionary *tempDic;

@property(nonatomic,retain)NSString *SpType;

@property(nonatomic,retain)UIViewController *bigControllerView;


@property(nonatomic,copy)void(^clickBlock)(NSString *tempStr);
@end

NS_ASSUME_NONNULL_END
