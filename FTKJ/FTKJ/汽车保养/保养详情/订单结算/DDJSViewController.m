//
//  DDJSViewController.m
//  FTKJ
//
//  Created by ios on 2019/11/22.
//  Copyright © 2019年 ios. All rights reserved.
//

#import "DDJSViewController.h"
#import "DDSPView.h"
#import "XuanZeYHView.h"
@interface DDJSViewController ()<UITextFieldDelegate>

@property(nonatomic,retain)UIScrollView *bigScrollerView;

@property(nonatomic,retain)UILabel *nameLabel;

@property(nonatomic,retain)UILabel *AddressLabel;

@property(nonatomic,retain)UILabel *MRLabel;

@property(nonatomic,retain)UITextView *BeiZhuTF;

@property(nonatomic,retain)DDSPView *SPView;

@property(nonatomic,retain)NSDictionary *tempDic;

@property(nonatomic,retain)NSString *address_Id;

@property(nonatomic,assign)BOOL isYunFei;

@property(nonatomic,retain)UILabel *moneyLabel;

@property(nonatomic,retain)NSString *JiFenStr;

@property(nonatomic,retain)UILabel *payLabel;

@property(nonatomic,retain)UITextField *payTF;

@property(nonatomic,retain)XuanZeYHView *XZYHView;



@end

