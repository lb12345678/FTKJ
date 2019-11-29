//
//  TuiHuoView.m
//  FTKJ
//
//  Created by ios on 2019/11/25.
//  Copyright © 2019年 ios. All rights reserved.
//

#import "TuiHuoView.h"
#import "SQTHViewController.h"

@interface TuiHuoView()

@property(nonatomic,retain)UIView *alphaView;

@property(nonatomic,retain)UIView *bigView;



@end

@implementation TuiHuoView

-(void)layoutSubviews {
    
    [super layoutSubviews];
    
    self.alphaView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    self.alphaView.backgroundColor = [UIColor lightGrayColor];
    self.alphaView.alpha = .4;
    [self addSubview:self.alphaView];
    
    
    UIView *bigView = [[UIView alloc]initWithFrame:CGRectMake(0, kScreenHeight - downH - kWidthChange(160), kScreenHeight, kWidthChange(200))];
    bigView.backgroundColor = [UIColor whiteColor];
    bigView.layer.masksToBounds = YES;
    bigView.layer.cornerRadius = 10;
    [self addSubview:bigView];
    
    
    
    
    
    
    
    UILabel *LeiXingLabel = [Toos setUpWithUserLabel:@"选择售后类型" CGRect:CGRectMake(kWidthChange(15), kWidthChange(20), kScreenWidth - kWidthChange(30), kWidthChange(50)) color:[UIColor clearColor] textColor:newColor(0, 32, 50, 1) textSize:kWidthChange(17)];
    [bigView addSubview:LeiXingLabel];
    
    
    
    
    
    NSArray *oneArray = @[@{@"title":@"退货",@"message":@"已收到货，需要退回商品",@"icon":@"box33-1"},@{@"title":@"换货",@"message":@"已收到货，需要更换已收到的商品",@"icon":@"icon_8order_change"},@{@"title":@"杜兰特 156",@"message":@"洛杉矶",@"icon":@"icon_8order_location"}];
    
    for (int i = 0; i < 1; i++) {
        
        UIView *smallView = [[UIView alloc]initWithFrame:CGRectMake(0,CGRectGetMaxY(LeiXingLabel.frame) + i * kWidthChange(80), kScreenWidth, kWidthChange(80))];
        smallView.backgroundColor = [UIColor clearColor];
        [bigView addSubview:smallView];
        smallView.tag = 100 + i;
        [smallView addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickCategory:)]];
        UIImageView *oneImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@""]];
        oneImage.image = [UIImage imageNamed:[oneArray objectAtIndex:i][@"icon"]];
        oneImage.frame = CGRectMake(kWidthChange(15), kWidthChange(40) - kWidthChange(15), kWidthChange(30), kWidthChange(30));
        [smallView addSubview:oneImage];
        UILabel *oneLabel = [Toos setUpWithUserLabel:[oneArray objectAtIndex:i][@"title"] CGRect:CGRectMake(CGRectGetMaxX(oneImage.frame) + kWidthChange(25), kWidthChange(15), kScreenWidth - kWidthChange(50), kWidthChange(20)) color:[UIColor clearColor] textColor:newColor(85, 92, 104, 1) textSize:kWidthChange(18)];
        
        [smallView addSubview:oneLabel];
        oneLabel.userInteractionEnabled = NO;
        
        UILabel *twoLabel = [Toos setUpWithUserLabel:[oneArray objectAtIndex:i][@"message"] CGRect:CGRectMake(CGRectGetMaxX(oneImage.frame) + kWidthChange(25), CGRectGetMaxY(oneLabel.frame) + kWidthChange(10) , kScreenWidth - kWidthChange(50), kWidthChange(20)) color:[UIColor clearColor] textColor:newColor(164, 174, 181, 1) textSize:kWidthChange(14)];
        
        [smallView addSubview:twoLabel];
        twoLabel.userInteractionEnabled = NO;
//        UILabel *lineLabel = [Toos setUpWithUserLabel:@"" CGRect:CGRectMake(CGRectGetMaxX(oneImage.frame) + kWidthChange(25), kWidthChange(80) - 1 , kScreenWidth - kWidthChange(50) - CGRectGetMaxX(oneImage.frame), 1) color:lineColor_gary textColor:newColor(164, 174, 181, 1) textSize:kWidthChange(14)];
        
//        [smallView addSubview:lineLabel];
        UIImageView *rightImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"box44"]];
        
        rightImage.frame = CGRectMake(kScreenWidth - kWidthChange(50), kWidthChange(40) - kWidthChange(15) / 2, kWidthChange(10), kWidthChange(15));
        rightImage.contentMode = UIViewContentModeScaleAspectFill;
        [smallView addSubview:rightImage];
    }
    
    
    
}
-(void)clickCategory:(UITapGestureRecognizer *)sender {
    self.hidden = YES;
    self.viewController.hidesBottomBarWhenPushed = YES;
    SQTHViewController *SQTH = [[SQTHViewController alloc]init];
    [self.viewController.navigationController pushViewController:SQTH animated:YES];
    
}
@end
