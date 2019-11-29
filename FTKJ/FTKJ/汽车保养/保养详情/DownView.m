//
//  DownView.m
//  FTKJ
//
//  Created by ios on 2019/11/20.
//  Copyright © 2019年 ios. All rights reserved.
//

#import "DownView.h"
#import "QRDDViewController.h"
#import "GuiGeView.h"

@interface DownView()

@property(nonatomic,retain)UIView *bigView;

@property(nonatomic,retain)GuiGeView *GGView;
@end




@implementation DownView


-(void)layoutSubviews {
    [super layoutSubviews];
    
    
    UIView *smallView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth , kTabBarHeight)];
    smallView.backgroundColor = [UIColor whiteColor];
    [self addSubview:smallView];
    for (int i = 0; i < 2; i++) {
        
        UIButton *daohangBT = [UIButton buttonWithType:UIButtonTypeCustom];
        daohangBT.frame = CGRectMake(i * kWidthChange(80), 0, kWidthChange(80), kTabBarHeight);
        
        if (i == 0) {
            [daohangBT setImage:[UIImage imageNamed:@"box12"] forState:UIControlStateNormal];
            
            
            [daohangBT setTitle:@" 收藏" forState:UIControlStateNormal];
        }else {
            [daohangBT setImage:[UIImage imageNamed:@"box13"] forState:UIControlStateNormal];
            
            
            [daohangBT setTitle:@" 客服" forState:UIControlStateNormal];
            
            
        }
        
        [daohangBT setTitleColor:newColor(181, 188, 193, 1) forState:UIControlStateNormal];
        daohangBT.titleLabel.font = [UIFont systemFontOfSize:kWidthChange(12)];
        [smallView addSubview:daohangBT];
        [daohangBT addTarget:self action:@selector(clickDaoHangBT:) forControlEvents:UIControlEventTouchUpInside];
        
        
    }
    
    
    
    
    if ([self.FromStr intValue] == 1) {
        UIButton *daohangBT = [UIButton buttonWithType:UIButtonTypeCustom];
        daohangBT.frame = CGRectMake(( kScreenWidth - kWidthChange(20) - kWidthChange(120)) , kWidthChange(5), kWidthChange(120), kTabBarHeight - kWidthChange(10));
        
        daohangBT.backgroundColor = newColor(233, 20, 50, 1);
        daohangBT.layer.masksToBounds = YES;
        [daohangBT setTitle:@"立即购买" forState:UIControlStateNormal];
        daohangBT.layer.cornerRadius = (kTabBarHeight - kWidthChange(10)) / 2;
        [daohangBT setTitleColor:newColor(255, 255, 255, 1) forState:UIControlStateNormal];
        daohangBT.titleLabel.font = [UIFont systemFontOfSize:kWidthChange(14)];
        [smallView addSubview:daohangBT];
        [daohangBT addTarget:self action:@selector(clickAddGouWuChe:) forControlEvents:UIControlEventTouchUpInside];
    }else {
    
    
    
    
    for (int i = 0; i < 2; i++) {
        
        UIButton *daohangBT = [UIButton buttonWithType:UIButtonTypeCustom];
        daohangBT.frame = CGRectMake(( kScreenWidth - kWidthChange(25) - kWidthChange(160)) / 2 * i + i * kWidthChange(10) + kWidthChange(160), kWidthChange(5), ( kScreenWidth - kWidthChange(25) - kWidthChange(160)) / 2, kTabBarHeight - kWidthChange(10));
        
        if (i == 0) {
            [daohangBT setImage:[UIImage imageNamed:@"组 12"] forState:UIControlStateNormal];
            //
    
        }else {
            [daohangBT setImage:[UIImage imageNamed:@"组 13"] forState:UIControlStateNormal];
            
    
        }
        
        
        [daohangBT setTitle:[NSString stringWithFormat:@"%d",i] forState:UIControlStateNormal];
        
        daohangBT.tag = 300 + i;
        [daohangBT setTitleColor:newColor(255, 255, 255, 0) forState:UIControlStateNormal];
        daohangBT.titleLabel.font = [UIFont systemFontOfSize:kWidthChange(14)];
        [smallView addSubview:daohangBT];
        [daohangBT addTarget:self action:@selector(clickAddGouWuChe:) forControlEvents:UIControlEventTouchUpInside];
        
        
    }
    
    
    }
    
    
}

#pragma marl---导航
-(void)clickDaoHangBT:(UIButton *)sender {
    
    
    
}

-(void)clickAddGouWuChe:(UIButton *)sender {
    if ([sender.titleLabel.text isEqualToString:@"立即购买"]) {
        

        self.viewController.hidesBottomBarWhenPushed = YES;
        QRDDViewController *QRDD = [[QRDDViewController alloc]init];
        [self.viewController.navigationController pushViewController:QRDD animated:YES];
    }
    if ([sender.titleLabel.text isEqualToString:@"0"] || [sender.titleLabel.text isEqualToString:@"1"]) {
        
        if (self.GGView) {
            self.GGView.hidden = NO;
        }else {
            
            
            self.GGView = [[GuiGeView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
            self.GGView.bigControllerView = self.viewController;
            [[UIApplication sharedApplication].keyWindow addSubview:self.GGView];
        }
        
        
      
    }
    
}

@end
