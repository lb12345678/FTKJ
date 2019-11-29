//
//  JSCGView.m
//  FTKJ
//
//  Created by ios on 2019/11/20.
//  Copyright © 2019年 ios. All rights reserved.
//

#import "JSCGView.h"

@interface JSCGView()

@property(nonatomic,retain)UIView *bigView;


@end


@implementation JSCGView


-(void)layoutSubviews {
    [super layoutSubviews];
    self.bigView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - kTopHeight - downH)];
    self.bigView.backgroundColor = newColor(241, 242, 244, 1);
    
    [self addSubview:self.bigView];
    
    UIImageView *TimeImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"box29"]];
    TimeImage.frame = CGRectMake(kScreenWidth / 2 - kWidthChange(75),  kWidthChange(50), kWidthChange(150), kWidthChange(140));
    [self.bigView addSubview:TimeImage];
   
    
    UILabel *nameLabel = [Toos setUpWithUserLabel:@"支付方式：微信" CGRect:CGRectMake(0, CGRectGetMaxY(TimeImage.frame) + kWidthChange(50), kScreenWidth, kWidthChange(30)) color:[UIColor clearColor] textColor:newColor(135, 136, 137, 1) textSize:kWidthChange(15)];
    
    [self.bigView addSubview:nameLabel];
    nameLabel.textAlignment = NSTextAlignmentCenter;
    
    
    UILabel *moneyLabel = [Toos setUpWithUserLabel:@"123" CGRect:CGRectMake(0, CGRectGetMaxY(nameLabel.frame) + kWidthChange(10), kScreenWidth, kWidthChange(25)) color:[UIColor clearColor] textColor:newColor(0, 0, 0, 1) textSize:kWidthChange(22)];
    
    [self.bigView addSubview: moneyLabel];
    
    moneyLabel.textAlignment = NSTextAlignmentCenter;
    
    
    for (int i = 0; i < 2; i++) {
        UIButton *bayBT = [UIButton buttonWithType:UIButtonTypeCustom];
        bayBT.frame = CGRectMake(kWidthChange(64), CGRectGetMaxY(moneyLabel.frame) + kWidthChange(86) + i * kWidthChange(70), kScreenWidth - kWidthChange(64) * 2, kWidthChange(50));
        
        if (i == 0) {
              bayBT.backgroundColor = newColor(230, 21, 50, 1);
            [bayBT setTitle:@"查看订单" forState:UIControlStateNormal];
              [bayBT setTitleColor:newColor(255, 255, 255, 1) forState:UIControlStateNormal];
        }else {
            
            
            bayBT.backgroundColor = newColor(241, 242, 244, 1);
            
            [bayBT setTitle:@"返回首页" forState:UIControlStateNormal];
              [bayBT setTitleColor:newColor(117, 118, 118, 1) forState:UIControlStateNormal];
            bayBT.layer.borderWidth = 1;
            bayBT.layer.borderColor = newColor(203, 205, 206, 1).CGColor;
        }
        
        
        
        
      
        bayBT.layer.masksToBounds = YES;
        bayBT.layer.cornerRadius = kWidthChange(25);
        
      
        bayBT.titleLabel.font = [UIFont systemFontOfSize:kWidthChange(15)];
        [self.bigView addSubview:bayBT];
        [bayBT addTarget:self action:@selector(clickBayBT:) forControlEvents:UIControlEventTouchUpInside];
    }
    

    
    
}

-(void)clickBayBT:(UIButton *)sender {
    
    
    
}






@end
