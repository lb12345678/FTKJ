//
//  GRZLViewController.m
//  FTKJ
//
//  Created by ios on 2019/11/22.
//  Copyright © 2019年 ios. All rights reserved.
//

#import "GRZLViewController.h"
#import "XuanZeTouXiangView.h"
#import "XHDatePickerView.h"
#import "ZHSZViewController.h"
#import "LoginViewController.h"
@interface GRZLViewController ()<UITextFieldDelegate>

@property(nonatomic,retain)UITextField *nameTF;

@property(nonatomic,retain)UITextField *SexTF;

@property(nonatomic,retain)UITextField *SRTF;

@property(nonatomic,retain)XuanZeTouXiangView *XZTXView;

@end

@implementation GRZLViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"个人资料";
    [self setUpWithBigView];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(xuanZeHeaderImage:) name:@"xztx" object:nil];
    
    
    
    
    // Do any additional setup after loading the view.
}

-(void)setUpWithBigView {
    
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kWidthChange(84))];
    headerView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:headerView];
    
    
    UILabel *oneLabel = [Toos setUpWithUserLabel:@"头像" CGRect:CGRectMake(kWidthChange(20), 0, kScreenWidth - kWidthChange(40), kWidthChange(84)) color:[UIColor clearColor] textColor:newColor(39, 40, 41, 1) textSize:kWidthChange(18)];
    
    [headerView addSubview:oneLabel];
    
    
    
    UIButton *headerBT = [[UIButton alloc]initWithFrame:CGRectMake(kScreenWidth - kWidthChange(20) - kWidthChange(50), kWidthChange(17), kWidthChange(50), kWidthChange(50))];
    headerBT.backgroundColor = [UIColor redColor];
    headerBT.layer.masksToBounds = YES;
    headerBT.layer.cornerRadius = kWidthChange(25);
    [headerBT addTarget:self action:@selector(clickTouXiang:) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:headerBT];
    
    NSArray *nameArray = @[@{@"title":@"昵称",@"message":@"杜兰特"},@{@"title":@"性别",@"message":@"男"},@{@"title":@"生日",@"message":@"1995-10-1"}];
    
    for (int i = 0; i < 3; i++) {
        
        UIView *smallView = [[UIView alloc]initWithFrame:CGRectMake(0, kWidthChange(50) * i + CGRectGetMaxY(headerView.frame), kScreenWidth, kWidthChange(50))];
        smallView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:smallView];
        
        UILabel *twoLabel = [Toos setUpWithUserLabel:[nameArray objectAtIndex:i][@"title"] CGRect:CGRectMake(15, 0, [Toos textRect:@"联系电话" textFont:[UIFont systemFontOfSize:kWidthChange(16)]], kWidthChange(50)) color:[UIColor clearColor] textColor:newColor(39, 40, 41, 1) textSize:kWidthChange(18)];
        
        [smallView addSubview:twoLabel];
        
        UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake(0 , 0, kScreenWidth - kWidthChange(20), kWidthChange(50))];
        textField.delegate = self;
        textField.text = [nameArray objectAtIndex:i][@"message"];
        //        textField.userInteractionEnabled = NO;
        [smallView addSubview:textField];
        textField.font = [UIFont systemFontOfSize:kWidthChange(16)];
        
        textField.textAlignment = NSTextAlignmentRight;
        textField.textColor = newColor(145, 146, 147, 1);
        
        if ( i == 0 ){
            self.nameTF = textField;
        }else if (i == 1){
            self.SexTF = textField;
           
        }else if (i == 2){
            self.SRTF = textField;
            
            
        }
        
        
        
        
        
        UIImageView *rightImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"box21"]];
        rightImage.frame = CGRectMake(kScreenWidth - kWidthChange(20) - 10, kWidthChange(50) / 2 - 15 / 2, 10, 15);
        smallView.tag = 100 + i;
        if (i == 1 || i == 2) {
            
            
            CGRect textFrame = textField.frame;
            textFrame.size.width = kScreenWidth - kWidthChange(46);
            textField.frame = textFrame;
            
            [smallView addSubview:rightImage];
           
        }
        
        UILabel *lineLabel = [Toos setUpWithUserLabel:@"" CGRect:CGRectMake(0, 0, kScreenWidth , 1) color:[UIColor lightGrayColor] textColor:RedColor textSize:14];
        lineLabel.alpha = .3;
        [smallView addSubview:lineLabel];
        
        
        
        
        
        
    }
    
    
    UIView *smallView = [[UIView alloc]initWithFrame:CGRectMake(0, kWidthChange(175)  + CGRectGetMaxY(headerView.frame), kScreenWidth, kWidthChange(50))];
    smallView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:smallView];
    
    UILabel *threeLabel = [Toos setUpWithUserLabel:@"账户安全" CGRect:CGRectMake(15, 0, [Toos textRect:@"联系电话" textFont:[UIFont systemFontOfSize:kWidthChange(16)]], kWidthChange(50)) color:[UIColor clearColor] textColor:newColor(39, 40, 41, 1) textSize:kWidthChange(18)];
    
    [smallView addSubview:threeLabel];
    
    threeLabel.userInteractionEnabled = NO;
    [smallView addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickZHAQ:)]];
    
    
    UIImageView *rightImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"box21"]];
    rightImage.frame = CGRectMake(kScreenWidth - kWidthChange(20) - 10, kWidthChange(50) / 2 - 15 / 2, 10, 15);
   
        [smallView addSubview:rightImage];
        
    
    UIButton *bayBT = [UIButton buttonWithType:UIButtonTypeCustom];
    bayBT.frame = CGRectMake( kWidthChange(40) ,kScreenHeight - downH - kTopHeight - kWidthChange(60),  kScreenWidth - kWidthChange(80), kWidthChange(40));
    bayBT.backgroundColor = newColor(231, 20, 51, 1);
    bayBT.layer.masksToBounds = YES;
    bayBT.layer.cornerRadius = kWidthChange(20);
    [bayBT setTitle:@"退出登录" forState:UIControlStateNormal];
    [bayBT setTitleColor:newColor(255, 255, 255, 1) forState:UIControlStateNormal];
    bayBT.titleLabel.font = [UIFont systemFontOfSize:kWidthChange(16)];
    [self.view addSubview:bayBT];
    [bayBT addTarget:self action:@selector(clickBayBT:) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark---选择头像
-(void)clickTouXiang:(UIButton *)sender {
    if (self.XZTXView) {
        self.XZTXView.hidden = NO;
    }else {
        self.XZTXView = [[XuanZeTouXiangView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
        self.XZTXView.isfrom = @"选择头像";
        self.XZTXView.arr = [@[@"拍照",@"相册"]mutableCopy];
        [[UIApplication sharedApplication].keyWindow addSubview:self.XZTXView];
        
    }
    
    
}
#pragma mark--选择头像
-(void)xuanZeHeaderImage:(NSNotification *)noti {
    [self setUpWithNewBigHeaderImage:noti.object];
    __weak typeof(self)weakSelf = self;
    self.myImage = ^(NSDictionary *newDic) {
        
    };
}

#pragma mark--退出登录
-(void)clickBayBT:(UIButton *)sender {
    LoginViewController *Login = [[LoginViewController alloc]init];
    ZFNavigationController *ZFNavi = [[ZFNavigationController alloc]initWithRootViewController:Login];
    [self presentViewController:ZFNavi animated:YES completion:nil];
    
}
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    if (textField == self.nameTF) {
        return YES;
    }
    
    
    if (textField == self.SRTF) {
        
        [[IQKeyboardManager sharedManager] resignFirstResponder];
        
        __weak typeof(self) weakSelf = self;
        
        XHDatePickerView *pickerView = [[XHDatePickerView alloc] initWithSingleDate:^(NSDate *date) {
            //        [sender setTitle:[date stringWithFormat:@"yyyy-MM-dd"] forState:UIControlStateNormal];
            weakSelf.SRTF.text = [date stringWithFormat:@"yyyy-MM-dd"];
            //        self.timeLabel.text = [date stringWithFormat:@"yyyy年MM月"];
            
            //        [self setUpWithData:[date stringWithFormat:@"yyyy-MM"] page:1];
        } dismissBlock:nil];
        
        pickerView.datePickerStyle = 2;
        pickerView.minLimitDate = [NSDate date:@"1900-2-28 12:22" WithFormat:@"yyyy-MM-dd HH:mm"];
        pickerView.maxLimitDate = [NSDate date:@"2080-2-28 12:12" WithFormat:@"yyyy-MM-dd HH:mm"];
        
        [pickerView show];
        
        
        
        
        
        
        
        return NO;
    }
    
    if (textField == self.SexTF) {
        
        if ([self.SexTF.text isEqualToString:@"男"]) {
            self.SexTF.text = @"女";
        }else if ([self.SexTF.text isEqualToString:@"女"]){
             self.SexTF.text = @"男";
            
        }
        
        
        
        
        
        
        
        return NO;
    }
    
    
    return NO;
    
}

-(void)clickZHAQ:(UITapGestureRecognizer *)sender {
    self.hidesBottomBarWhenPushed = YES;
    ZHSZViewController *ZHSZ = [[ZHSZViewController alloc]init];
    [self.navigationController pushViewController:ZHSZ animated:YES];
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
