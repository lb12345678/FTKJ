//
//  ForgotPassWordViewController.m
//  GX
//
//  Created by iOS 开发 on 2019/6/25.
//  Copyright © 2019 iOS 开发. All rights reserved.
//

#import "ForgotPassWordViewController.h"
#import "AnimationTextFlied.h"

@interface ForgotPassWordViewController ()
@property(nonatomic,retain) AnimationTextFlied *phoneText;
@property(nonatomic,retain) AnimationTextFlied *yzmText;
@property(nonatomic,retain) AnimationTextFlied *pswText;
@property(nonatomic,retain) CountDownButton *db;
@property(nonatomic,retain) UIButton *zhuceBtn;

@end

@implementation ForgotPassWordViewController
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
    
    UIButton *fanhuiBtn=[[UIButton alloc]initWithFrame:CGRectMake(kWidthChange(15), kWidthChange(25), kWidthChange(25), kWidthChange(25))];
    [fanhuiBtn setImage:[UIImage imageNamed:@"box22-1"] forState:UIControlStateNormal];
    [fanhuiBtn addTarget:self action:@selector(clickfanhui) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:fanhuiBtn];
    
    
    
    
    
    
    UILabel *lab_huanyin=[[UILabel alloc]initWithFrame:CGRectMake(kWidthChange(30), kWidthChange(100), kScreenWidth-kWidthChange(60), kWidthChange(40))];
    lab_huanyin.text=@"找回密码";
    lab_huanyin.font=Font(kWidthChange(20));
    [self.view addSubview:lab_huanyin];
    if ([Toos isNotBlank:self.isFrom]) {
        lab_huanyin.text=@"修改密码";
    }
    
    __weak typeof(self)weakSelf = self;

    self.phoneText=[[AnimationTextFlied alloc]initWithFrame:CGRectMake(kWidthChange(30), CGRectGetMaxY(lab_huanyin.frame) + kWidthChange(35), kScreenWidth - kWidthChange(60), kWidthChange(50))];
    self.phoneText.placeholder=@"请输入手机号";
    self.phoneText.ctext = ^(NSString *text) {
        NSLog(@"%@",text);
        [weakSelf btnbg];
    };
    [self.view addSubview:self.phoneText];
    
    
    self.yzmText=[[AnimationTextFlied alloc]initWithFrame:CGRectMake(kWidthChange(30), CGRectGetMaxY(self.phoneText.frame) + kWidthChange(20), kScreenWidth - kWidthChange(60), kWidthChange(50))];
    self.yzmText.placeholder=@"请输入验证码";
    self.yzmText.ctext = ^(NSString *text) {
        NSLog(@"%@",text);
        [weakSelf btnbg];
    };
    [self.view addSubview:self.yzmText];
    
    self.pswText=[[AnimationTextFlied alloc]initWithFrame:CGRectMake(kWidthChange(30), CGRectGetMaxY(self.yzmText.frame) + kWidthChange(20), kScreenWidth - kWidthChange(60), kWidthChange(50))];
    self.pswText.placeholder=@"请设置新密码";
    self.pswText.secureTextEntry=YES;
    self.pswText.ctext = ^(NSString *text) {
        NSLog(@"%@",text);
        [weakSelf btnbg];
    };
    [self.view addSubview:self.pswText];
    
    
    self.db = [[CountDownButton alloc]initWithFrame:CGRectMake(kScreenWidth - kWidthChange(30) - kWidthChange(95),CGRectGetMaxY(self.phoneText.frame) + kWidthChange(23), kWidthChange(95),  kWidthChange(40)) withIsAuto:NO];
    
    
    self.db.titleLabel.font = [UIFont systemFontOfSize:kWidthChange(14)];
    self.db.backgroundColor = newColor(255, 255, 255, 1);
    [self.view addSubview:self.db];
    [self.db setTitle:@"获取验证码" forState:UIControlStateNormal];
    [self.db setTitleColor:newColor(250, 126, 40, 1) forState:UIControlStateNormal];
    [self.db addTarget:self action:@selector(handleClikYanZhengMa:) forControlEvents:UIControlEventTouchUpInside];
    self.db.layer.masksToBounds = YES;
    self.db.layer.cornerRadius = kWidthChange(20);
    self.db.layer.borderColor=newColor(250, 126, 40, 1).CGColor;
    self.db.layer.borderWidth=1;
    
    
    self.zhuceBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.zhuceBtn.frame = CGRectMake(kWidthChange(25), CGRectGetMaxY(self.pswText.frame) + kWidthChange(50), kScreenWidth - kWidthChange(50) , kWidthChange(50));
    self.zhuceBtn.backgroundColor = newColor(239, 239, 239, 1);
    self.zhuceBtn.layer.masksToBounds = YES;
    self.zhuceBtn.layer.cornerRadius = kWidthChange(25);
    self.zhuceBtn.enabled=NO;
    [self.zhuceBtn setTitle:@"确认" forState:UIControlStateNormal];
    [self.zhuceBtn setTitleColor:newColor(170, 170, 170, 1) forState:UIControlStateNormal];
    self.zhuceBtn .titleLabel.font = [UIFont systemFontOfSize:kWidthChange(15)];
    [self.zhuceBtn addTarget:self action:@selector(login:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.zhuceBtn];
    
    
    
    
    
    
    
}
-(void)clickfanhui{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)handleClikYanZhengMa:(UIButton *)sender{
    if (self.phoneText.content.length<11) {
        [Toos setUpWithMBP:@"请输入正确的手机号" UIView:self.view];
        return;
    }
    
    [self setUpWithYanZhangMa];
}
-(void)setUpWithYanZhangMa {
    NSMutableDictionary *newDic=[NSMutableDictionary dictionaryWithCapacity:1];
    [newDic setValue:self.phoneText.content forKey:@"mobile"];
    if ([Toos isNotBlank:self.isFrom]) {
        [newDic setValue:@"3" forKey:@"type"];
    }else{
        [newDic setValue:@"4" forKey:@"type"];
    }
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
    
    
    if ([Toos isBlank:self.phoneText.content]) {
        [Toos setUpWithMBP:@"请输入手机号" UIView:self.view];
        return;
    }
    if ([Toos isBlank:self.yzmText.content]) {
        [Toos setUpWithMBP:@"请输入验证码" UIView:self.view];
        return;
    }
    if ([Toos isBlank:self.pswText.content]) {
        [Toos setUpWithMBP:@"请输入密码" UIView:self.view];
        return;
    }
    
    
    
    NSMutableDictionary *newDic = [NSMutableDictionary dictionaryWithCapacity:1];
    [newDic setObject:self.phoneText.content forKey:@"mobile"];
    [newDic setObject:self.yzmText.content forKey:@"verify"];
    [newDic setObject:self.pswText.content forKey:@"password"];
    
    NSString *url=@"/app/public/forget_pass";
    if ([Toos isNotBlank:self.isFrom]) {
        url=@"/app/public/change_pwd";
        [newDic setObject:[UserModel shared].token forKey:@"token"];

    }
    [Toos dataWithSessionurl:url body:newDic view:self.view token:@"" Block:^(id tempData) {
        [Toos setUpWithMBP:tempData[@"msg"] UIView:self.view];
        if ([tempData[@"code"]intValue] == 200) {
            [self.navigationController popViewControllerAnimated:YES];
        }
      
        
        
    } failBlock:^(id tempData) {
        
    }];
}
-(void)btnbg{
    if (self.phoneText.content.length>10&&self.pswText.content.length>5&&self.yzmText.content.length>5) {
        self.zhuceBtn.backgroundColor = newColor(230, 20, 50, 1);
        [self.zhuceBtn setTitleColor:newColor(255, 255, 255, 1) forState:UIControlStateNormal];
        self.zhuceBtn.enabled=YES;
        
    }else{
        self.zhuceBtn.backgroundColor = newColor(239, 239, 239, 1);
        [self.zhuceBtn setTitleColor:newColor(170, 170, 170, 1) forState:UIControlStateNormal];
        self.zhuceBtn.enabled=NO;
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
