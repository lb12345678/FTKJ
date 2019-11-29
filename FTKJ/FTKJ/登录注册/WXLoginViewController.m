//
//  WXLoginViewController.m
//  FRY
//
//  Created by iOS 开发 on 2019/7/11.
//  Copyright © 2019 iOS 开发. All rights reserved.
//

#import "WXLoginViewController.h"
#import "BindingAccountViewController.h"
@interface WXLoginViewController ()
@property (nonatomic,strong)NSDictionary *tempDic;
@end

@implementation WXLoginViewController

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
    self.view.backgroundColor=[UIColor clearColor];
    [self setUpWithBigView];
    // Do any additional setup after loading the view.
}
-(void)setUpWithBigView{
    UIImageView *bgImg=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    bgImg.image=[UIImage imageNamed:@"bg1"];
    [self.view addSubview:bgImg];
    
    UIView *alphaView=[[UIView alloc]initWithFrame:bgImg.frame];
    alphaView.backgroundColor=newColor(45, 45, 45, .7);
    [self.view addSubview:alphaView];
    
    UIButton *bckBtn=[[UIButton alloc]initWithFrame:CGRectMake(kWidthChange(25), kWidthChange(35), kWidthChange(10), kWidthChange(15))];
    [bckBtn setImage:[UIImage imageNamed:@"box31"] forState:UIControlStateNormal];
    [bckBtn addTarget:self  action:@selector(clickFanhui) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bckBtn];
    
    UIImageView *logo=[[UIImageView alloc]initWithFrame:CGRectMake((kScreenWidth-100)/2, kWidthChange(160), kWidthChange(100), kWidthChange(50))];
    logo.image=[UIImage imageNamed:@"logo3"];
    [self.view addSubview:logo];
    
    UIButton *denglu=[[UIButton alloc]initWithFrame:CGRectMake(kWidthChange(30), kWidthChange(500), kScreenWidth-kWidthChange(60), kWidthChange(46))];
    [denglu setImage:[UIImage imageNamed:@"box32"] forState:UIControlStateNormal];
    [denglu addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:denglu];
    
    UIButton *otherdenglu=[[UIButton alloc]initWithFrame:CGRectMake(kWidthChange(30), CGRectGetMaxY(denglu.frame)+kWidthChange(15), kScreenWidth-kWidthChange(60), kWidthChange(25))];
    [otherdenglu setTitle:@"使用其他方式登录" forState:UIControlStateNormal];
    [otherdenglu addTarget:self action:@selector(otherLogin) forControlEvents:UIControlEventTouchUpInside];
    otherdenglu.titleLabel.font=Font(13);
//    [self.view addSubview:otherdenglu];
    
    UIButton *xieYi = [UIButton buttonWithType:UIButtonTypeCustom];
    xieYi.frame = CGRectMake((kScreenWidth-[Toos textRect:@"登录代表您阅读并同意《设计疯人院平台用户协议》" textFont:[UIFont systemFontOfSize:kWidthChange(12)]])/2, kScreenHeight-kWidthChange(50) , [Toos textRect:@"登录代表您阅读并同意《设计疯人院平台用户协议》" textFont:[UIFont systemFontOfSize:kWidthChange(12)]] , kWidthChange(12));
    
    
    
    [xieYi setAttributedTitle: [Toos setUpWithtext:@"登录代表您阅读并同意《设计疯人院平台用户协议》" color:[UIColor whiteColor] color1:[UIColor whiteColor] font:kWidthChange(12) font1:kWidthChange(12) length:10 length1:13] forState:UIControlStateNormal];
    
    
    //    [xieYi setTitle:@"我已阅读并同意《用户协议》" forState:UIControlStateNormal];
    //    [xieYi setTitleColor:newColor(106, 106, 106, 1) forState:UIControlStateNormal];
    xieYi .titleLabel.font = [UIFont systemFontOfSize:kWidthChange(12)];
    [xieYi addTarget:self action:@selector(XieYi:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:xieYi];
    
}
-(void)XieYi:(UIButton *)sender{
    
}
-(void)otherLogin{
    
}
-(void)login{
    [ShareSDK getUserInfo:SSDKPlatformTypeWechat onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
        if (state == SSDKResponseStateSuccess)
        {
            
//            //                [self.threeDic setValue:@"2" forKey:@"sftype"];
//            //
//            //                [self.threeDic setValue:user.uid forKey:@"sf_code"];
//            //                [self.threeDic setValue:[Toos setUpWithObjectForKey:@"tel_unique"] forKey:@"tel_unique"];
//            //                [self setUpWithThredLogin:self.threeDic];
//            [self dismissViewControllerAnimated:YES completion:nil];
            NSLog(@"1");
            self.tempDic=user.rawData;
            [self sfdl:self.tempDic];
            
        }else {
            [Toos setUpWithMBP:@"微信登陆失败，请稍后重试" UIView:self.view];
        }
        
        
    }];
}
-(void)sfdl:(NSDictionary *)dic{
    NSMutableDictionary *newDic = [NSMutableDictionary dictionaryWithCapacity:1];
    [newDic setValue:dic[@"unionid"] forKey:@"unionid"];
    [Toos dataWithSessionurl:@"/app/public/login" body:newDic view:self.view token:@"" Block:^(id tempData) {
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
            
//            [[self getCJAppDelegate] setUpTabBar];
            
        }else if ([tempData[@"code"]intValue] == 202){
            BindingAccountViewController *vc=[[BindingAccountViewController alloc]init];
            vc.tempDic=self.tempDic;
            [self.navigationController pushViewController:vc animated:YES];

        }
        
        
    } failBlock:^(id tempData) {
        
    }];
}

-(void)clickFanhui{
//    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    [self.navigationController popViewControllerAnimated:YES];
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
