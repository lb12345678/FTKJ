//
//  ZhiFuPassWord.m
//  KuaiPai
//
//  Created by ios on 2018/6/13.
//  Copyright © 2018年 ios. All rights reserved.
//

#import "ZhiFuPassWord.h"

// 输入密码的位数
static const int boxCount = 6;
// 输入方格的边长
static const CGFloat boxWH = 40;
@interface ZhiFuPassWord()
@property (strong, nonatomic) NSMutableArray *boxes;
// 占位编辑框(这样就点击密码格以外的部分,可以弹出键盘)
@property (nonatomic, retain) UITextField *contentTextField;


@property(nonatomic,retain)UIView *alphaView;

@property(nonatomic,retain)UIView *bigView;


@property(nonatomic,retain)UILabel *moneylabel;


@end





@implementation ZhiFuPassWord

- (instancetype)initWithFrame:(CGRect)frame{
    if (self == [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor clearColor];
        [self setUpContentView];
    }
    return self;
}

- (void)setUpContentView
{
    
    
    self.alphaView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    self.alphaView.backgroundColor  =[UIColor lightGrayColor];
    self.alphaView.alpha = .5;
    [self addSubview:self.alphaView];
    
    
    self.bigView = [[UIView alloc]initWithFrame:CGRectMake(33, kHeightChange(117), kScreenWidth - 66, kHeightChange(229))];
    self.bigView.backgroundColor = [UIColor whiteColor];
    
    self.bigView.layer.masksToBounds = YES;
    self.bigView.layer.cornerRadius = 10;
    [self addSubview:self.bigView];
    
    
    
    UILabel *titlelabel = [Toos setUpWithUserLabel:@"请输入支付密码" CGRect:CGRectMake(0, 0, kScreenWidth - 66, kHeightChange(50)) color:[UIColor clearColor] textColor:newColor(58, 58, 58, 1) textSize:kWidthChange(17)];
    
    titlelabel.textAlignment = NSTextAlignmentCenter;
    [self.bigView addSubview:titlelabel];
    
    
    UIButton *deleteBT = [UIButton buttonWithType:UIButtonTypeCustom];
    deleteBT.frame = CGRectMake(self.bigView.frame.size.width - 15 - kWidthChange(20), kHeightChange(15), kWidthChange(20), kHeightChange(20));
    
    [deleteBT setImage:[UIImage imageNamed:@"box22"] forState:UIControlStateNormal];
  
    [self.bigView addSubview:deleteBT];
    
    [deleteBT addTarget:self action:@selector(clickReturn:) forControlEvents:UIControlEventTouchUpInside];
    UILabel *linelabel = [Toos setUpWithUserLabel:@"" CGRect:CGRectMake(0, CGRectGetMaxY(titlelabel.frame), kScreenWidth - 64, 1) color:[UIColor lightGrayColor] textColor:newColor(58, 58, 58, 1) textSize:kWidthChange(17)];
    linelabel.alpha = .3;
 
    [self.bigView addSubview:linelabel];
    
    
    
    self.moneylabel = [Toos setUpWithUserLabel:@"￥199.00" CGRect:CGRectMake(0, CGRectGetMaxY(linelabel.frame) , kScreenWidth - 66, kHeightChange(114)) color:[UIColor clearColor] textColor:newColor(229, 56, 40, 1) textSize:kWidthChange(30)];
    
    self.moneylabel.textAlignment = NSTextAlignmentCenter;
    [self.bigView addSubview:self.moneylabel];
    
   
 
    
    
    self.contentTextField = [[UITextField alloc] initWithFrame:CGRectMake(0, self.bigView.frame.size.height - kHeightChange(65), self.frame.size.width, kHeightChange(50))];
    
    self.contentTextField.placeholder = @"请输入支付密码";
    self.contentTextField.hidden = YES;
    [ self.contentTextField addTarget:self action:@selector(txchange:) forControlEvents:UIControlEventEditingChanged];
   
     self.contentTextField.keyboardType = UIKeyboardTypeNumberPad;
    self.contentTextField.backgroundColor = [UIColor redColor];

    UIView *smallView = [[UIView alloc]initWithFrame:CGRectMake(15, self.bigView.frame.size.height - kHeightChange(55), self.bigView.frame.size.width - 30, kHeightChange(40))];
   [self.bigView addSubview:smallView];
     [self.bigView addSubview:self.contentTextField];
    
    smallView.layer.masksToBounds = YES;
    smallView.layer.cornerRadius = 0;
    smallView.layer.borderWidth = 1;
    smallView.layer.borderColor = newColor(195, 195, 195, .7).CGColor;
    
    // 密码格之间的间隔
    CGFloat margin = 10;
    for (int i = 0; i < boxCount; i++)
    {
//        CGFloat x = ([UIScreen mainScreen].bounds.size.width - boxCount * boxWH - (boxCount - 1)* margin) * 0.5 + (boxWH + margin) * i;
        UITextField *pwdLabel = [[UITextField alloc] initWithFrame:CGRectMake((self.bigView.frame.size.width - 30) / 6 * i, 0, (self.bigView.frame.size.width - 30) / 6, kHeightChange(40))];
        pwdLabel.layer.borderColor = newColor(235, 235, 234, 1).CGColor;
        pwdLabel.enabled = NO;
        pwdLabel.textAlignment = NSTextAlignmentCenter;//居中
        pwdLabel.secureTextEntry = YES;//设置密码模式
        pwdLabel.layer.borderWidth = .5;
        [smallView addSubview:pwdLabel];
        pwdLabel.keyboardType = UIKeyboardTypeNumberPad;
        [self.boxes addObject:pwdLabel];
    }
    //进入界面，contentTextField 成为第一响应
    [self.contentTextField becomeFirstResponder];
    [self setUpWithName:self.isName money:self.ZFMoney];
}

- (void)setUpWithName:(NSString *)name money:(NSString *)money{
    self.moneylabel.text = [NSString stringWithFormat:@"￥%@",money];
  
     [self.contentTextField becomeFirstResponder];
}


#pragma mark 文本框内容改变
- (void)txchange:(UITextField *)tx
{
    NSString *password = tx.text;
    
    for (int i = 0; i < self.boxes.count; i++)
    {
        UITextField *pwdtx = [self.boxes objectAtIndex:i];
        pwdtx.text = @"";
        if (i < password.length)
        {
            NSString *pwd = [password substringWithRange:NSMakeRange(i, 1)];
            pwdtx.text = pwd;
        }
        
    }
    // 输入密码完毕
    if (password.length == boxCount)
    {
        [tx resignFirstResponder];//隐藏键盘
        if (self.returnPasswordStringBlock != nil) {
            self.returnPasswordStringBlock(password);
        }
        
    }
}
#pragma mark --- 懒加载
- (NSMutableArray *)boxes{
    if (!_boxes) {
        _boxes = [NSMutableArray array];
    }
    return _boxes;
}

- (void)clickReturn:(UIButton *)sender {
    self.hidden = YES;
    [self.contentTextField resignFirstResponder];
    for (int i = 0; i < self.boxes.count; i++)
    {
        UITextField *pwdtx = [self.boxes objectAtIndex:i];
        [pwdtx resignFirstResponder];
        
    }
}

@end
