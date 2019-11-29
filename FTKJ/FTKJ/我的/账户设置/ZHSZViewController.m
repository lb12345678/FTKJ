//
//  ZHSZViewController.m
//  FTKJ
//
//  Created by ios on 2019/11/22.
//  Copyright © 2019年 ios. All rights reserved.
//

#import "ZHSZViewController.h"

@interface ZHSZViewController ()

@end

@implementation ZHSZViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"账户设置";
    [self setUpWithBigView];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
}

-(void)setUpWithBigView {
    
    UIImageView *oneImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bg4"]];
    oneImageView.frame = CGRectMake(kWidthChange(20), kWidthChange(20), kScreenWidth - kWidthChange(40), kWidthChange(106));
    [self.view addSubview:oneImageView];
    
    UILabel *oneLabel = [Toos setUpWithUserLabel:@"130123123123" CGRect:CGRectMake(kWidthChange(35), kWidthChange(25), kScreenWidth - kWidthChange(60), kWidthChange(20)) color:[UIColor clearColor] textColor:newColor(43, 43, 44, 1) textSize:kWidthChange(20)];
    oneLabel.font = [UIFont systemFontOfSize:kWidthChange(20) weight:UIFontWeightBold];
    [oneImageView addSubview:oneLabel];
    
    
    UILabel *twoLabel = [Toos setUpWithUserLabel:@"绑定手机号" CGRect:CGRectMake(kWidthChange(35), CGRectGetMaxY(oneLabel.frame) + kWidthChange(16), kScreenWidth - kWidthChange(60), kWidthChange(20)) color:[UIColor clearColor] textColor:newColor(60, 60, 62, 1) textSize:kWidthChange(16)];
  
    [oneImageView addSubview:twoLabel];
    
    
    
    UIView *twoView = [[UIView alloc]initWithFrame:CGRectMake(kWidthChange(20), CGRectGetMaxY(oneImageView.frame) + kWidthChange(20), kScreenWidth - kWidthChange(40), kWidthChange(210))];
   // twoView.layer.masksToBounds = YES;
    twoView.layer.cornerRadius = kWidthChange(10);
    twoView.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:twoView];
    
    [twoView shadow:newColor(230, 231, 232, 1) opacity:1 radius:5 offset:CGSizeMake(0, 0)];
    
    
    NSArray *oneArray = @[@{@"icon":@"box25-1",@"title":@"修改登录密码"},@{@"icon":@"setting_phone",@"title":@"更换绑定手机号"},@{@"icon":@"setting_pay",@"title":@"修改支付密码"}];
    
    for (int i = 0; i < 3; i++) {
        
        UIView *smallView = [[UIView alloc]initWithFrame:CGRectMake(0, i * kWidthChange(70), kScreenWidth - kWidthChange(40), kWidthChange(70))];
        [twoView addSubview:smallView];
        [smallView addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickXinXi:)]];
        
        UIImageView *twoImage = [[UIImageView alloc]initWithFrame:CGRectMake(kWidthChange(20), kWidthChange(15), kWidthChange(40), kWidthChange(40))];
        
        twoImage.image = [UIImage imageNamed:[oneArray objectAtIndex:i][@"icon"]];
        [smallView addSubview:twoImage];
        
        
        UILabel *twoLabel = [Toos setUpWithUserLabel:[oneArray objectAtIndex:i][@"title"] CGRect:CGRectMake(CGRectGetMaxX(twoImage.frame) + kWidthChange(20), 0, kScreenWidth, kWidthChange(70)) color:[UIColor clearColor] textColor:newColor(50, 51, 52, 1) textSize:kWidthChange(17)];
         [smallView addSubview:twoLabel];
        
        twoLabel.userInteractionEnabled = NO;
        UILabel *threeLabel = [Toos setUpWithUserLabel:[oneArray objectAtIndex:i][@"title"] CGRect:CGRectMake(0, 0, kScreenWidth - kWidthChange(60), kWidthChange(70)) color:[UIColor clearColor] textColor:newColor(50, 51, 52, 1) textSize:kWidthChange(17)];
        threeLabel.textAlignment = NSTextAlignmentRight;
        threeLabel.userInteractionEnabled = NO;
        if (i == 2) {
            [smallView addSubview:threeLabel];
        }
    }
    
    UIView *twoSmallView = [[UIView alloc]initWithFrame:CGRectMake(kWidthChange(20), CGRectGetMaxY(oneImageView.frame) + kWidthChange(250), kScreenWidth - kWidthChange(40), kWidthChange(70))];
    [self.view addSubview:twoSmallView];
    twoSmallView.backgroundColor = [UIColor whiteColor];
    //twoSmallView.layer.masksToBounds = YES;
    twoSmallView.layer.cornerRadius = kWidthChange(10);
    
      [twoSmallView shadow:newColor(230, 231, 232, 1) opacity:1 radius:5 offset:CGSizeMake(0, 0)];
    
    UIImageView *threeImage = [[UIImageView alloc]initWithFrame:CGRectMake(kWidthChange(20), kWidthChange(15), kWidthChange(40), kWidthChange(40))];
    
    threeImage.image = [UIImage imageNamed:@"box28-1"];
    [twoSmallView addSubview:threeImage];
    
    
    UILabel *threeLabel = [Toos setUpWithUserLabel:@"微信" CGRect:CGRectMake(CGRectGetMaxX(threeImage.frame) + kWidthChange(20), 0, kScreenWidth, kWidthChange(70)) color:[UIColor clearColor] textColor:newColor(50, 51, 52, 1) textSize:kWidthChange(17)];
    [twoSmallView addSubview:threeLabel];
    
    
    UILabel *threeDownLabel = [Toos setUpWithUserLabel:@"绑定" CGRect:CGRectMake(kScreenWidth - kWidthChange(60) - kWidthChange(70), kWidthChange(20),kWidthChange(70) , kWidthChange(30)) color:newColor(250, 112, 35, 1) textColor:newColor(255, 255, 255, 1) textSize:kWidthChange(15)];
    
    threeDownLabel.layer.masksToBounds = YES;
    threeDownLabel.layer.cornerRadius =kWidthChange(15);
    threeDownLabel.textAlignment = NSTextAlignmentCenter;
    [twoSmallView addSubview:threeDownLabel];
    
  
    
    
}

#pragma mark---更改信息
-(void)clickXinXi:(UITapGestureRecognizer *)sender {
    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
