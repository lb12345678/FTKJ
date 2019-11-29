//
//  AddAddressViewController.m
//  JZGL
//
//  Created by ios on 2019/8/9.
//  Copyright © 2019年 ios. All rights reserved.
//

#import "AddAddressViewController.h"
#import <MOFSPickerManager.h>

@interface AddAddressViewController ()<UITextFieldDelegate>

@property(nonatomic,retain)UITextField *nameTF;

@property(nonatomic,retain)UITextField *phoneTF;

@property(nonatomic,retain)UITextField *addressTF;

@property(nonatomic,retain)UITextField *XXAddressTF;

@property(nonatomic,assign)BOOL isMoRen;


@end

@implementation AddAddressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"添加收货地址";
    [self setUpWithBigVIew];
    // Do any additional setup after loading the view.
}
- (void)setUpWithBigVIew {
    
   
    
    UIView *twoView = [[UIView alloc]initWithFrame:CGRectMake(0,  0, kScreenWidth, kWidthChange(250))];
    twoView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:twoView];
    
    NSArray *nameArray = @[@"收件人",@"手机号码",@"所在地区",@"详细地址",@"设为默认地址"];
    NSArray *twoArray;
    if ([Toos isNotBlank:self.myDic]) {
        twoArray = @[self.myDic[@"name"],self.myDic[@"mobile"],self.myDic[@"region"],self.myDic[@"address"],@""];
    }else {
        twoArray = @[@"请填写真实姓名",@"请填写收货人联系电话",@"请选择地址",@"输入收货人详细街道地址",@""];
    }
    for (int i = 0; i < nameArray.count; i++) {
        UIView *smallView = [[UIView alloc]initWithFrame:CGRectMake(0, kWidthChange(50) * i, kScreenWidth, kWidthChange(50))];
        smallView.backgroundColor = [UIColor whiteColor];
        [twoView addSubview:smallView];
        
        UILabel *oneLabel = [Toos setUpWithUserLabel:[nameArray objectAtIndex:i] CGRect:CGRectMake(15, 0, kScreenWidth - 30, kWidthChange(50)) color:[UIColor clearColor] textColor:newColor(58, 58, 58, 1) textSize:kWidthChange(14)];
        
        [smallView addSubview:oneLabel];
        
        UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake(kWidthChange(30) + [Toos textRect:@"联系电话" textFont:[UIFont systemFontOfSize:kWidthChange(14)]], 0, kScreenWidth - 80, kWidthChange(50))];
        textField.delegate = self;
       
        
        if ([Toos isNotBlank:self.myDic]) {
             textField.text = [twoArray objectAtIndex:i];
        }
        else {
             textField.placeholder = [twoArray objectAtIndex:i];
            
        }
        
        
        
        
        if (i != 4) {
             [smallView addSubview:textField];
        }
        
            textField.font = [UIFont systemFontOfSize:kWidthChange(14)];
            if ( i == 0 ){
                self.nameTF = textField;
            }else if (i == 1){
                self.phoneTF = textField;
                self.phoneTF.keyboardType = UIKeyboardTypeNumberPad;
            }else if (i == 2){
                self.addressTF = textField;
                
            }else if (i == 3){
                self.XXAddressTF = textField;
                
            }
            
        if (i == 4) {
            if ([Toos isNotBlank:self.order_id]) {
                smallView.hidden = YES;
            }
        }
        
      
        UILabel *lineLabel = [Toos setUpWithUserLabel:@"" CGRect:CGRectMake(15, kWidthChange(50) - 1, kScreenWidth - 30, 1) color:[UIColor lightGrayColor] textColor:RedColor textSize:14];
        lineLabel.alpha = .3;
        [smallView addSubview:lineLabel];
        
        
        
    }
    
   
 
    UIButton *moRenBT = [UIButton buttonWithType:UIButtonTypeCustom];
    moRenBT.frame = CGRectMake(kScreenWidth - kWidthChange(15) - kWidthChange(40), kTopHeight + kWidthChange(200) + kWidthChange(50) / 2 - kWidthChange(12.5), kWidthChange(40), kWidthChange(25));
    
    if ([Toos isBlank:self.order_id]) {
         [self.view addSubview:moRenBT];
    }
    
   
    
    
    if ([Toos isNotBlank:self.myDic]) {
        if ([[NSString stringWithFormat:@"%@",self.myDic[@"is_default"]]isEqualToString:@"1"]) {
            self.isMoRen = YES;
            [moRenBT setImage:[UIImage imageNamed:@"icon_4cart_switch_s"] forState:UIControlStateNormal];
        }else {
            self.isMoRen = NO;
            [moRenBT setImage:[UIImage imageNamed:@"icon_4cart_switch_n"] forState:UIControlStateNormal];
        }
    }else {

        [moRenBT setImage:[UIImage imageNamed:@"icon_4cart_switch_n"] forState:UIControlStateNormal];
    }
    [moRenBT addTarget:self action:@selector(clickMoRen:) forControlEvents:UIControlEventTouchUpInside];
    UIButton *downBT = [UIButton buttonWithType:UIButtonTypeCustom];
    downBT.frame = CGRectMake(kWidthChange(40), kTopHeight + kWidthChange(300), kScreenWidth - kWidthChange(80), kWidthChange(50));
    [downBT setTitle:@"保存地址" forState:UIControlStateNormal];
    [downBT setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    downBT.backgroundColor = newColor(229, 20, 50, 1);
    downBT.layer.masksToBounds = YES;
    downBT.layer.cornerRadius = kWidthChange(25);
    downBT.titleLabel.font = [UIFont systemFontOfSize:kWidthChange(16)];
    [self.view addSubview:downBT];
    
    [downBT addTarget:self action:@selector(clickAddAddress:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)clickMoRen:(UIButton *)sender {
    if (self.isMoRen == NO) {
        [sender setImage:[UIImage imageNamed:@"icon_4cart_switch_s"] forState:UIControlStateNormal];
        self.isMoRen = YES;
    }else if (self.isMoRen == YES){
        [sender setImage:[UIImage imageNamed:@"icon_4cart_switch_n"] forState:UIControlStateNormal];
        self.isMoRen = NO;
    }
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    [self.nameTF resignFirstResponder];
    [self.phoneTF resignFirstResponder];
    
}

#pragma mark--选择地址
- (void)clickAddress:(UITapGestureRecognizer *)tap {
//    self.hidesBottomBarWhenPushed = YES;
//    CityViewController *city = [[CityViewController alloc]init];
//
//    [self.navigationController pushViewController:city animated:YES];
//    __weak typeof(self)weakSelf = self;
//    city.ClickAddress = ^(NSDictionary *shengDic, NSDictionary *shiDic, NSDictionary *quDic) {
//
//        weakSelf.addressLabel.text = [NSString stringWithFormat:@"%@%@%@",shengDic[@"name"],shiDic[@"name"],quDic[@"name"]];
//        weakSelf.ShengID = shengDic[@"id"];
//        weakSelf.ShiID = shiDic[@"id"];
//        weakSelf.QuID = quDic[@"id"];
//        weakSelf.addressLabel.textColor =  newColor(58, 58, 58, 1);
//
//    };
    
    
}
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    if (textField == self.addressTF) {
        
        [MOFSPickerManager shareManger].addressPicker.numberOfSection = 3;
        [[MOFSPickerManager shareManger] showMOFSAddressPickerWithDefaultAddress:@"" title:@"选择地址" cancelTitle:@"取消" commitTitle:@"确定" commitBlock:^(NSString *address, NSString *zipcode) {
            textField.text = address;
        } cancelBlock:^{
            
        }];
        return NO;
    }
    return YES;
    
}
#pragma mark---添加地址
-(void)clickAddAddress:(UIButton *)sender {
    if (self.nameTF.text.length == 0) {
        
        [Toos setUpWithMBP:@"请输入收货人姓名" UIView:self.view];
        
        return;
    }
    
    if (self.phoneTF.text.length == 0) {
        
        [Toos setUpWithMBP:@"请输入联系方式" UIView:self.view];
        
        return;
    }
    if (self.addressTF.text.length == 0) {
        
        [Toos setUpWithMBP:@"请选择所在地区" UIView:self.view];
        
        return;
    }
    
    if (self.XXAddressTF.text.length == 0) {
        
        [Toos setUpWithMBP:@"请选择您的详细地址" UIView:self.view];
        
        return;
    }
    
    NSMutableDictionary *tempDic = [NSMutableDictionary dictionaryWithCapacity:1];
    [tempDic setObject:[UserModel shared].uid forKey:@"uid"];
    [tempDic setObject:self.nameTF.text forKey:@"name"];
    [tempDic setObject:self.phoneTF.text forKey:@"mobile"];
    [tempDic setObject:self.addressTF.text forKey:@"region"];
    [tempDic setObject:self.XXAddressTF.text forKey:@"address"];
    
    
    NSString *urlStr = @"/app/member/change_address";
    if ([Toos isNotNull:self.order_id]) {
        urlStr = @"/app/Integral/add_address";
        [tempDic setObject:self.order_id forKey:@"id"];
    }
    
    
    
    
    if (self.isMoRen == YES) {
        [tempDic setObject:@"1" forKey:@"default"];
    }
    
    if ([Toos isNotBlank:self.myDic]) {
        [tempDic setObject:self.myDic[@"id"] forKey:@"id"];
    }
    
    [Toos dataWithSessionurl:urlStr body:tempDic view:self.view token:@"" Block:^(id tempData) {
        [Toos setUpWithMBP:tempData[@"msg"] UIView:[UIApplication sharedApplication].keyWindow];
        if ([tempData[@"code"]intValue] == 200) {
            
            if ([Toos isNotNull:self.order_id]) {
                [self.navigationController popToRootViewControllerAnimated:YES];
            }else {
            
            [self.navigationController popViewControllerAnimated:YES];
            }
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