@implementation DDJSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"订单结算";
    [self setUpWithBigView:@{}];
    // Do any additional setup after loading the view.
}
-(void)setUpWithBigView:(NSDictionary *)tempDic {
    self.tempDic = tempDic;
  
    self.bigScrollerView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - kTopHeight - downH - kWidthChange(70))];
    [self.view addSubview:self.bigScrollerView];
    
    UIView *addressView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth , kWidthChange(86))];
    addressView.backgroundColor = [UIColor whiteColor];
    addressView.layer.masksToBounds = YES;
    addressView.layer.cornerRadius = 5;
    [self.bigScrollerView addSubview:addressView];
    
    [addressView addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickAddressView:)]];
    
    
    
    UIImageView *upImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"upLine"]];
    
    upImage.frame = CGRectMake(0, 0, kScreenWidth , 2);
    [addressView addSubview:upImage];
    
    
    
    self.nameLabel = [Toos setUpWithUserLabel:@"" CGRect:CGRectMake(kWidthChange(20), kWidthChange(15), kScreenWidth, kWidthChange(20)) color:[UIColor clearColor] textColor:newColor(0, 0, 0, 1) textSize:kWidthChange(16)];
    [addressView addSubview:self.nameLabel];
    
    
    self.MRLabel = [Toos setUpWithUserLabel:@"默认" CGRect:CGRectMake(kWidthChange(20), CGRectGetMaxY(self.nameLabel.frame) + kWidthChange(4) + kWidthChange(35) / 2 - kWidthChange(10), [Toos textRect:@"默认" textFont:[UIFont systemFontOfSize:kWidthChange(13)]] + kWidthChange(16),  kWidthChange(20)) color:[UIColor clearColor] textColor:newColor(204, 114, 49, 1) textSize:kWidthChange(13)];
    
    self.MRLabel.textAlignment = NSTextAlignmentCenter;
    self.MRLabel.layer.masksToBounds = YES;
    self.MRLabel.layer.cornerRadius = kWidthChange(10);
    self.MRLabel.backgroundColor = newColor(253, 221, 155, 1);
    self.AddressLabel = [Toos setUpWithUserLabel:@"" CGRect:CGRectMake(CGRectGetMaxX(self.MRLabel.frame) + kWidthChange(10), CGRectGetMaxY(self.nameLabel.frame) + kWidthChange(4), kScreenWidth - kWidthChange(70), kWidthChange(35)) color:[UIColor clearColor] textColor:newColor(158, 159, 160, 1) textSize:kWidthChange(13)];
    [addressView addSubview:self.MRLabel];
    self.AddressLabel.numberOfLines = 2;
    [addressView addSubview:self.AddressLabel];
    self.MRLabel.hidden = YES;
    if ([Toos isNotBlank:tempDic[@"address"]]) {
        self.nameLabel.text = [NSString stringWithFormat:@"%@   %@",tempDic[@"address"][@"name"],[tempDic[@"address"][@"mobile"]stringByReplacingCharactersInRange:NSMakeRange(3, 4) withString:@"****"]];
        
        if ([tempDic[@"address"][@"default"]intValue] == 1) {
            self.MRLabel.hidden = NO;
        }else {
            self.MRLabel.hidden = YES;
            CGRect addressFrame = self.AddressLabel.frame;
            addressFrame.origin.x = kWidthChange(10);
            self.AddressLabel.frame = addressFrame;
            
            
        }
        
        self.AddressLabel.hidden = NO;
        
        self.address_Id = [NSString stringWithFormat:@"%@",tempDic[@"address"][@"id"]];
        
        self.AddressLabel.text = [NSString stringWithFormat:@"%@%@",tempDic[@"address"][@"region"],tempDic[@"address"][@"address"]];
    }else {
        
        CGRect nameFrame = self.nameLabel.frame;
        nameFrame.origin.x = kWidthChange(20);
        nameFrame.size.width = kScreenWidth - kWidthChange(40);
        nameFrame.size.height = kWidthChange(66);
        self.nameLabel.frame = nameFrame;
        self.nameLabel.textColor = newColor(133, 134, 135, 1);
        self.nameLabel.font = [UIFont systemFontOfSize:kWidthChange(17)];
        self.AddressLabel.hidden = YES;
        self.nameLabel.text = @"+ 添加收货地址";
        self.nameLabel.textAlignment = NSTextAlignmentCenter;
    }
    
    
    
    
    
    UIImageView *rightImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon_4cart_right"]];
    rightImage.frame = CGRectMake(kScreenWidth - kWidthChange(20)  - kWidthChange(12),  CGRectGetMaxY(self.nameLabel.frame) + kWidthChange(4), kWidthChange(12), kWidthChange(20));
    
    [addressView addSubview:rightImage];
    
    
    UIView *oneView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(addressView.frame) + kWidthChange(15), kScreenWidth , kWidthChange(222))];
    oneView.backgroundColor = [UIColor whiteColor];
    oneView.layer.masksToBounds = YES;
    oneView.layer.cornerRadius = 5;
    
    [self.bigScrollerView addSubview:oneView];
    
    
    UIView *oneSmallFrame = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth , kWidthChange(60))];
    oneSmallFrame.backgroundColor = [UIColor whiteColor];
   
    
    [oneView addSubview:oneSmallFrame];
    
    
    UILabel *OneZF = [Toos setUpWithUserLabel:@"支付方式" CGRect:CGRectMake( kWidthChange(20), 0, kScreenWidth , kWidthChange(60)) color:[UIColor clearColor] textColor:newColor(51, 52, 51, 1) textSize:kWidthChange(17)];
    [oneSmallFrame addSubview:OneZF];
    
    UILabel *TwoZF = [Toos setUpWithUserLabel:@"在线支付" CGRect:CGRectMake( kWidthChange(20), 0, kScreenWidth - kWidthChange(40), kWidthChange(60)) color:[UIColor clearColor] textColor:newColor(38, 38, 39, 1) textSize:kWidthChange(15)];
    [oneSmallFrame addSubview:TwoZF];
    TwoZF.textAlignment = NSTextAlignmentRight;
    
    UILabel *UpLineLabel = [Toos setUpWithUserLabel:@"" CGRect:CGRectMake( 0, CGRectGetMaxY(OneZF.frame), kScreenWidth , kWidthChange(15)) color:newColor(241, 242, 244, 1) textColor:newColor(68, 71, 84, 1) textSize:kWidthChange(14)];
    [oneView addSubview:UpLineLabel];
    
    
    UIView *twoSmallFrame = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(UpLineLabel.frame), kScreenWidth , kWidthChange(150))];
    twoSmallFrame.backgroundColor = [UIColor whiteColor];
  
    [oneView addSubview:twoSmallFrame];
    
    
    
    UILabel *DDLabel = [Toos setUpWithUserLabel:@"订单商品" CGRect:CGRectMake( kWidthChange(20), 0, kScreenWidth - kWidthChange(80), kWidthChange(50)) color:[UIColor clearColor] textColor:newColor(51, 52, 51, 1) textSize:kWidthChange(17)];
    [twoSmallFrame addSubview:DDLabel];
    
    
    UIScrollView *smallScroller = [[UIScrollView alloc]initWithFrame:CGRectMake(kWidthChange(20), CGRectGetMaxY(DDLabel.frame), kScreenWidth - kWidthChange(40) - kWidthChange(80), kWidthChange(60))];
    [twoSmallFrame addSubview:smallScroller];
    smallScroller.contentSize = CGSizeMake(kWidthChange(80) * [tempDic[@"icon_arr"]count], 0);
    for (int i = 0; i < [tempDic[@"icon_arr"]count]; i++) {
        
        UIImageView *oneImage = [[UIImageView alloc]initWithFrame:CGRectMake(i * kWidthChange(100), 0, kWidthChange(80), kWidthChange(80))];
        oneImage.backgroundColor = [UIColor redColor];
        [oneImage sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",[tempDic[@"icon_arr"]objectAtIndex:i]]]];
        [smallScroller addSubview:oneImage];
        
        
    }
    
    UIButton *ChaKanBT = [UIButton buttonWithType:UIButtonTypeCustom];
    ChaKanBT.frame = CGRectMake(kScreenWidth - kWidthChange(20) - kWidthChange(45),CGRectGetMaxY(DDLabel.frame) + kWidthChange(30),  kWidthChange(45), kWidthChange(25));
    ChaKanBT.backgroundColor = newColor(239, 240, 241, 1);
    ChaKanBT.layer.masksToBounds = YES;
    ChaKanBT.layer.cornerRadius = kWidthChange(12.5);
    [ChaKanBT setTitle:@"查看" forState:UIControlStateNormal];
    [ChaKanBT setTitleColor:newColor(164, 172, 180, 1) forState:UIControlStateNormal];
    ChaKanBT.titleLabel.font = [UIFont systemFontOfSize:kWidthChange(12)];
    [twoSmallFrame addSubview:ChaKanBT];
    [ChaKanBT addTarget:self action:@selector(ChaKanBT:) forControlEvents:UIControlEventTouchUpInside];
    
    
    UILabel *downLineLabel = [Toos setUpWithUserLabel:@"" CGRect:CGRectMake( 0, CGRectGetMaxY(twoSmallFrame.frame) , kScreenWidth , kWidthChange(15)) color:newColor(241, 242, 244, 1) textColor:newColor(68, 71, 84, 1) textSize:kWidthChange(14)];
    [oneView addSubview:downLineLabel];
    
    
    UIView *threeSmallFrame = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(downLineLabel.frame), kScreenWidth , kWidthChange(60))];
    threeSmallFrame.backgroundColor = [UIColor whiteColor];
  
    [oneView addSubview:threeSmallFrame];
    
    
    
    UILabel *PeiSongZF = [Toos setUpWithUserLabel:@"优惠券" CGRect:CGRectMake( kWidthChange(20), 0, kScreenWidth - kWidthChange(40), kWidthChange(60) ) color:[UIColor clearColor] textColor:newColor(51, 52, 51, 1) textSize:kWidthChange(17)];
    [threeSmallFrame addSubview:PeiSongZF];
    
    UILabel *KuaiDiZF = [Toos setUpWithUserLabel:@"选择优惠券" CGRect:CGRectMake( kWidthChange(20), 0, kScreenWidth - kWidthChange(40) -kWidthChange(10) - kWidthChange(10), kWidthChange(60) ) color:[UIColor clearColor] textColor:newColor(94, 105, 111, 1) textSize:kWidthChange(15)];
    [threeSmallFrame addSubview:KuaiDiZF];
    KuaiDiZF.textAlignment = NSTextAlignmentRight;
    
    [KuaiDiZF addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickLingYouHui:)]];
    UIImageView *KuaiDiImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"box21"]];
    KuaiDiImage.frame = CGRectMake(CGRectGetMaxX(KuaiDiZF.frame) + kWidthChange(15),  kWidthChange(30) - kWidthChange(7.5) , kWidthChange(10), kWidthChange(15));
    
    [threeSmallFrame addSubview:KuaiDiImage];
    
    
    CGRect oneFrame = oneView.frame;
    oneFrame.size.height = CGRectGetMaxY(threeSmallFrame.frame);
    oneView.frame = oneFrame;
    
    
    
    UIView *twoView = [[UIView alloc]initWithFrame:CGRectMake(kWidthChange(0), CGRectGetMaxY(oneView.frame) + kWidthChange(15), kScreenWidth , kWidthChange(120))];
    twoView.backgroundColor = [UIColor whiteColor];
    [self.bigScrollerView addSubview:twoView];
    
   
    
    UILabel *BeiZhuLabel = [Toos setUpWithUserLabel:@"订单备注" CGRect:CGRectMake( kWidthChange(20), 0, kScreenWidth - kWidthChange(40), kWidthChange(50) ) color:[UIColor clearColor] textColor:newColor(51, 52, 51, 1) textSize:kWidthChange(17)];
    [twoView addSubview:BeiZhuLabel];
    
    
    
    
    self.BeiZhuTF = [[UITextView alloc]initWithFrame:CGRectMake(kWidthChange(20), kWidthChange(50), kScreenWidth - kWidthChange(40), kWidthChange(70) )];
    
    self.BeiZhuTF.backgroundColor = [UIColor clearColor];
    self.BeiZhuTF.textColor = newColor(51, 51, 51, 1);
    
    self.BeiZhuTF.font = [UIFont systemFontOfSize:kWidthChange(15)];
    [twoView addSubview:self.BeiZhuTF];
    UILabel *messageLabel1 = [Toos setUpWithUserLabel:@"请输入订单备注" CGRect:CGRectMake(kWidthChange(0), kWidthChange(0), kScreenWidth - 30, kWidthChange(20)) color:[UIColor clearColor] textColor:newColor(175, 185, 187, 1) textSize:kWidthChange(16)];
    [ self.BeiZhuTF addSubview:messageLabel1];
    [self.BeiZhuTF setValue:messageLabel1 forKeyPath:@"_placeholderLabel"];
    
    UIView *threeView = [[UIView alloc]initWithFrame:CGRectMake(kWidthChange(0), CGRectGetMaxY(twoView.frame) + kWidthChange(15), kScreenWidth , kWidthChange(100))];
    threeView.backgroundColor = [UIColor whiteColor];
    [self.bigScrollerView addSubview:threeView];
