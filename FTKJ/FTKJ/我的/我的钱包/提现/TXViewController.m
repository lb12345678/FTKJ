//
//  TXViewController.m
//  FTKJ
//
//  Created by ios on 2019/11/26.
//  Copyright © 2019年 ios. All rights reserved.
//

#import "TXViewController.h"

@interface TXViewController ()
@property(nonatomic,retain)UITextField *moneyTF;

@property(nonatomic,retain)UITextField *cardTF;

@property(nonatomic,retain)UITextField *nameTF;

@end

@implementation TXViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"提现";
    [self setUpWithBigView];
    // Do any additional setup after loading the view.
}
-(void)setUpWithBigView {
    
    
    
    
    UIView *bigView = [[UIView alloc]initWithFrame:CGRectMake(kWidthChange(15),  kWidthChange(22), kScreenWidth - kWidthChange(30), kWidthChange(160))];
    bigView.backgroundColor = [UIColor whiteColor];
    bigView.layer.masksToBounds = YES;
    bigView.layer.cornerRadius = 5;
    [self.view addSubview:bigView];
    
    
    UILabel *smallLabel = [Toos setUpWithUserLabel:@"提现金额" CGRect:CGRectMake(kWidthChange(15), kWidthChange(18) ,kScreenWidth -  20 ,kWidthChange(12)) color:[UIColor clearColor] textColor:newColor(153, 153, 153, 1) textSize:kWidthChange(16)];
    
    [bigView addSubview:smallLabel];
    
    
    UILabel *oneLabel = [Toos setUpWithUserLabel:@"¥" CGRect:CGRectMake(kWidthChange(15), kWidthChange(25) + CGRectGetMaxY(smallLabel.frame) ,kWidthChange(13) ,kWidthChange(18)) color:[UIColor clearColor] textColor:newColor(90, 99, 112, 1) textSize:kWidthChange(24)];
    
    [bigView addSubview:oneLabel];
    
    
    
    self.moneyTF = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(oneLabel.frame) + kWidthChange(24), kWidthChange(20) + CGRectGetMaxY(smallLabel.frame), kScreenWidth - kWidthChange(80), kWidthChange(28))];
    
    
    //    self.moneyTF.placeholder = [NSString stringWithFormat:@"可提现%.2f元",[self.moneyStr floatValue]];
    self.moneyTF.font = [UIFont systemFontOfSize:kWidthChange(14)];
    [self.moneyTF setValue:[UIFont systemFontOfSize:kWidthChange(14)] forKeyPath:@"_placeholderLabel.font"];
    self.moneyTF.keyboardType = UIKeyboardTypeDecimalPad;
    [bigView addSubview:self.moneyTF];
    
    
    UIButton *AllTX = [UIButton buttonWithType:UIButtonTypeCustom];
    AllTX.frame = CGRectMake(kScreenWidth - kWidthChange(30) - kWidthChange(15) - [Toos textRect:@"全部提现" textFont:[UIFont systemFontOfSize:kWidthChange(17)]], kWidthChange(20) + CGRectGetMaxY(smallLabel.frame), [Toos textRect:@"全部提现" textFont:[UIFont systemFontOfSize:kWidthChange(17)]], kWidthChange(28));
    [AllTX setTitle:@"全部提现" forState:UIControlStateNormal];
    [AllTX setTitleColor:newColor(250, 116, 28, 1) forState:UIControlStateNormal];
    AllTX.titleLabel.font = [UIFont systemFontOfSize:kWidthChange(17)];
    [bigView addSubview:AllTX];
    
    
    
    
    
    
    
    
    
    
    UILabel *lineLabel = [Toos setUpWithUserLabel:@"" CGRect:CGRectMake(kWidthChange(15), kWidthChange(100)  ,kScreenWidth - kWidthChange(60)  ,1) color:newColor(230, 230, 230, 1) textColor:newColor(81, 94, 150, 1) textSize:kWidthChange(14)];
    
    [bigView addSubview:lineLabel];
    
    NSArray *titleArray = @[@{@"title":@"绑定微信账号",@"message":@"请输入支付宝账号"}];
    
    for (int i = 0; i < 1; i++) {
        
        UIView *oneView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(lineLabel.frame) + kWidthChange(55) * i, kScreenWidth - kWidthChange(30), kWidthChange(55))];
        [bigView addSubview:oneView];
        UILabel *oneLabel = [Toos setUpWithUserLabel:[titleArray objectAtIndex:i][@"title"] CGRect:CGRectMake(kWidthChange(15),0 ,kScreenWidth ,kWidthChange(55)) color:[UIColor clearColor] textColor:newColor(45, 58, 83, 1) textSize:kWidthChange(16)];
        [oneView addSubview:oneLabel];
        
        UITextField *oneTf = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth - kWidthChange(45), kWidthChange(55))];
        
        
        oneTf.placeholder = [NSString stringWithFormat:@"%@",[titleArray objectAtIndex:i][@"message"]];
        oneTf.font = [UIFont systemFontOfSize:kWidthChange(16)];
        [oneTf setValue:[UIFont systemFontOfSize:kWidthChange(14)] forKeyPath:@"_placeholderLabel.font"];
        oneTf.textAlignment = NSTextAlignmentRight;
        [oneView addSubview:oneTf];
        if (i == 0) {
            self.cardTF = oneTf;
        }else {
            self.nameTF = oneTf;
            
        }
        
    }
    
    
    UILabel *downlineLabel = [Toos setUpWithUserLabel:@"提示:提现需绑定您的微信账号，直接转账到您的微信零钱包" CGRect:CGRectMake(kWidthChange(15), CGRectGetMaxY(bigView.frame) + kWidthChange(20)  ,kScreenWidth - kWidthChange(30)  ,kWidthChange(25)) color:newColor(230, 230, 230, 0) textColor:newColor(168, 169, 171, 1) textSize:kWidthChange(14)];
    
    [self.view addSubview:downlineLabel];
    
    
    
    
    UIButton *newBT = [UIButton buttonWithType:UIButtonTypeCustom];
    newBT.frame  = CGRectMake(kWidthChange(15), CGRectGetMaxY(downlineLabel.frame) + kWidthChange(60) , kScreenWidth - kWidthChange(30), kWidthChange(50));
    newBT.layer.masksToBounds = YES;
    newBT.layer.cornerRadius = kWidthChange(25);
    newBT.backgroundColor = newColor(230, 20, 50, 1);
    [newBT setTitle:@"提现" forState:UIControlStateNormal];
    [newBT setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    newBT.titleLabel.font = [UIFont systemFontOfSize:kWidthChange(15)];
    [newBT addTarget:self action:@selector(clickTiXian:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:newBT];
    
    
    
    
}

-(void)clickTiXian:(UITapGestureRecognizer *)sender {
    
    if (self.moneyTF.text.length == 0) {
        [Toos setUpWithMBP:@"请输入充值金额" UIView:self.view];
        return;
    }
    
    if (self.cardTF.text.length == 0) {
        [Toos setUpWithMBP:@"请输入您的支付宝账号" UIView:self.view];
        return;
    }
    if (self.nameTF.text.length == 0) {
        [Toos setUpWithMBP:@"请输入您的真实姓名" UIView:self.view];
        return;
    }
    
    [Toos dataWithSessionurl:@"/app/Integral/integral_tixian" body:@{@"uid":[UserModel shared].uid,@"price":self.moneyTF.text,@"name":self.nameTF.text,@"zhifubao":self.cardTF.text} view:self.view token:@"" Block:^(id tempData) {
        [Toos setUpWithMBP:tempData[@"msg"] UIView:[UIApplication sharedApplication].keyWindow];
        if ([tempData[@"code"]intValue] == 200) {
            [self.navigationController popViewControllerAnimated:YES];
        }
    } failBlock:^(id tempData) {
        
    }];
    
    
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
