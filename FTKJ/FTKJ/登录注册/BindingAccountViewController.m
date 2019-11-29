//
//  BindingAccountViewController.m
//  GX
//
//  Created by iOS 开发 on 2019/6/25.
//  Copyright © 2019 iOS 开发. All rights reserved.
//

#import "BindingAccountViewController.h"
#import "AnimationTextFlied.h"
#import "RegisterViewController.h"
@interface BindingAccountViewController ()
@property(nonatomic,retain) AnimationTextFlied *phoneText;
@property(nonatomic,retain) AnimationTextFlied *pswText;
@property(nonatomic,retain) UIButton *wanchengBtn;
@property(nonatomic,retain) CountDownButton *db;

@end

@implementation BindingAccountViewController
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setHidden:YES];
    
    
}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar setHidden:NO];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor whiteColor];
    [self setUpWithBigView];

}
-(void)setUpWithBigView {
    
    UIButton *fanhuiBtn=[[UIButton alloc]initWithFrame:CGRectMake(kWidthChange(15), kWidthChange(25)+(kStatusBarHeight), kWidthChange(25), kWidthChange(25))];
    [fanhuiBtn setImage:[UIImage imageNamed:@"box22-1"] forState:UIControlStateNormal];
    [fanhuiBtn addTarget:self action:@selector(clickfanhui) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:fanhuiBtn];
    
    
    
    
    
    
    UILabel *lab_huanyin=[[UILabel alloc]initWithFrame:CGRectMake(kWidthChange(30), kWidthChange(100), kScreenWidth-kWidthChange(60), kWidthChange(40))];
    lab_huanyin.text=@"绑定账号";
    lab_huanyin.font=Font(kWidthChange(20));
    [self.view addSubview:lab_huanyin];
    
    __weak typeof(self)weakSelf = self;

    
    self.phoneText=[[AnimationTextFlied alloc]initWithFrame:CGRectMake(kWidthChange(30), CGRectGetMaxY(lab_huanyin.frame) + kWidthChange(35), kScreenWidth - kWidthChange(60), kWidthChange(50))];
    self.phoneText.placeholder=@"请输入手机号";
    self.phoneText.ctext = ^(NSString *text) {
        NSLog(@"%@",text);
        [weakSelf btnbg];
    };
    [self.view addSubview:self.phoneText];
    
    
   
    
    self.pswText=[[AnimationTextFlied alloc]initWithFrame:CGRectMake(kWidthChange(30), CGRectGetMaxY(self.phoneText.frame) + kWidthChange(20), kScreenWidth - kWidthChange(60), kWidthChange(50))];
    self.pswText.placeholder=@"请输入密码";
    self.pswText.ctext = ^(NSString *text) {
        NSLog(@"%@",text);
        [weakSelf btnbg];
    };
    [self.view addSubview:self.pswText];
    if ([Toos isBlank:self.isFrom]) {
        self.pswText.secureTextEntry=YES;
    }
    
    self.wanchengBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.wanchengBtn.frame = CGRectMake(kWidthChange(25), CGRectGetMaxY(self.pswText.frame) + kWidthChange(50), kScreenWidth - kWidthChange(50) , kWidthChange(50));
    self.wanchengBtn.backgroundColor = newColor(239, 239, 239, 1);
    self.wanchengBtn.layer.masksToBounds = YES;
    self.wanchengBtn.layer.cornerRadius = kWidthChange(25);
    
    [self.wanchengBtn setTitle:@"确定" forState:UIControlStateNormal];
    [self.wanchengBtn setTitleColor:newColor(170, 170, 170, 1) forState:UIControlStateNormal];
    self.wanchengBtn .titleLabel.font = [UIFont systemFontOfSize:kWidthChange(15)];
    [self.wanchengBtn addTarget:self action:@selector(login:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.wanchengBtn];
    
    self.db = [[CountDownButton alloc]initWithFrame:CGRectMake(kScreenWidth - kWidthChange(30) - kWidthChange(75),CGRectGetMaxY(self.phoneText.frame) + kWidthChange(38), kWidthChange(75),  kWidthChange(25)) withIsAuto:NO];
    
    
    self.db.titleLabel.font = [UIFont systemFontOfSize:kWidthChange(11)];
    self.db.backgroundColor = newColor(255, 255, 255, 1);
    [self.view addSubview:self.db];
    [self.db setTitle:@"获取验证码" forState:UIControlStateNormal];
    [self.db setTitleColor:newColor(145, 223, 249, 1) forState:UIControlStateNormal];
    [self.db addTarget:self action:@selector(handleClikYanZhengMa) forControlEvents:UIControlEventTouchUpInside];
    self.db.layer.masksToBounds = YES;
    self.db.layer.cornerRadius = kWidthChange(12.5);
    self.db.layer.borderColor=newColor(145, 223, 249, 1).CGColor;
    self.db.layer.borderWidth=1;
    if ([Toos isBlank:self.isFrom]) {
        self.db.hidden=YES;
    }
    UIButton *xieYi = [UIButton buttonWithType:UIButtonTypeCustom];
    xieYi.frame = CGRectMake((kScreenWidth-[Toos textRect:@"我还没有账号，立即注册" textFont:[UIFont systemFontOfSize:kWidthChange(12)]])/2, CGRectGetMaxY(self.wanchengBtn.frame)+ 20 , [Toos textRect:@"我还没有账号，立即注册" textFont:[UIFont systemFontOfSize:kWidthChange(12)]] , kWidthChange(20));
    
    
    
    [xieYi setAttributedTitle: [Toos setUpWithtext:@"我还没有账号，立即注册" color:newColor(48, 49, 50, 1) color1:newColor(250, 141, 57, 1) font:kWidthChange(12) font1:kWidthChange(12) length:7 length1:4] forState:UIControlStateNormal];
    
    
    //    [xieYi setTitle:@"我已阅读并同意《用户协议》" forState:UIControlStateNormal];
    //    [xieYi setTitleColor:newColor(106, 106, 106, 1) forState:UIControlStateNormal];
    xieYi .titleLabel.font = [UIFont systemFontOfSize:kWidthChange(12)];
    [xieYi addTarget:self action:@selector(XieYi:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:xieYi];
    
    if ([Toos isNotBlank:self.isFrom]) {
        xieYi.hidden=YES;
    }
    
    
}
-(void)XieYi:(UIButton *)sender{
    RegisterViewController *vc=[[RegisterViewController alloc]init];
    vc.dataDic=self.tempDic;
    [self.navigationController pushViewController:vc animated:YES];

}
-(void)handleClikYanZhengMa {
    NSMutableDictionary *newDic=[NSMutableDictionary dictionaryWithCapacity:1];
    [newDic setValue:self.phoneText.content forKey:@"mobile"];
  
    [newDic setValue:@"4" forKey:@"type"];
    
    [Toos dataWithSessionurl:@"/app/public/send_verify" body:newDic view:self.view token:@"" Block:^(id tempData) {
        [Toos setUpWithMBP:tempData[@"msg"] UIView:self.view];
        if ([tempData[@"code"]intValue] == 200) {
            [self.db click];
        }
        //        if ([Toos isNotBlank:tempData[@"data"][@"verify"]]) {
        //            self.yanZhengTF.text=[NSString stringWithFormat:@"%@",tempData[@"data"][@"verify"]];
        //        }
        
        
        
    } failBlock:^(id tempData) {
        
    }];
    
    
}
-(void)login:(UIButton *)sender{
    if ([Toos isNotBlank:self.isFrom]) {
        NSMutableDictionary *newDic = [NSMutableDictionary dictionaryWithCapacity:1];
        [newDic setObject:self.phoneText.content forKey:@"mobile"];
        [newDic setObject:self.pswText.content forKey:@"verify"];
        [newDic setObject:[UserModel shared].token forKey:@"token"];
        
        
        [Toos dataWithSessionurl:@"/app/public/bang_mobile" body:newDic view:self.view token:@"" Block:^(id tempData) {
            [Toos setUpWithMBP:tempData[@"msg"] UIView:self.view];
            if ([tempData[@"code"]intValue] == 200) {
                [self loadData];
            }
            
            
            
        } failBlock:^(id tempData) {
            
        }];
    }else{
        NSMutableDictionary *newDic = [NSMutableDictionary dictionaryWithCapacity:1];
        [newDic setObject:self.phoneText.content forKey:@"mobile"];
        [newDic setObject:self.pswText.content forKey:@"password"];
        [newDic setObject:self.tempDic[@"unionid"] forKey:@"unionid"];
        [newDic setObject:self.tempDic[@"openid"] forKey:@"openid"];

        
        [Toos dataWithSessionurl:@"/app/public/bang" body:newDic view:self.view token:@"" Block:^(id tempData) {
            [Toos setUpWithMBP:tempData[@"msg"] UIView:self.view];
            if ([tempData[@"code"]intValue] == 200) {
                [UserModel shared].uid=tempData[@"data"][@"id"];
                [UserModel shared].mobile=tempData[@"data"][@"mobile"];
                [UserModel shared].token=tempData[@"data"][@"token"];
                [UserModel shared].nickname=tempData[@"data"][@"name"];
                [UserModel shared].icon=tempData[@"data"][@"icon"];
                [UserModel shared].id_card=tempData[@"data"][@"id_card"];
                [UserModel shared].city=tempData[@"data"][@"city"];
                [UserModel shared].style=tempData[@"data"][@"style"];
                [UserModel shared].city=tempData[@"data"][@"city"];
                [UserModel shared].work_limit=tempData[@"data"][@"work_limit"];
                [UserModel shared].company=tempData[@"data"][@"company"];
                [UserModel shared].sty_id=tempData[@"data"][@"style_id"];
                if ([Toos isNotBlank:tempData[@"data"][@"openid"]]) {
                    [UserModel shared].fullname=tempData[@"data"][@"openid"];
                }else{
                    [UserModel shared].fullname=@"";
                }
                [UserModel shared].passWord=tempData[@"data"][@"no_pass"];
                [[UserModel shared] saveUser];
                
//                [[self getCJAppDelegate] setUpTabBar];
            }
            
            
            
        } failBlock:^(id tempData) {
            
        }];
    }
}
-(void)loadData{
    
    
    [Toos dataWithSessionurl:@"/app/member/index" body:@{@"token":[UserModel shared].token} view:self.view token:@"" Block:^(id tempData) {
//        [Toos setUpWithMBP:tempData[@"msg"] UIView:self.view];
        if ([tempData[@"code"]intValue] == 200) {
            [UserModel shared].email=tempData[@"data"][@"email"];
            [UserModel shared].nickname=tempData[@"data"][@"name"];
            [UserModel shared].mobile=tempData[@"data"][@"mobile"];
            [UserModel shared].sex=tempData[@"data"][@"sex"];
            [UserModel shared].icon=tempData[@"data"][@"icon"];
            [UserModel shared].id_card=tempData[@"data"][@"id_card"];
            if ([Toos isNotBlank:tempData[@"data"][@"city"]]) {
                [UserModel shared].city=tempData[@"data"][@"city"];
            }
            if ([Toos isNotBlank:tempData[@"data"][@"work_limit"]]) {
                [UserModel shared].work_limit=tempData[@"data"][@"work_limit"];
            }
            [UserModel shared].style=tempData[@"data"][@"style"];
            [UserModel shared].company=tempData[@"data"][@"company"];
            
            [[UserModel shared]saveUser];
            [self.navigationController popViewControllerAnimated:YES];

        }
        
        
    } failBlock:^(id tempData) {
        [Toos setUpWithMBP:tempData[@"msg"] UIView:self.view];
        
    }];
}
-(void)clickfanhui{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)btnbg{
    if (self.phoneText.content.length>10&&self.pswText.content.length>5) {
        self.wanchengBtn.backgroundColor = newColor(230, 20, 50, 1);
        [self.wanchengBtn setTitleColor:newColor(255, 255, 255, 1) forState:UIControlStateNormal];
        self.wanchengBtn.enabled=YES;
        
    }else{
        self.wanchengBtn.backgroundColor = newColor(239, 239, 239, 1);
        [self.wanchengBtn setTitleColor:newColor(170, 170, 170, 1) forState:UIControlStateNormal];
        self.wanchengBtn.enabled=NO;
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