//    threeView.layer.masksToBounds = YES;
//    threeView.layer.cornerRadius = 5;
    
    
    
    for (int i = 0; i < 2; i++) {
        UILabel *YunFeiLabel = [Toos setUpWithUserLabel:@"运费险" CGRect:CGRectMake( kWidthChange(20), i * kWidthChange(50),kScreenWidth - kWidthChange(40), kWidthChange(50) ) color:[UIColor clearColor] textColor:newColor(39, 40, 42, 1) textSize:kWidthChange(15)];
        [threeView addSubview:YunFeiLabel];
        
      
       
        UILabel *YunFeithreeLabel = [Toos setUpWithUserLabel:@"¥ 89.24" CGRect:CGRectMake( kWidthChange(20), i * kWidthChange(50), kScreenWidth - kWidthChange(40) , kWidthChange(50) ) color:[UIColor clearColor] textColor:newColor(239, 130, 57, 1) textSize:kWidthChange(15)];
        [threeView addSubview:YunFeithreeLabel];
        YunFeithreeLabel.textAlignment = NSTextAlignmentRight;
        
      
      
        
    }
    
    
    
    
    
   
    
    
   
    
    
    self.bigScrollerView.contentSize = CGSizeMake(0, CGRectGetMaxY(threeView.frame));
    
