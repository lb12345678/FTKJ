//
//  LoginViewController.m
//  FRY
//
//  Created by iOS 开发 on 2019/7/10.
//  Copyright © 2019 iOS 开发. All rights reserved.
//

#import "LoginViewController.h"
#import "AnimationTextFlied.h"
#import "RegisterViewController.h"
#import "ForgotPassWordViewController.h"
#import "WXLoginViewController.h"

@interface LoginViewController ()
@property(nonatomic,retain) AnimationTextFlied *phoneText;
@property(nonatomic,retain) AnimationTextFlied *pswText;
@property(nonatomic,retain) UIButton *loginBtn;
@property(nonatomic,retain) CountDownButton *db;
@property(nonatomic,retain) NSString *type;

@end

@implementation LoginViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.type=@"1";
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor whiteColor];
    [self setUpWithBigView];
}
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setHidden:YES];
    
    
}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar setHidden:NO];
    
}
-(void)setUpWithBigView {
    
    UIImageView *bigImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"登录背景"]];
    bigImage.frame = CGRectMake(0, -kStatusBarHeight, kScreenWidth, kWidthChange(134));
    
    [self.view addSubview:bigImage];
    
    
    
    UIButton *fanhuiBtn=[[UIButton alloc]initWithFrame:CGRectMake(kWidthChange(15), kStatusBarHeight + kWidthChange(15), kWidthChange(25), kWidthChange(25))];
    [fanhuiBtn setImage:[UIImage imageNamed:@"box22-1"] forState:UIControlStateNormal];
    [fanhuiBtn addTarget:self action:@selector(clickfanhui) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:fanhuiBtn];
    
    
    
    
    
    UIImageView *smallImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"logo"]];
    smallImage.frame = CGRectMake(kScreenWidth / 2 - kWidthChange(36),kWidthChange(80), kWidthChange(72), kWidthChange(72));
    
    [self.view addSubview:smallImage];
    
    
    
    UILabel *lab_huanyin=[[UILabel alloc]initWithFrame:CGRectMake(kWidthChange(30), CGRectGetMaxY(smallImage.frame)+kWidthChange(25), kScreenWidth-kWidthChange(60), kWidthChange(40))];
    lab_huanyin.text=@"欢迎登陆一用商城平台";
    lab_huanyin.font=Font(kWidthChange(20));
    [self.view addSubview:lab_huanyin];
    lab_huanyin.textAlignment = NSTextAlignmentCenter;
    
    
    self.phoneText=[[AnimationTextFlied alloc]initWithFrame:CGRectMake(kWidthChange(30), CGRectGetMaxY(lab_huanyin.frame) + kWidthChange(25), kScreenWidth - kWidthChange(60), kWidthChange(50))];
    self.phoneText.placeholder=@"请输入手机号";
    __weak typeof(self)weakSelf = self;

    
  
  
    
   
    self.phoneText.ctext = ^(NSString *text) {
        NSLog(@"%@",text);
        [weakSelf btnbg];
    };
    [self.view addSubview:self.phoneText];
   
    
    self.pswText=[[AnimationTextFlied alloc]initWithFrame:CGRectMake(kWidthChange(30), CGRectGetMaxY(self.phoneText.frame) + kWidthChange(20), kScreenWidth - kWidthChange(60), kWidthChange(50))];
    self.pswText.placeholder=@"请输入密码";
    self.pswText.secureTextEntry=YES;
    self.pswText.ctext = ^(NSString *text) {
        NSLog(@"%@",text);
        [weakSelf btnbg];
    };
    [self.view addSubview:self.pswText];
    
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
    self.db.hidden=YES;
    
    
    UIButton *qiehuan=[[UIButton alloc]initWithFrame:CGRectMake(kScreenWidth-kWidthChange(125), CGRectGetMaxY(self.pswText.frame)+5, kWidthChange(100), kWidthChange(20))];
    [qiehuan setTitle:@"验证码登录" forState:UIControlStateNormal];
    [qiehuan setTitleColor:newColor(187, 187, 187, 1) forState:UIControlStateNormal];
    qiehuan.titleLabel.font=Font(kWidthChange(14));
    [qiehuan addTarget:self action:@selector(qiehuan:) forControlEvents:UIControlEventTouchUpInside];
    //[self.view addSubview:qiehuan];
    
    self.loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.loginBtn.frame = CGRectMake(kWidthChange(25), CGRectGetMaxY(self.pswText.frame) + kWidthChange(50), kScreenWidth - kWidthChange(50) , kWidthChange(50));
    self.loginBtn.backgroundColor = newColor(239, 239, 239, 1);
    self.loginBtn.layer.masksToBounds = YES;
    self.loginBtn.layer.cornerRadius = kWidthChange(25);
    self.loginBtn.enabled=NO;
    [self.loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [self.loginBtn setTitleColor:newColor(170, 170, 170, 1) forState:UIControlStateNormal];
    self.loginBtn .titleLabel.font = [UIFont systemFontOfSize:kWidthChange(15)];
    [self.loginBtn addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.loginBtn];
    
    
    
    
    
    
    UIButton *fogotBT = [UIButton buttonWithType:UIButtonTypeCustom];
    fogotBT.frame = CGRectMake(kWidthChange(25), CGRectGetMaxY(self.loginBtn.frame) + kWidthChange(20), [Toos textRect:@"注册账号" textFont:[UIFont systemFontOfSize:kWidthChange(14)]], kWidthChange(15));
    [fogotBT setTitle:@"注册账号" forState:UIControlStateNormal];
    [fogotBT setTitleColor:newColor(0, 0, 0, 1) forState:UIControlStateNormal];
    fogotBT.titleLabel.font = [UIFont systemFontOfSize:kWidthChange(14)];
    [self.view addSubview:fogotBT];
    [fogotBT addTarget:self action:@selector(clickZhuCe) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    
    
    UIButton *ZhuCeBT = [UIButton buttonWithType:UIButtonTypeCustom];
    ZhuCeBT.frame = CGRectMake(kScreenWidth - kWidthChange(25) - [Toos textRect:@"忘记密码" textFont:[UIFont systemFontOfSize:kWidthChange(14)]],  CGRectGetMaxY(self.loginBtn.frame) + kHeightChange(20), [Toos textRect:@"忘记密码" textFont:[UIFont systemFontOfSize:kWidthChange(14)]], kHeightChange(15));
    [ZhuCeBT setTitle:@"忘记密码" forState:UIControlStateNormal];
    [ZhuCeBT setTitleColor:newColor(0, 0, 0, 1) forState:UIControlStateNormal];
    ZhuCeBT.titleLabel.font = [UIFont systemFontOfSize:kWidthChange(14)];
    [self.view addSubview:ZhuCeBT];
    [ZhuCeBT addTarget:self action:@selector(clickFogotPassWord) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    
    
    UILabel *oneDown = [Toos setUpWithUserLabel:@"" CGRect:CGRectMake(kWidthChange(45), CGRectGetMaxY(ZhuCeBT.frame) + kWidthChange(50) + kWidthChange(8), kWidthChange(101), 1) color:lineColor_gary textColor:RedColor textSize:14];
    [self.view addSubview:oneDown];
    
    
    UILabel *KuaiJieDL = [Toos setUpWithUserLabel:@"快捷登录" CGRect:CGRectMake(0, CGRectGetMaxY(ZhuCeBT.frame) + kWidthChange(50),kScreenWidth , kWidthChange(16)) color:[UIColor clearColor] textColor:newColor(166, 167, 168, 1) textSize:kWidthChange(17)];
    KuaiJieDL.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:KuaiJieDL];
    
    
    UILabel *twoDown = [Toos setUpWithUserLabel:@"" CGRect:CGRectMake(kWidthChange(230), CGRectGetMaxY(ZhuCeBT.frame) + kWidthChange(50) + kWidthChange(8), kWidthChange(101), 1) color:lineColor_gary textColor:RedColor textSize:14];
    [self.view addSubview:twoDown];
    
    NSMutableArray *imageArray = [NSMutableArray array];
    NSMutableArray *nameArray = [NSMutableArray array];
    
//    if (WeiXin) {
        [imageArray addObject:@"box21-1"];
        [nameArray addObject:@"微信登录"];

//    }
    
    
    
    
    
    for (int i = 0; i < imageArray.count; i++)
    {
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(kScreenWidth*0.2+((kWidthChange(29) +kScreenWidth*0.15)*i), CGRectGetMaxY(ZhuCeBT.frame) + kWidthChange(30) + kWidthChange(60), kWidthChange(100), kWidthChange(50));
        [button setImage:[UIImage imageNamed:[imageArray objectAtIndex:i]] forState:UIControlStateNormal];
        [button setTitle:[nameArray objectAtIndex:i] forState:UIControlStateNormal];
        [button setTitleColor:newColor(147, 148, 149, 1) forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:kWidthChange(15)];
        [button layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleTop imageTitleSpace:2 weight:2];
        
        UILabel *WeiXinLogin = [Toos setUpWithUserLabel:@"微信登录" CGRect:CGRectMake(0, CGRectGetMaxY(button.frame) + 5, kScreenWidth, kHeightChange(30)) color:[UIColor clearColor] textColor:newColor(158, 158, 158, 1) textSize:kWidthChange(13)];
        
        
        WeiXinLogin.textAlignment = NSTextAlignmentCenter;
        
        if (i == 0) {
            
        }
        if (imageArray.count == 1) {
            
            button.center = CGPointMake(kScreenWidth / 2,CGRectGetMaxY(ZhuCeBT.frame) + kWidthChange(55) + kWidthChange(40)  + kWidthChange(50) / 2);
            
            
        }else if(imageArray.count == 2){
            
            if (i == 0) {
                button.center = CGPointMake(kScreenWidth / 2 - kWidthChange(29) / 2 - 20,  CGRectGetMaxY(ZhuCeBT.frame) + kWidthChange(40) + kWidthChange(40)  + kWidthChange(29) / 2);
            }else{
                button.center = CGPointMake(kScreenWidth / 2 + kWidthChange(29) / 2 + 20,  CGRectGetMaxY(ZhuCeBT.frame) + kWidthChange(40) + kWidthChange(40)  + kWidthChange(29) / 2);
            }
            
            
        }else{
            
            switch (i) {
                case 0:
                    button.center = CGPointMake(kScreenWidth / 2 - kScreenWidth *0.15 * 1.5,  CGRectGetMaxY(KuaiJieDL.frame) + kHeightChange(30) + kScreenWidth * 0.15 / 2);
                    break;
                case 1:
                    button.center = CGPointMake(kScreenWidth / 2,  CGRectGetMaxY(KuaiJieDL.frame) + kHeightChange(30)  + kScreenWidth * 0.15 / 2);
                    break;
                case 2:
                    button.center = CGPointMake(kScreenWidth / 2 +  kScreenWidth *0.15 *1.5,  CGRectGetMaxY(KuaiJieDL.frame) + kHeightChange(30) + kScreenWidth * 0.15 / 2);
                    break;
                default:
                    break;
            }
        }
        
        [button addTarget:self action:@selector(loginClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:button];
        //[self.view addSubview:WeiXinLogin];
        //        [self.view addSubview:WeiXinLogin];
    }
}
-(void)handleClikYanZhengMa{
    
    
    if ([Toos isBlank:self.phoneText.content]) {
        [Toos setUpWithMBP:@"请输入手机号" UIView:self.view];
        return;
    }
    
    
    
    
    
    NSMutableDictionary *newDic=[NSMutableDictionary dictionaryWithCapacity:1];
    [newDic setValue:self.phoneText.content forKey:@"mobile"];
    
    [newDic setValue:@"5" forKey:@"type"];
    
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
-(void)clickZhuCe{
    RegisterViewController *vc=[[RegisterViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
-(void)clickFogotPassWord{
    ForgotPassWordViewController *vc=[[ForgotPassWordViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
    
}
-(void)login{
    
    if ([Toos isBlank:self.phoneText.content]) {
        [Toos setUpWithMBP:@"请输入手机号" UIView:self.view];
        return;
    }
    
    if ([Toos isBlank:self.pswText.content]) {
        
        if ([self.type intValue] == 2) {
             [Toos setUpWithMBP:@"请输入验证码" UIView:self.view];
        }else {
            [Toos setUpWithMBP:@"请输入密码" UIView:self.view];
            
        }
        
        
       
        return;
    }
    
    
    
    
    
    [self.pswText resignFirstResponder];
    [self.phoneText resignFirstResponder];
    NSMutableDictionary *newDic = [NSMutableDictionary dictionaryWithCapacity:1];
    [newDic setObject:self.phoneText.content forKey:@"mobile"];
    if ([self.type isEqualToString:@"2"]) {
        [newDic setObject:self.pswText.content forKey:@"verify"];
        [newDic setObject:@"yzm" forKey:@"type"];
    }else{
        [newDic setObject:self.pswText.content forKey:@"password"];
    }
    [self.phoneText resignFirstResponder];
    [self.pswText resignFirstResponder];
    [Toos dataWithSessionurl:@"/app/public/login" body:newDic view:self.view token:@"" Block:^(id tempData) {
        [Toos setUpWithMBP:tempData[@"msg"] UIView:self.view];
        if ([tempData[@"code"]intValue] == 200) {
           

        }
        //        if ([Toos isNotBlank:tempData[@"data"][@"verify"]]) {
        //            self.yanZhengTF.text=[NSString stringWithFormat:@"%@",tempData[@"data"][@"verify"]];
        //        }
        
        
        
    } failBlock:^(id tempData) {
        
    }];
}
-(void)loginClick:(UIButton *)sender{
    WXLoginViewController *vc=[[WXLoginViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];

}
-(void)btnbg{
    if (self.phoneText.content.length>10&&self.pswText.content.length>5) {
        self.loginBtn.backgroundColor = newColor(230, 20, 50, 1);
        [self.loginBtn setTitleColor:newColor(255, 255, 255, 1) forState:UIControlStateNormal];
        self.loginBtn.enabled=YES;

    }else{
      self.loginBtn.backgroundColor = newColor(239, 239, 239, 1);
        [self.loginBtn setTitleColor:newColor(170, 170, 170, 1) forState:UIControlStateNormal];
        self.loginBtn.enabled=NO;
    }
}
-(void)qiehuan:(UIButton *)sender{
    if ([self.type isEqualToString:@"1"]) {
        self.type=@"2";
        [sender setTitle:@"密码登录" forState:UIControlStateNormal];
        self.pswText.placeholder=@"请输入验证码";
        self.db.hidden=NO;
    }else{
        self.type=@"1";
        [sender setTitle:@"验证码登录" forState:UIControlStateNormal];
        self.pswText.placeholder=@"请输入密码";
        self.db.hidden=YES;
    }
}

-(void)clickfanhui {
    [self dismissViewControllerAnimated:YES completion:nil];
    
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
