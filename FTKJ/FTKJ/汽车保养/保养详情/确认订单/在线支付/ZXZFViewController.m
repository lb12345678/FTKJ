//
//  ZXZFViewController.m
//  FTKJ
//
//  Created by ios on 2019/11/20.
//  Copyright © 2019年 ios. All rights reserved.
//

#import "ZXZFViewController.h"
#import "JSCGView.h"

@interface ZXZFViewController ()

@property(nonatomic,retain)UILabel *timeLabel;

@property(nonatomic,assign)int time;

 @property(nonatomic,retain)NSTimer *timer;

@end

@implementation ZXZFViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.time = 3601;
     self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(payTime:) userInfo:nil repeats:YES];
    self.navigationItem.title = @"在线支付";
    [self setUpWithBigView];
    // Do any additional setup after loading the view.
}

-(void)setUpWithBigView {
UIImageView *TimeImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"box23"]];
TimeImage.frame = CGRectMake(kScreenWidth / 2 - kWidthChange(30),  kWidthChange(33), kWidthChange(60), kWidthChange(60));
[self.view addSubview:TimeImage];


UILabel *nameLabel = [Toos setUpWithUserLabel:@"恭喜，订单提交成功" CGRect:CGRectMake(0, CGRectGetMaxY(TimeImage.frame) + kWidthChange(15), kScreenWidth, kWidthChange(30)) color:[UIColor clearColor] textColor:newColor(0, 0, 0, 1) textSize:kWidthChange(24)];

[self.view addSubview:nameLabel];
    nameLabel.textAlignment = NSTextAlignmentCenter;
    
    
self.timeLabel = [Toos setUpWithUserLabel:@"" CGRect:CGRectMake(0, CGRectGetMaxY(nameLabel.frame) + kWidthChange(5), kScreenWidth, kWidthChange(20)) color:[UIColor clearColor] textColor:newColor(87, 88, 89, 1) textSize:kWidthChange(15)];

[self.view addSubview: self.timeLabel];

 self.timeLabel.textAlignment = NSTextAlignmentCenter;





//self.timeLabel.text = [NSString stringWithFormat:@"剩%@自动取消订单",[Toos setUpWithTime:[NSString stringWithFormat:@"%d",self.time] foementData:@"mm分ss秒"]];

UIView *bigView = [[UIView alloc]initWithFrame:CGRectMake(kWidthChange(15), CGRectGetMaxY(self.timeLabel.frame) + kWidthChange(50), kScreenWidth - kWidthChange(30), kWidthChange(300))];
bigView.layer.masksToBounds = YES;
bigView.layer.cornerRadius = 5;
[self.view addSubview:bigView];
bigView.backgroundColor = [UIColor whiteColor];

//UILabel *oneLabel = [Toos setUpWithUserLabel:[NSString stringWithFormat:@"订单号：%@",self.tempDic[@"order_number"]] CGRect:CGRectMake(kWidthChange(20), kWidthChange(15), kScreenWidth - kWidthChange(30), kWidthChange(20)) color:[UIColor clearColor] textColor:newColor(0, 0, 0, 1) textSize:kWidthChange(16)];
//
//[bigView addSubview:oneLabel];
//
//UILabel *twoLabel = [Toos setUpWithUserLabel:[NSString stringWithFormat:@"应付款：¥ %@",self.tempDic[@"pay_price"]] CGRect:CGRectMake(kWidthChange(20), CGRectGetMaxY(oneLabel.frame) + kWidthChange(5), kScreenWidth - kWidthChange(30), kWidthChange(20)) color:[UIColor clearColor] textColor:newColor(0, 0, 0, 1) textSize:kWidthChange(20)];

    
    UILabel *oneLabel = [Toos setUpWithUserLabel:[NSString stringWithFormat:@"订单号：%@",@"123456"] CGRect:CGRectMake(kWidthChange(20), kWidthChange(15), kScreenWidth - kWidthChange(30), kWidthChange(20)) color:[UIColor clearColor] textColor:newColor(0, 0, 0, 1) textSize:kWidthChange(16)];
    
    [bigView addSubview:oneLabel];
    
    UILabel *twoLabel = [Toos setUpWithUserLabel:[NSString stringWithFormat:@"应付款：¥ %@",@"12"] CGRect:CGRectMake(kWidthChange(20), CGRectGetMaxY(oneLabel.frame) + kWidthChange(5), kScreenWidth - kWidthChange(30), kWidthChange(20)) color:[UIColor clearColor] textColor:newColor(0, 0, 0, 1) textSize:kWidthChange(20)];

    
    
    
    
[bigView addSubview:twoLabel];


UILabel *lineLabel = [Toos setUpWithUserLabel:@"" CGRect:CGRectMake(kWidthChange(20), kWidthChange(75), kScreenWidth - kWidthChange(70), 1) color:lineColor_gary textColor:newColor(71, 80, 142, 1) textSize:kWidthChange(17)];

[bigView addSubview:lineLabel];


NSArray *imageArray ;