//    NSArray *downArray = @[@{@"title":@"商品数量",@"message":[NSString stringWithFormat:@"共%@件",tempDic[@"count"]]},@{@"title":@"商品价格",@"message":[NSString stringWithFormat:@"¥ %@",tempDic[@"pay_price"]]}];
//
//
//    for (int i = 0; i < 2; i++) {
//
//        UILabel *oneLabel = [Toos setUpWithUserLabel:[downArray objectAtIndex:i][@"title"] CGRect:CGRectMake(kWidthChange(15), i * kWidthChange(50), kScreenWidth - kWidthChange(60), kWidthChange(50)) color:[UIColor clearColor] textColor:newColor(133, 141, 150, 1) textSize:kWidthChange(15)];
//        [fourView addSubview:oneLabel];
//        UILabel *twoLabel = [Toos setUpWithUserLabel:[downArray objectAtIndex:i][@"message"] CGRect:CGRectMake(kWidthChange(15), i * kWidthChange(50), kScreenWidth - kWidthChange(60), kWidthChange(50)) color:[UIColor clearColor] textColor:newColor(133, 141, 150, 1) textSize:kWidthChange(15)];
//        [fourView addSubview:twoLabel];
//        twoLabel.textAlignment = NSTextAlignmentRight;
//        if (i == 0) {
//            twoLabel.textColor = newColor(154, 162, 172, 1);
//            twoLabel.font = [UIFont systemFontOfSize:kWidthChange(13)];
//
//
//        }else if (i == 1){
//            twoLabel.textColor = newColor(97, 115, 156, 1);
//            twoLabel.font = [UIFont systemFontOfSize:kWidthChange(13)];
//
//        }
//    }
//
    UIView *downView = [[UIView alloc]initWithFrame:CGRectMake(0, kScreenHeight - downH - kWidthChange(70) - kTopHeight, kScreenWidth, kWidthChange(70))];
    downView.backgroundColor = newColor(63, 64, 65, 1);
    [self.view addSubview:downView];
    
    
    
    
    
    self.moneyLabel = [Toos setUpWithUserLabel:[NSString stringWithFormat:@"合计：¥%.2f",[tempDic[@"pay_price"]floatValue]] CGRect:CGRectMake( kWidthChange(15),0 , kScreenWidth - kWidthChange(61), kWidthChange(70)) color:[UIColor clearColor] textColor:newColor(31, 46, 125, 1) textSize:kWidthChange(20)];
    
    [downView addSubview: self.moneyLabel];
    
    self.moneyLabel.attributedText = [Toos setUpWithtext:[NSString stringWithFormat:@"合计：¥%.2f",[tempDic[@"pay_price"]floatValue]] color:newColor(133, 141, 150, 1) color1:newColor(245, 142, 35, 1) font:kWidthChange(16) font1:kWidthChange(20) length:3 length1:[[NSString stringWithFormat:@"¥%.2f",[tempDic[@"pay_price"]floatValue]]length]];
    
    UIButton *bayBT = [UIButton buttonWithType:UIButtonTypeCustom];
    bayBT.frame = CGRectMake(kScreenWidth - kWidthChange(15) - kWidthChange(100), kWidthChange(15),  kWidthChange(100), kWidthChange(40));
    bayBT.backgroundColor = newColor(231, 20, 51, 1);
    bayBT.layer.masksToBounds = YES;
    bayBT.layer.cornerRadius = kWidthChange(20);
    [bayBT setTitle:@"提交订单" forState:UIControlStateNormal];
    [bayBT setTitleColor:newColor(255, 255, 255, 1) forState:UIControlStateNormal];
    bayBT.titleLabel.font = [UIFont systemFontOfSize:kWidthChange(15)];
    [downView addSubview:bayBT];
    [bayBT addTarget:self action:@selector(clickBayBT:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    
}

-(void)clickYunFei:(UITapGestureRecognizer *)sender {
    UIImageView *imageView = (UIImageView *)sender.view;
    
    
    
    float DHMoney = 0.00;
   
    
    
    if (self.isYunFei == NO) {
        
        
        self.moneyLabel.attributedText =   [Toos setUpWithtext:[NSString stringWithFormat:@"合计：¥%.2f",[self.tempDic[@"pay_price"]floatValue] + [self.tempDic[@"freight_price"]floatValue] -DHMoney ] color:newColor(133, 141, 150, 1) color1:newColor(31, 46, 125, 1) font:kWidthChange(16) font1:kWidthChange(20) length:3 length1:[[NSString stringWithFormat:@"¥%.2f",[self.tempDic[@"pay_price"]floatValue] + [self.tempDic[@"freight_price"]floatValue]-DHMoney]length]];
        
        
        
        
        
        imageView.image =   [UIImage imageNamed:@"icon_4cart_radio_s"];
        
        self.isYunFei = YES;
    }else if (self.isYunFei == YES){
        
        
        self.moneyLabel.attributedText =   [Toos setUpWithtext:[NSString stringWithFormat:@"合计：¥%.2f",[self.tempDic[@"pay_price"]floatValue] - DHMoney ] color:newColor(133, 141, 150, 1) color1:newColor(31, 46, 125, 1) font:kWidthChange(16) font1:kWidthChange(20) length:3 length1:[[NSString stringWithFormat:@"¥%.2f",[self.tempDic[@"pay_price"]floatValue] - DHMoney]length]];
        
        
        imageView.image =  [UIImage imageNamed:@"icon_4cart_radio_n"];
        self.isYunFei = NO;
    }
    
    
    
   
    
}


#pragma mark--查看
-(void)ChaKanBT:(UIButton *)sender {
    if (self.SPView) {
        self.SPView.hidden = NO;
    }else {
        self.SPView = [[DDSPView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
        self.SPView.hidden = NO;
        [[UIApplication sharedApplication].keyWindow addSubview:self.SPView];
        
        self.SPView.dataArray = self.tempDic[@"product"];
        
    }
    
    
}

#pragma mark--使用优惠
-(void)clickLingYouHui:(UITapGestureRecognizer *)sender {
    if (self.XZYHView) {
        self.XZYHView.hidden = NO;
    }else {
        self.XZYHView = [[XuanZeYHView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
        [[UIApplication sharedApplication].keyWindow addSubview:self.XZYHView];
        
        
    }
    
}

-(void)clickBayBT:(UIButton *)sender {
    if ([Toos isBlank:self.address_Id]) {
        [Toos setUpWithMBP:@"请选择收货地址" UIView:self.view];
        return;
    }
    
   
    
    NSMutableDictionary *tempDic = [NSMutableDictionary dictionaryWithCapacity:1];
    [tempDic setObject:[UserModel shared].uid forKey:@"uid"];
//    if ([Toos isNotBlank:self.numStr]) {
//        [tempDic setObject:@"1" forKey:@"data_type"];
//        [tempDic setObject:self.numStr forKey:@"num"];
//        [tempDic setObject:self.product_id forKey:@"product_id"];
//
//        if ([Toos isNotBlank:self.GuiGeDic]) {
//            [tempDic setObject:self.GuiGeDic[@"id"] forKey:@"s_id"];
//        }
//
//
//    }else {
//        [tempDic setObject:@"2" forKey:@"data_type"];
//
//        //[tempDic setObject:self.SPID forKey:@"product_id"];
//        [tempDic setObject:self.product_id forKey:@"cart_id"];
//    }
    [tempDic setObject:self.address_Id forKey:@"address_id"];
    
    if (self.isYunFei == YES) {
        [tempDic setObject:@"1" forKey:@"freight_type"];
    }else {
        [tempDic setObject:@"2" forKey:@"freight_type"];
        
    }
    
    if (self.BeiZhuTF.text.length != 0) {
        [tempDic setObject:self.BeiZhuTF.text forKey:@"remark"];
    }
   
    
    
    [Toos dataWithSessionurl:@"/app/mall/send_order" body:tempDic view:self.view token:@"" Block:^(id tempData) {
        if ([tempData[@"code"]intValue] == 200) {
//            PayDDViewController *payDD = [[PayDDViewController alloc]init];
//            payDD.tempDic = tempData[@"data"];
//            payDD.timeStr = @"900";
//            [self.navigationController pushViewController:payDD animated:YES];
        }else {
            [Toos setUpWithMBP:tempData[@"msg"] UIView:self.view];
            
        }
    } failBlock:^(id tempData) {
        
    }];
    
    
}
#pragma mark--选择地址
-(void)clickAddressView:(UITapGestureRecognizer *)sender {
    
//    self.hidesBottomBarWhenPushed = NO;
//    SHDZViewController *SHDZ = [[SHDZViewController alloc]init];
//    [self.navigationController pushViewController:SHDZ animated:YES];
//    __weak typeof(self)weakSelf = self;
//    SHDZ.ClickBlock = ^(NSDictionary * _Nonnull tempDic) {
//
//        weakSelf.nameLabel.text = [NSString stringWithFormat:@"%@   %@",tempDic[@"name"],[tempDic[@"mobile"]stringByReplacingCharactersInRange:NSMakeRange(3, 4) withString:@"****"]];
//        weakSelf.AddressLabel.hidden = NO;
//        if ([tempDic[@"default"]intValue] == 1) {
//            weakSelf.MRLabel.hidden = NO;
//
//            CGRect addressFrame = weakSelf.AddressLabel.frame;
//            addressFrame.origin.x = kWidthChange(10) + CGRectGetMaxX(self.MRLabel.frame);
//            weakSelf.AddressLabel.frame = addressFrame;
//        }else {
//            weakSelf.MRLabel.hidden = YES;
//            CGRect addressFrame = weakSelf.AddressLabel.frame;
//            addressFrame.origin.x = kWidthChange(10);
//            weakSelf.AddressLabel.frame = addressFrame;
//
//
//        }
//        weakSelf.address_Id = [NSString stringWithFormat:@"%@",tempDic[@"id"]];
//
//        weakSelf.AddressLabel.text = [NSString stringWithFormat:@"%@%@",tempDic[@"region"],tempDic[@"address"]];
//    };
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
