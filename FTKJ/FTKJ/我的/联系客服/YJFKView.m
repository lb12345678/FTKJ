//
//  YJFKView.m
//  FTKJ
//
//  Created by ios on 2019/11/27.
//  Copyright © 2019年 ios. All rights reserved.
//

#import "YJFKView.h"

@interface YJFKView()

@property(nonatomic,retain)UIView *alphaView;

@property(nonatomic,retain)UIView *bigView;

@end



@implementation YJFKView

-(void)layoutSubviews {
    
    [super layoutSubviews];
    
    self.alphaView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    self.alphaView.backgroundColor = [UIColor lightGrayColor];
    self.alphaView.alpha = .4;
    [self addSubview:self.alphaView];
    
    self.bigView = [[UIView alloc]initWithFrame:CGRectMake(kWidthChange(20), kScreenHeight / 2 - kWidthChange(145) / 2, kScreenWidth - kWidthChange(40), kWidthChange(145))];
    self.bigView.backgroundColor = [UIColor whiteColor];
    [self.bigView setCornerRadius:kWidthChange(10)];
    [self addSubview:self.bigView];
    
  
    UILabel *nameLabel = [Toos setUpWithUserLabel:@"" CGRect:CGRectMake(0, kWidthChange(35), kScreenWidth - kWidthChange(40),   [Toos getSpaceLabelHeight:@"感谢您提供宝贵的建议及意见！\n您的意见已成功提交。" withFont:[UIFont systemFontOfSize:kWidthChange(22)] withWidth:kScreenWidth - kWidthChange(40) jianju:2 suojin:2]) color:[UIColor clearColor] textColor:newColor(0, 0, 0, 1) textSize:kWidthChange(22)];
    nameLabel.attributedText = [Toos setLabelSpacewithValue:@"感谢您提供宝贵的建议及意见！\n您的意见已成功提交。" withFont:[UIFont systemFontOfSize:kWidthChange(22)] jianju:2 suojin:2];
    nameLabel.textAlignment = NSTextAlignmentCenter;
    nameLabel.numberOfLines = 0;
    [self.bigView addSubview:nameLabel];
    
    UIButton *TJBT = [UIButton buttonWithType:UIButtonTypeCustom];
    
    TJBT.frame = CGRectMake((kScreenWidth - kWidthChange(40)) / 2 - kWidthChange(155) / 2, kWidthChange(145) - kWidthChange(25) - kWidthChange(50),kWidthChange(155), kWidthChange(50));
    TJBT.backgroundColor = newColor(233, 20, 50, 1);
    [TJBT setTitle:@"确定" forState:UIControlStateNormal];
    [TJBT setTitleColor:newColor(255, 255,255, 1) forState:UIControlStateNormal];
    TJBT.titleLabel.font = [UIFont systemFontOfSize:kWidthChange(16)];
    TJBT.layer.masksToBounds = YES;
    TJBT.layer.cornerRadius = 10;
    [self.bigView addSubview:TJBT];
    [TJBT addTarget:self action:@selector(clickTJBT:) forControlEvents:UIControlEventTouchUpInside];
    
}
-(void)clickTJBT:(UIButton *)sender {
    
    [self.ViewController.navigationController popViewControllerAnimated:YES];
    self.hidden = YES;

}
@end
