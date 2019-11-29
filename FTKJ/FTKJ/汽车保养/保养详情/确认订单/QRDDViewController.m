//
//  QRDDViewController.m
//  FTKJ
//
//  Created by ios on 2019/11/20.
//  Copyright © 2019年 ios. All rights reserved.
//

#import "QRDDViewController.h"
#import "YYBYTimeView.h"
#import "ZXZFViewController.h"
@interface QRDDViewController ()<UITextFieldDelegate>

@property(nonatomic,retain)UILabel *numberlabel;

@property(nonatomic,retain)UITextField *timeTF;

@property(nonatomic,retain)UILabel *moneyLabel;

@property(nonatomic,retain)YYBYTimeView *YYBTTime;
@end

@implementation QRDDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"确认订单";
    [self setUpWithBigView];
    // Do any additional setup after loading the view.
}

-(void)setUpWithBigView {
    UIScrollView *bigScrollerView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - kTopHeight - kWidthChange(70) - downH  )];
    
    bigScrollerView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:bigScrollerView];
    
    UIView *oneView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kWidthChange(85))];
    oneView.backgroundColor = [UIColor whiteColor];
    
    [bigScrollerView addSubview:oneView];
    
    UILabel *nameLabel = [Toos setUpWithUserLabel:@"保养" CGRect:CGRectMake(kWidthChange(20), 0, kScreenWidth - kWidthChange(40) - kWidthChange(100), kWidthChange(85)) color:[UIColor clearColor] textColor:newColor(0, 0, 0, 1) textSize:kWidthChange(20)];
    nameLabel.numberOfLines = 0;
    
    [oneView addSubview:nameLabel];
    
    
    UILabel *moneyLabel = [Toos setUpWithUserLabel:@"¥ 189" CGRect:CGRectMake(kWidthChange(20), 0, kScreenWidth - kWidthChange(40) , kWidthChange(85)) color:[UIColor clearColor] textColor:newColor(0, 0, 0, 1) textSize:kWidthChange(25)];
    moneyLabel.textAlignment = NSTextAlignmentRight;
    [oneView addSubview:moneyLabel];
    
    UIView *twoView = [Toos setBigView:kWidthChange(10) origin:CGRectGetMaxY(oneView.frame)];
    [bigScrollerView addSubview:twoView];
    
    
    
    UIView *threeView = [Toos setBigView:kWidthChange(10) origin:CGRectGetMaxY(twoView.frame)];
    [bigScrollerView addSubview:threeView];
    threeView.backgroundColor = [UIColor whiteColor];
    
    
    
    UILabel *DDLabel = [Toos setUpWithUserLabel:@"订单商品" CGRect:CGRectMake( kWidthChange(20), 0, kScreenWidth - kWidthChange(40), kWidthChange(50)) color:[UIColor clearColor] textColor:newColor(17, 19, 22, 1) textSize:kWidthChange(16)];
    [threeView addSubview:DDLabel];
    
    
   
    
    
    
    
    
    
    UIImageView *bigImage = [[UIImageView alloc]initWithFrame:CGRectMake(kWidthChange(20), CGRectGetMaxY(DDLabel.frame) + kWidthChange(10), kWidthChange(107), kWidthChange(107))];
            bigImage.backgroundColor = [UIColor redColor];
            bigImage.layer.masksToBounds = YES;
            bigImage.layer.cornerRadius = 5;
    
    [threeView addSubview:bigImage];
    
    
    
    
    
    UILabel *spNameLabel  = [Toos setUpWithUserLabel:@"123456789" CGRect:CGRectMake(CGRectGetMaxX(bigImage.frame) + kWidthChange(20),CGRectGetMaxY(DDLabel.frame) + kWidthChange(10) , kScreenWidth - CGRectGetMaxX(bigImage.frame) - kWidthChange(40), kWidthChange(40)) color:[UIColor clearColor] textColor:newColor(26, 27, 28, 1) textSize:kWidthChange(18)];
    spNameLabel.numberOfLines = 0;
    
      [threeView addSubview:spNameLabel];
    UILabel *SpMoneyLabel = [Toos setUpWithUserLabel:@"¥ 129" CGRect:CGRectMake(CGRectGetMaxX(bigImage.frame) + kWidthChange(20),CGRectGetMaxY(bigImage.frame) - kWidthChange(20) , kScreenWidth - CGRectGetMaxX(bigImage.frame) - kWidthChange(25), kWidthChange(20)) color:[UIColor clearColor] textColor:newColor(26, 27, 28, 1) textSize:kWidthChange(18)];
      [threeView addSubview:SpMoneyLabel];
    
    
    
    UILabel *XiaoLabel  = [Toos setUpWithUserLabel:@"X1" CGRect:CGRectMake( kWidthChange(20),CGRectGetMaxY(bigImage.frame) - kWidthChange(20) , kScreenWidth -  kWidthChange(40), kWidthChange(20)) color:[UIColor clearColor] textColor:newColor(124, 125, 127, 1) textSize:kWidthChange(18)];
    
    XiaoLabel.textAlignment = NSTextAlignmentRight;
    
    
      [threeView addSubview:XiaoLabel];
    
    
    
    UILabel *downLineLabel = [Toos setUpWithUserLabel:@"" CGRect:CGRectMake( kWidthChange(20), CGRectGetMaxY(bigImage.frame) + kWidthChange(20), kScreenWidth- kWidthChange(40) , kWidthChange(1)) color:lineColor_gary textColor:newColor(68, 71, 84, 1) textSize:kWidthChange(14)];
    [threeView addSubview:downLineLabel];
    
    
    
    
    UILabel *GMLabel = [Toos setUpWithUserLabel:@"购买数量" CGRect:CGRectMake(kWidthChange(20), CGRectGetMaxY(downLineLabel.frame), kScreenWidth - kWidthChange(40) - kWidthChange(100), kWidthChange(60)) color:[UIColor clearColor] textColor:newColor(54, 55, 56, 1) textSize:kWidthChange(18)];
  
    [threeView addSubview:GMLabel];
    
    
    UIButton *deleteBT = [UIButton buttonWithType:UIButtonTypeCustom];
    deleteBT.frame = CGRectMake(kScreenWidth - kWidthChange(20) - kWidthChange(30) - kWidthChange(45) - kWidthChange(30) , CGRectGetMaxY(downLineLabel.frame) + kWidthChange(15), kWidthChange(30), kWidthChange(30));
    [deleteBT setImage:[UIImage imageNamed:@"box19"] forState:UIControlStateNormal];
    
    [deleteBT addTarget:self action:@selector(clickJian:) forControlEvents:UIControlEventTouchUpInside];
     [threeView addSubview:deleteBT];
    
    
    self.numberlabel  = [Toos setUpWithUserLabel:@"1" CGRect:CGRectMake( CGRectGetMaxX(deleteBT.frame),  CGRectGetMaxY(downLineLabel.frame) + kWidthChange(15), kWidthChange(45), kWidthChange(30)) color:[UIColor clearColor] textColor:newColor(0, 0, 0, 1) textSize:kWidthChange(15)];
    self.numberlabel.textAlignment = NSTextAlignmentCenter;
    
    [threeView addSubview: self.numberlabel];
    
  
    
    UIButton *addBT  = [UIButton buttonWithType:UIButtonTypeCustom];
    addBT.frame = CGRectMake(CGRectGetMaxX(self.numberlabel.frame), CGRectGetMaxY(downLineLabel.frame) + kWidthChange(15), kWidthChange(30), kWidthChange(30));
    [addBT setImage:[UIImage imageNamed:@"box20"] forState:UIControlStateNormal];
    
    [addBT addTarget:self action:@selector(clickAdd:) forControlEvents:UIControlEventTouchUpInside];
    [threeView addSubview:addBT];
    
    CGRect threeFrame = threeView.frame;
    threeFrame.size.height = CGRectGetMaxY(GMLabel.frame);
    threeView.frame = threeFrame;
    
    
    UIView *fourView = [Toos setBigView:kWidthChange(10) origin:CGRectGetMaxY(threeView.frame)];
    [bigScrollerView addSubview:fourView];
    
    UIView *fiveView = [Toos setBigView:kWidthChange(60) origin:CGRectGetMaxY(fourView.frame)];
    [bigScrollerView addSubview:fiveView];
    fiveView.backgroundColor = [UIColor whiteColor];
    
    
    
    UILabel *TimeLabel = [Toos setUpWithUserLabel:@"选择服务时间" CGRect:CGRectMake( kWidthChange(20), 0, kScreenWidth - kWidthChange(40), kWidthChange(60)) color:[UIColor clearColor] textColor:newColor(74, 75, 77, 1) textSize:kWidthChange(18)];
    [fiveView addSubview:TimeLabel];
    
    
    self.timeTF = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth - kWidthChange(45), kWidthChange(60))];
    self.timeTF.textAlignment = NSTextAlignmentRight;
    self.timeTF.placeholder = @"未选择服务时间";
    self.timeTF.delegate = self;
    self.timeTF.font = [UIFont systemFontOfSize:kWidthChange(15)];
    [fiveView addSubview:self.timeTF];
    
    
    UIImageView *rightImage = [[UIImageView alloc]initWithFrame:CGRectMake(kScreenWidth - kWidthChange(20) - kWidthChange(15), kWidthChange(30) - kWidthChange(10), kWidthChange(15), kWidthChange(20))];
    rightImage.image = [UIImage imageNamed:@"box21"];
    //rightImage.contentMode = UIViewContentModeScaleAspectFill;
    [fiveView addSubview:rightImage];
    
    
    
    UIView *downView = [[UIView alloc]initWithFrame:CGRectMake(0, kScreenHeight - downH - kWidthChange(70) - kTopHeight, kScreenWidth, kWidthChange(70))];
    downView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:downView];
    
    
    
    UILabel *oneMoneyLabel = [Toos setUpWithUserLabel:@"应付金额：" CGRect:CGRectMake(kWidthChange(20), 0, [Toos textRect:@"应付金额：" textFont:[UIFont systemFontOfSize:kWidthChange(18)]], kWidthChange(70)) color:[UIColor clearColor] textColor:newColor(34, 35, 37, 1) textSize:kWidthChange(18)];
    [downView addSubview:oneMoneyLabel];
    
