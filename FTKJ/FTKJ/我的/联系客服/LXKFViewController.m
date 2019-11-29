//
//  LXKFViewController.m
//  FTKJ
//
//  Created by ios on 2019/11/26.
//  Copyright © 2019年 ios. All rights reserved.
//

#import "LXKFViewController.h"
#import "YJFKViewController.h"

@interface LXKFViewController ()

@end

@implementation LXKFViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"联系客服";
    [self setUpWithBigView];
    // Do any additional setup after loading the view.
}
-(void)setUpWithBigView {
    
    UIView *bigView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kWidthChange(120))];
    bigView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bigView];
    
    for (int i = 0; i < 2; i++) {
        UILabel *oneLabel = [Toos setUpWithUserLabel:@"" CGRect:CGRectMake(kWidthChange(20), i * kWidthChange(60), kScreenWidth - kWidthChange(40), kWidthChange(60)) color:[UIColor clearColor] textColor:newColor(68, 69, 70, 1) textSize:kWidthChange(16)];
        
          UILabel *twoLabel = [Toos setUpWithUserLabel:@"" CGRect:CGRectMake(kWidthChange(20), i * kWidthChange(60), kScreenWidth - kWidthChange(40), kWidthChange(60)) color:[UIColor clearColor] textColor:newColor(155, 156, 157, 1) textSize:kWidthChange(16)];
        twoLabel.textAlignment = NSTextAlignmentRight;
        if (i == 0) {
            oneLabel.text = @"客服电话";
            twoLabel.text = @"123456789";
             [bigView addSubview:twoLabel];
        }else {
              oneLabel.text = @"意见反馈";
            
        }
        oneLabel.tag = 100 + i;
        
        [oneLabel addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickOneTap:)]];
        
        [bigView addSubview:oneLabel];
       
    }
    
    UILabel *lineLabel = [Toos setUpWithUserLabel:@"" CGRect:CGRectMake(kWidthChange(0),  kWidthChange(60), kScreenWidth , kWidthChange(1)) color:lineColor_gary textColor:newColor(68, 69, 70, 1) textSize:kWidthChange(16)];
    [bigView addSubview:lineLabel];
    
}
-(void)clickOneTap:(UITapGestureRecognizer *)sender {
    self.hidesBottomBarWhenPushed = YES;
    
    UILabel *nameLabel = (UILabel *)sender.view;
    if (nameLabel.tag == 100) {
        
    }else {
        YJFKViewController *YJFK = [[YJFKViewController alloc]init];
        [self.navigationController pushViewController:YJFK animated:YES];
        
    }
    
    
  
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