NSArray *nameArray ;



    imageArray = @[@"box24",@"box25",@"box26"];
    
    nameArray = @[@"微信",@"支付宝",@"余额支付"];
    

CGRect bigFrame = bigView.frame;
bigFrame.size.height = CGRectGetMaxY(lineLabel.frame) + nameArray.count * kWidthChange(75);

bigView.frame = bigFrame;


for (int i = 0; i < nameArray.count; i++) {
    
    UIButton *newBT = [UIButton buttonWithType:UIButtonTypeCustom];
    newBT.frame = CGRectMake(0, CGRectGetMaxY(lineLabel.frame) + i * kWidthChange(75), kScreenWidth - kWidthChange(30), kWidthChange(75));
    [bigView addSubview:newBT];
    [newBT addTarget:self action:@selector(clickPayDD:) forControlEvents:UIControlEventTouchUpInside];
    newBT.tag = 300 + i;
    UIImageView *smallImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:[imageArray objectAtIndex:i]]];
    
    
    smallImage.frame = CGRectMake(kWidthChange(20), kWidthChange(75) / 2 - kWidthChange(20), kWidthChange(40), kWidthChange(40));
    smallImage.image = [UIImage imageNamed:[imageArray objectAtIndex:i]];
    
    [newBT addSubview:smallImage];
    
    UILabel *smallLabel = [Toos setUpWithUserLabel:[nameArray objectAtIndex:i] CGRect:CGRectMake(CGRectGetMaxX(smallImage.frame) + kWidthChange(15), kWidthChange(10), kScreenWidth - 30, kWidthChange(55)) color:[UIColor clearColor] textColor:newColor(68, 77, 86, 1) textSize:kWidthChange(17)];
    [newBT addSubview:smallLabel];
    smallLabel.userInteractionEnabled = NO;
    
    UIImageView *KuaiDiImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"box21"]];
    KuaiDiImage.frame = CGRectMake(kScreenWidth - kWidthChange(30) -kWidthChange(35) - kWidthChange(12),  kWidthChange(37.5) - kWidthChange(10), kWidthChange(12), kWidthChange(20));
    
    
    
    UILabel *YueLabel = [Toos setUpWithUserLabel:@"余额不足" CGRect:CGRectMake(0, kWidthChange(10), kScreenWidth - kWidthChange(65), kWidthChange(55)) color:[UIColor clearColor] textColor:newColor(183, 191, 199, 1) textSize:kWidthChange(14)];
    
    YueLabel.textAlignment = NSTextAlignmentRight;
    
    
    if (i == 2) {
        CGRect smallFrame = smallLabel.frame;
        smallFrame.origin.y = kWidthChange(15);
        smallFrame.size.height = kWidthChange(25);
        smallLabel.frame = smallFrame;
        
        NSString *moneyStr = @"0";
        
//        if ([Toos isNotBlank:self.tempDic[@"user_wallet"]]) {
//            moneyStr = [NSString stringWithFormat:@"%@",self.tempDic[@"user_wallet"]];
//        }
        
        
        
        UILabel *moneyLabel = [Toos setUpWithUserLabel:[NSString stringWithFormat:@"共用余额：%@",moneyStr] CGRect:CGRectMake(CGRectGetMaxX(smallImage.frame) + kWidthChange(15), CGRectGetMaxY(smallLabel.frame), kScreenWidth - 30, kWidthChange(20)) color:[UIColor clearColor] textColor:newColor(181, 190, 198, 1) textSize:kWidthChange(12)];
        [newBT addSubview:moneyLabel];
        
        
//        if ([self.tempDic[@"pay_price"]floatValue] >[self.tempDic[@"user_wallet"]floatValue] ) {
//            [newBT addSubview:YueLabel];
//            newBT.userInteractionEnabled = NO;
//        }
//
        
        
        YueLabel.userInteractionEnabled = NO;
        moneyLabel.userInteractionEnabled = NO;
    }else {
        [newBT addSubview:KuaiDiImage];
        
        
    }
    
    
    UILabel *lineLabel = [Toos setUpWithUserLabel:@"" CGRect:CGRectMake(kWidthChange(20), kWidthChange(75) , kScreenWidth - kWidthChange(70), 1) color:[UIColor lightGrayColor] textColor:newColor(59, 59, 59, 1) textSize:kWidthChange(14)];
    [newBT addSubview:lineLabel];
    lineLabel.alpha = .3;
    
    
    
}


}
#pragma mark---支付时间
-(void)payTime:(NSTimer *)timer {
    
    
    
    if (self.time > 0) {
        self.time --;
    }else {
        [self.timer invalidate];
        self.timer = nil;
        [Toos setUpWithMBP:@"订单已超时" UIView:self.view];
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
   
    self.timeLabel.text = [NSString stringWithFormat:@"剩%d时%@自动取消订单", self.time / 3600,[Toos setUpWithTime:[NSString stringWithFormat:@"%d",self.time] foementData:@"mm分ss秒"]];
    
    
    
}








-(void)clickPayDD:(UIButton *)sender {
    NSString *type;
    if (sender.tag == 300) {
        type = @"1";
        //[self setUpWithNewDic:type passWord:@""];
    }else if (sender.tag == 301){
        type = @"2";
        //[self setUpWithNewDic:type passWord:@""];
    }else if (sender.tag == 302){
        type = @"3";
        
        
//        if (self.passWordView ) {
//            self.passWordView.hidden = NO;
//        }else {
//            self.passWordView = [[ZhiFuPassWord alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
//            self.passWordView.hidden = NO;
//
//
//            [[UIApplication sharedApplication].keyWindow addSubview:self.passWordView];
//
//
//            self.passWordView.ZFMoney = self.tempDic[@"pay_price"];
//
//        }
//
//
//
//        [self.passWordView setUpWithName:@"" money:self.tempDic[@"pay_price"] ];
//
//        __weak typeof(self)weakSelf = self;
//
//        self.passWordView.returnPasswordStringBlock = ^(NSString *password) {
//
//            [weakSelf setUpWithNewDic:type passWord:password];
//
//        };
//
        
        
        
    }
    
    JSCGView *JSCG = [[JSCGView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - kTopHeight - downH)];
    JSCG.moneyStr = @"20";
    JSCG.ViewController = self;
    [self.view addSubview:JSCG];
    
    
}

//-(void)setUpWithNewDic:(NSString *)type passWord:(NSString *)passWord {
//
//    NSString *urlStr = @"/app/pay/pay";
//
//    NSMutableDictionary *tempDic = [NSMutableDictionary dictionaryWithCapacity:1];
//    [tempDic setObject:[UserModel shared].uid forKey:@"uid"];
//    [tempDic setObject:[UserModel shared].token forKey:@"token"];
//    if ([Toos isNotBlank:self.FromStr]) {
//
//        urlStr = @"/app/reserve/order_pay";
//
//
//        if ([self.FromStr intValue] == 3) {
//
//            urlStr = @"/app/Paycard/wechat_alipay";
//
//
//
//            [tempDic setObject:self.tempDic[@"order_number"] forKey:@"order_number"];
//            [tempDic setObject:type forKey:@"pay_type"];
//        }else {
//
//
//
//
//            [tempDic setObject:self.FromStr forKey:@"order_type"];
//
//            [tempDic setObject:self.TypeStr forKey:@"stype"];
//
//
//
//
//            [tempDic setObject:self.tempDic[@"order_number"] forKey:@"id"];
//            [tempDic setObject:type forKey:@"type"];
//        }
//    }
//    else {
//        [tempDic setObject:type forKey:@"pay_type"];
//        [tempDic setObject:self.tempDic[@"order_number"] forKey:@"order_number"];
//    }
//
//    if ([Toos isNotBlank:passWord]) {
//
//        if ([Toos isBlank:self.FromStr]) {
//            [tempDic setObject:passWord forKey:@"pay_password"];
//        }else {
//
//            [tempDic setObject:passWord forKey:@"pay_pwd"];
//        }
//    }
//
//    [Toos dataWithSessionurl:urlStr body:tempDic view:self.view token:@"" Block:^(id tempData) {
//        if ([tempData[@"code"]intValue] == 200) {
//
//
//
//            if ([type isEqualToString:@"2"]) {
//                [self setUpWithZhiFuBao:tempData];
//            }else if([type isEqualToString:@"1"]){
//
//
//                [self setUpWithWeiXin:tempData[@"data"]];
//
//
//
//            }
//            else {
//                self.passWordView.hidden = YES;
//                [Toos JiaZaiAnimation:tempData[@"msg"] myView:self.view block:^(id temp) {
//
//
//                    [self.navigationController popToRootViewControllerAnimated:YES];
//
//
//
//
//                    //                for (UIViewController *ViewController in self.navigationController.viewControllers) {
//                    //                    if ([ViewController isKindOfClass:[AllDDViewController class]]) {
//                    //                        [self.navigationController popToViewController:ViewController animated:YES];
//                    //                    }else if ([ViewController isKindOfClass:[ShoppingCartController class]]){
//                    //                        [self.navigationController popToViewController:ViewController animated:YES];
//                    //
//                    //
//                    //                    }else if ([ViewController isKindOfClass:[ShopDetailViewController class]]){
//                    //                        [self.navigationController popToViewController:ViewController animated:YES];
//                    //                    }
//                    //                }
//                }];
//            }
//
//        }else {
//
//            [self.passWordView.contentTextField becomeFirstResponder];
//
//            [Toos setUpWithMBP:tempData[@"msg"] UIView:[UIApplication sharedApplication].keyWindow];
//        }
//
//    } failBlock:^(id tempData) {
//
//    }];
//

    
//}

-(void)clickPaySuccess {
    [Toos JiaZaiAnimation:@"支付成功" myView:self.view block:^(id temp) {
        
        
        
        [self.navigationController popToRootViewControllerAnimated:YES];
        
    }];
}

-(void)clickPayFail:(NSNotification *)noti {
    
    [Toos setUpWithMBP:@"支付失败" UIView:self.view];
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
