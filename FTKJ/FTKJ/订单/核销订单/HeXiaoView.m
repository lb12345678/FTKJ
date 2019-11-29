//
//  HeXiaoView.m
//  FTKJ
//
//  Created by ios on 2019/11/27.
//  Copyright © 2019年 ios. All rights reserved.
//

#import "HeXiaoView.h"


@interface HeXiaoView()

@property(nonatomic,retain)UITextField *nameTF;

@property(nonatomic,retain)UIView *alphaView;

@property(nonatomic,retain)UIView *bigView;

@end



@implementation HeXiaoView

-(void)layoutSubviews {
    [super layoutSubviews];
    self.alphaView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    self.alphaView.backgroundColor = [UIColor lightGrayColor];
    self.alphaView.alpha = .4;
    [self addSubview:self.alphaView];
    
    self.bigView = [[UIView alloc]initWithFrame:CGRectMake(0, kScreenHeight - downH - kWidthChange(210), kScreenWidth, kWidthChange(230))];
    self.bigView.backgroundColor = [UIColor whiteColor];
    self.bigView.layer.masksToBounds = YES;
    self.bigView.layer.cornerRadius = kWidthChange(10);
    [self addSubview:self.bigView];
    
    UILabel *nameLabel = [Toos setUpWithUserLabel:@"订单核销" CGRect:CGRectMake(kWidthChange(20), 0, kScreenWidth, kWidthChange(45)) color:[UIColor clearColor] textColor:newColor(65, 65, 66, 1) textSize:kWidthChange(17)];
    
    [self.bigView addSubview:nameLabel];
    
    UIButton *canculBT = [UIButton buttonWithType:UIButtonTypeCustom];
    
    
    [canculBT setImage:[UIImage imageNamed:@"box22"] forState:UIControlStateNormal];
    canculBT.frame = CGRectMake(kScreenWidth - kWidthChange(45), kWidthChange(10),kWidthChange(25), kWidthChange(25));
    [canculBT addTarget:self action:@selector(clickCanCul:) forControlEvents:UIControlEventTouchUpInside];
    [self.bigView addSubview:canculBT];
    
    
    self.nameTF = [[UITextField alloc]initWithFrame:CGRectMake(kWidthChange(20), CGRectGetMaxY(nameLabel.frame) + kWidthChange(20), kScreenWidth - kWidthChange(40), kWidthChange(45))];
    self.nameTF.layer.masksToBounds = YES;
    self.nameTF.layer.cornerRadius = 5;
    self.nameTF.layer.borderWidth = 1;
    self.nameTF.layer.borderColor = newColor(234, 236, 235, 1).CGColor;
    self.nameTF.textAlignment = NSTextAlignmentCenter;
    self.nameTF.font = [UIFont systemFontOfSize:kWidthChange(16)];
    [self.bigView addSubview:self.nameTF];
    
    
    
    UIButton *bayBT = [UIButton buttonWithType:UIButtonTypeCustom];
    bayBT.frame = CGRectMake(kWidthChange(20), CGRectGetMaxY(self.nameTF.frame) + kWidthChange(20), kScreenWidth - kWidthChange(40), kWidthChange(40));
    bayBT.backgroundColor = newColor(230, 21, 50, 1);
    bayBT.layer.masksToBounds = YES;
    bayBT.layer.cornerRadius = kWidthChange(20);
    [bayBT setTitle:@"确定" forState:UIControlStateNormal];
    [bayBT setTitleColor:newColor(255, 255, 255, 1) forState:UIControlStateNormal];
    bayBT.titleLabel.font = [UIFont systemFontOfSize:kWidthChange(15)];
    [self.bigView addSubview:bayBT];
    [bayBT addTarget:self action:@selector(clickBayBT:) forControlEvents:UIControlEventTouchUpInside];
    
}

-(void)clickCanCul:(UIButton *)sender {
    
    
    self.hidden = YES;
}
-(void)clickBayBT:(UIButton *)sender {
    
    
    
}




@end
