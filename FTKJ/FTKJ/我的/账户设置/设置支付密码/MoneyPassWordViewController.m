//
//  MoneyPassWordViewController.m
//  GZSC
//
//  Created by ios on 2018/9/7.
//  Copyright © 2018年 ios. All rights reserved.
//

#import "MoneyPassWordViewController.h"
#import "LoginViewController.h"

@interface MoneyPassWordViewController ()<UITextFieldDelegate>


@property(nonatomic,retain)UITextField *phoneTextField;

@property(nonatomic,retain)UITextField *yanZhengMa;//验证码

@property(nonatomic,retain)UITextField *passWordTF;//密码

@property(nonatomic,retain)UITextField *passWordTF1;//新密码

@property(nonatomic,retain) CountDownButton *db;


@end

@implementation MoneyPassWordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    if ([self.isFrom isEqualToString:@"1"]) {
//         self.navigationItem.title = @"设置支付密码";
//    }else if ([self.isFrom isEqualToString:@"2"]){
//         self.navigationItem.title = @"修改密码";
//    }else {
//        self.navigationItem.title = @"忘记密码";
//
//    }
    self.navigationItem.title = @"设置支付密码";
    
   
    [self setUpWithBigView];
    // Do any additional setup after loading the view.
}

- (void)setUpWithBigView {
    
    
    NSArray *oneArray = @[@"请输入手机号",@"请输入验证码",@"请输入6位支付密码",@"请再次输入密码"];
    for (int i = 0; i < 4; i++) {
        UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake(kWidthChange(20), i* kWidthChange(60), kScreenWidth - kWidthChange(40) ,  kWidthChange(60))];
        
          textField.placeholder = [oneArray objectAtIndex:i];
        
        [textField setValue:[UIFont systemFontOfSize:kWidthChange(16)] forKeyPath:@"_placeholderLabel.font"];
        textField.font = [UIFont systemFontOfSize:kWidthChange(16)];
        [self.view addSubview:textField];
         textField.keyboardType = UIKeyboardTypeNumberPad;
        textField.delegate = self;
         textField.backgroundColor = [UIColor whiteColor];
        if (i == 0) {
            self.phoneTextField = textField;
            
        }else if (i == 1){
            
            self.yanZhengMa = textField;
            
        }else if (i == 2){
            
            self.passWordTF = textField;
            
        }else if (i == 3){
            
            self.passWordTF = textField;
            
        }
       
        UILabel *lineLabel = [Toos setUpWithUserLabel:@"" CGRect:CGRectMake(0, kWidthChange(60) - 1, kScreenWidth - kWidthChange(40) , 1) color:lineColor_gary textColor:[UIColor redColor] textSize:12];
        [textField addSubview:lineLabel];
        
      
       
        
       
    }
    
 
    
 
    
    self.db = [[CountDownButton alloc]initWithFrame:CGRectMake(kScreenWidth - kWidthChange(100) - kWidthChange(20),  kWidthChange(70) , kWidthChange(100),  kWidthChange(40)) withIsAuto:NO];
    
    
    self.db.titleLabel.font = [UIFont systemFontOfSize:kWidthChange(15)];
    self.db.backgroundColor = newColor(253, 123, 36, 1);
    [self.view addSubview:self.db];
    [self.db setTitle:@"获取验证码" forState:UIControlStateNormal];
    [self.db setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.db addTarget:self action:@selector(handleClikYanZhengMa:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.db setTitleColor:newColor(255, 255, 255, 1) forState:UIControlStateNormal];
    
    
  
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(kWidthChange(20), kWidthChange(300), kScreenWidth - kWidthChange(40) , kWidthChange(45));
    button.backgroundColor = newColor(190, 191, 193, 1);
    button.layer.masksToBounds = YES;
    button.layer.cornerRadius = kWidthChange(45) / 2;
    
    [button setTitle:@"确认修改" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button .titleLabel.font = [UIFont systemFontOfSize:kWidthChange(15)];
    [button addTarget:self action:@selector(addAddress:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    
    
}

-(void)addAddress:(UIButton *)sender {
    
    
    if (self.phoneTextField.text.length == 0) {
          [Toos setUpWithMBP:@"请输入手机号" UIView:self.view];
        
        return;
    }
    
    if (self.phoneTextField.text.length != 11) {
        [Toos setUpWithMBP:@"请输入正确的手机号" UIView:self.view];
        return;
    }
  
    if (self.yanZhengMa.text.length == 0) {
        [Toos setUpWithMBP:@"请输入验证码" UIView:self.view];
        return;
    }
    if (self.passWordTF.text.length == 0) {
        [Toos setUpWithMBP:@"请输入密码" UIView:self.view];
        return;
    }
    
    if (self.passWordTF.text.length != 6) {
         [Toos setUpWithMBP:@"请输入6位支付密码" UIView:self.view];
        
        
        return;
    }
    
    
    
    
    if (self.passWordTF1.text.length == 0) {
        
        if ([self.isFrom isEqualToString:@"3"]) {
              [Toos setUpWithMBP:@"请确认密码" UIView:self.view];
        }else {
              [Toos setUpWithMBP:@"请输入新密码" UIView:self.view];
        }
        
        return;
    }
    
    
    if (![self.passWordTF1.text isEqualToString:self.passWordTF.text]) {
        
          [Toos setUpWithMBP:@"密码输入不一致" UIView:self.view];
        
        return;
    }
    
    NSString *url;
    NSMutableDictionary *newDic = [NSMutableDictionary dictionaryWithCapacity:1];
    
    
    if ([self.isFrom isEqualToString:@"1"]) {
     
        [newDic setObject:[UserModel shared].uid forKey:@"uid"];
        [newDic setObject:self.phoneTextField.text forKey:@"mobile"];
        [newDic setObject:self.yanZhengMa.text forKey:@"verify"];
        if ([Toos isBlank:[UserModel shared].ZFPassWord]) {
            url = @"/app/member/save_password";
//            [newDic setObject:self.passWordTF.text forKey:@"pwd"];
            [newDic setObject:self.passWordTF1.text forKey:@"password"];
        }else {
            url = @"/app/member/save_password";
//            [newDic setObject:self.passWordTF.text forKey:@"old_pwd"];
            [newDic setObject:self.passWordTF1.text forKey:@"password"];
        }

    }
//    else if ([self.isFrom isEqualToString:@"2"]){
//        url = @"/app/user/edit_pwd";
//
//          [newDic setObject:[Toos setUpWithObjectForKey:@"token"] forKey:@"token"];
//        [newDic setObject:[UserModel shared].uid forKey:@"uid"];
//        [newDic setObject:self.phoneStr forKey:@"phone"];
//        [newDic setObject:self.yanZhengMa.text forKey:@"yzm"];
//
//        [newDic setObject:self.passWordTF.text forKey:@"old_pwd"];
//
//        [newDic setObject:self.passWordTF1.text forKey:@"new_pwd"];
//
//    }else {
//        url = @"app/public/forget";
//
//        [newDic setObject:self.phoneStr forKey:@"mobile"];
//         [newDic setObject:self.yanZhengMa.text forKey:@"yzm"];
//
//         [newDic setObject:self.passWordTF.text forKey:@"password"];
//
//         [newDic setObject:self.passWordTF1.text forKey:@"t_password"];
//    }
    
    [self setUpWithPassWord:url newDic:newDic];
    
    
}

-(void)setUpWithPassWord:(NSString *)url newDic:(NSMutableDictionary *)newDic {
    
    [Toos dataWithSessionurl:url body:newDic view:self.view token:@"" Block:^(id tempData) {
        if ([tempData[@"status"]intValue] == 1) {
            if ([self.isFrom isEqualToString:@"3"]) {
                [self.navigationController popViewControllerAnimated:YES];
            }else if([self.isFrom isEqualToString:@"1"]){
                
                if ([url isEqualToString:@"app/user/edit_pay"]) {
                    [UserModel shared].ZFPassWord = self.passWordTF1.text;
                    [[UserModel shared]saveUser];
                }
                

                [self.navigationController popViewControllerAnimated:YES];
            }else {
                
                [Toos JiaZaiAnimation:tempData[@"msg"] myView:self.view block:^(id temp) {
//                    self.hidesBottomBarWhenPushed = YES;
//                    LoginViewController *login = [[LoginViewController alloc]init];
//                    [self.navigationController pushViewController:login animated:YES];
                    
                     [self.navigationController popViewControllerAnimated:YES];
                    
                    
                }];
                
                
            }
        }else {
            [Toos setUpWithMBP:tempData[@"msg"] UIView:self.view];
        }
        
        
        
        
    } failBlock:^(id tempData) {
        
    }];
    
    
}



#pragma mark---获取验证码
-(void)handleClikYanZhengMa:(UIButton *)sender {
    
    
    [self.phoneTextField resignFirstResponder];
    
    if (self.phoneTextField.text.length == 0) {
        [Toos setUpWithMBP:@"请输入手机号" UIView:self.view];
        return;
    }
    
    if (self.phoneTextField.text.length != 11) {
        [Toos setUpWithMBP:@"请输入正确的手机号" UIView:self.view];
        return;
    }
 
    
    [self setUpWithYanZhengMa:self.phoneTextField.text];
    
    
    
    
}
- (void)setUpWithYanZhengMa:(NSString *)mobile  {
    NSDictionary *dic = @{@"phone":mobile,@"type":@"3"};
    
    
    [Toos dataWithSessionurl:@"/app/public/yzm" body:dic view:self.view token:@"" Block:^(id tempData) {
        
        if ([tempData[@"status"]intValue] == 1) {
            [self.db click];
        }
        
        [Toos setUpWithMBP:tempData[@"msg"] UIView:self.view];
        
        
    } failBlock:^(id tempData) {
        
    }];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