//    self.moneyLabel = [Toos setUpWithUserLabel:[NSString stringWithFormat:@"合计：¥%.2f",[tempDic[@"pay_price"]floatValue]] CGRect:CGRectMake( kWidthChange(15),0 , kScreenWidth - kWidthChange(61), kWidthChange(70)) color:[UIColor clearColor] textColor:newColor(31, 46, 125, 1) textSize:kWidthChange(20)];
//
//    [downView addSubview: self.moneyLabel];
//
//    self.moneyLabel.attributedText = [Toos setUpWithtext:[NSString stringWithFormat:@"合计：¥%.2f",[tempDic[@"pay_price"]floatValue]] color:newColor(234, 57, 0, 1) color1:newColor(234, 0, 0, 1) font:kWidthChange(16) font1:kWidthChange(20) length:3 length1:[[NSString stringWithFormat:@"¥%.2f",[tempDic[@"pay_price"]floatValue]]length]];
//
    UIButton *bayBT = [UIButton buttonWithType:UIButtonTypeCustom];
    bayBT.frame = CGRectMake(kScreenWidth - kWidthChange(15) - kWidthChange(100), kWidthChange(15),  kWidthChange(100), kWidthChange(40));
    bayBT.backgroundColor = newColor(230, 21, 50, 1);
    bayBT.layer.masksToBounds = YES;
    bayBT.layer.cornerRadius = kWidthChange(20);
    [bayBT setTitle:@"立即支付" forState:UIControlStateNormal];
    [bayBT setTitleColor:newColor(255, 255, 255, 1) forState:UIControlStateNormal];
    bayBT.titleLabel.font = [UIFont systemFontOfSize:kWidthChange(15)];
    [downView addSubview:bayBT];
    [bayBT addTarget:self action:@selector(clickBayBT:) forControlEvents:UIControlEventTouchUpInside];
    
}

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    if (self.YYBTTime) {
        self.YYBTTime.hidden = NO;
    }else {
        self.YYBTTime = [[YYBYTimeView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
        self.YYBTTime.hidden = NO;
        [[UIApplication sharedApplication].keyWindow addSubview:self.YYBTTime];
        
        
    }
    self.YYBTTime.ClickBlock = ^(NSString * _Nonnull timeStr) {
        textField.text = timeStr;
    };
    return NO;
    
}


#pragma mark--减
-(void)clickJian:(UIButton *)sender {
    
    
}

#pragma mark--加
-(void)clickAdd:(UIButton *)sender {
    
    
}


-(void)clickBayBT:(UIButton *)sender {
    self.hidesBottomBarWhenPushed = YES;
    ZXZFViewController *ZXZFView = [[ZXZFViewController alloc]init];
    [self.navigationController pushViewController:ZXZFView animated:YES];
    
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
