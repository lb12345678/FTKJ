//
//  MapView.m
//  FTKJ
//
//  Created by ios on 2019/11/28.
//  Copyright © 2019年 ios. All rights reserved.
//

#import "MapView.h"

@interface MapView()


@end


@implementation MapView



-(void)layoutSubviews {
    [super layoutSubviews];
    
    
    UIView *bigView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth - kWidthChange(66), kWidthChange(56))];
    bigView.backgroundColor = [UIColor whiteColor];
    bigView.layer.masksToBounds = YES;
    bigView.layer.cornerRadius = kWidthChange(5);
    [self addSubview:bigView];
    
    UILabel *oneLabel = [Toos setUpWithUserLabel:@"杜兰特" CGRect:CGRectMake(kWidthChange(20), 0, kScreenWidth - kWidthChange(66) - kWidthChange(115), kWidthChange(28)) color:[UIColor clearColor] textColor:newColor(0, 19, 37, 1) textSize:kWidthChange(19)];
    
    [bigView addSubview:oneLabel];
    UILabel *twoLabel = [Toos setUpWithUserLabel:@"杜兰特" CGRect:CGRectMake(kWidthChange(20), CGRectGetMaxY(oneLabel.frame), kScreenWidth - kWidthChange(66) - kWidthChange(115), kWidthChange(28)) color:[UIColor clearColor] textColor:newColor(149, 158, 164, 1) textSize:kWidthChange(17)];
    
     [bigView addSubview:twoLabel];
    
    
    UIButton *bayBT = [UIButton buttonWithType:UIButtonTypeCustom];
    bayBT.frame = CGRectMake(kScreenWidth - kWidthChange(66) - kWidthChange(75), kWidthChange(0),  kWidthChange(75), kWidthChange(56));
    bayBT.backgroundColor = newColor(250, 123, 35, 1);
  
    [bayBT setTitle:@"导航" forState:UIControlStateNormal];
    [bayBT setTitleColor:newColor(255, 255, 255, 1) forState:UIControlStateNormal];
    bayBT.titleLabel.font = [UIFont systemFontOfSize:kWidthChange(20)];
    [bigView addSubview:bayBT];
    [bayBT addTarget:self action:@selector(clickBayBT:) forControlEvents:UIControlEventTouchUpInside];
    
    
}


-(void)clickBayBT:(UIButton *)sender {
    
    
    
}




@end
