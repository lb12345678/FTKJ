//
//  MyOrderViewCell.m
//  FTKJ
//
//  Created by ios on 2019/11/25.
//  Copyright © 2019年 ios. All rights reserved.
//

#import "MyOrderViewCell.h"

@implementation MyOrderViewCell
-(UIView *)bigView {
    if (_bigView == nil) {
        self.bigView = [[UIView alloc]initWithFrame:CGRectMake(kWidthChange(10), 0, kScreenWidth - kWidthChange(20), kWidthChange(105))];
        self.bigView.backgroundColor = [UIColor whiteColor];
        self.bigView.layer.masksToBounds = YES;
        self.bigView.layer.cornerRadius = 5;
    }
    return _bigView;
    
}


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.bigView];
    }
    return self;
    
}

-(void)setUpWithOneBigView:(NSMutableDictionary *)tempDic  indexPath:(NSIndexPath *)indexPath{
    self.tempDic = tempDic;
    CGRect bigFrame = self.bigView.frame;
    if ([Toos isNotBlank:tempDic[@"product_list"]] && [tempDic[@"product_list"] isKindOfClass:[NSArray class]]) {
        
        
        
        
        
        
        
        [self.bigView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
        UILabel *DDLabel = [Toos setUpWithUserLabel:[NSString stringWithFormat:@"订单号:%@",tempDic[@"order_number"]] CGRect:CGRectMake(kWidthChange(15), 0, kScreenWidth - kWidthChange(50), kWidthChange(45)) color:[UIColor clearColor] textColor:newColor(40, 50, 72, 1) textSize:kWidthChange(14)];
        [self.bigView addSubview:DDLabel];
        
        NSString *status;
        if ([tempDic[@"pay_status"]intValue] == 0) {
            status = @"待付款";
        }else {
            
            if ([tempDic[@"order_status"]intValue] == 0) {
                status = @"待发货";
            }
            if ([tempDic[@"order_status"]intValue] == 1) {
                status = @"待收货";
            }
            if ([tempDic[@"order_status"]intValue] == 2) {
                
                if ([tempDic[@"after_status"]intValue] == 0) {
                    status = @"待评价";
                }else {
                    
                    if ([tempDic[@"after_status"]intValue] == 1) {
                        status = @"售后中";
                    }
                    if ([tempDic[@"after_status"]intValue] == 2) {
                        status = @"平台已同意";
                    }
                    if ([tempDic[@"after_status"]intValue] == 3) {
                        status = @"平台不同意";
                    }
                    if ([tempDic[@"after_status"]intValue] == 4) {
                        status = @"快递已寄出";
                    }
                    if ([tempDic[@"after_status"]intValue] == 5) {
                        status = @"平台收货已处理";
                    }
                    
                    
                    
                    
                }
                
            }else if ([tempDic[@"order_status"]intValue] == 3) {
                
                
                if ([tempDic[@"after_status"]intValue] == 0) {
                    status = @"已完成";
                }else {
                    
                    if ([tempDic[@"after_status"]intValue] == 1) {
                        status = @"售后中";
                    }
                    if ([tempDic[@"after_status"]intValue] == 2) {
                        status = @"平台已同意";
                    }
                    if ([tempDic[@"after_status"]intValue] == 3) {
                        status = @"平台不同意";
                    }
                    if ([tempDic[@"after_status"]intValue] == 4) {
                        status = @"快递已寄出";
                    }
                    if ([tempDic[@"after_status"]intValue] == 5) {
                        status = @"平台收货已处理";
                    }
                    
                }
                
                
            }
            
            
        }
        
        
        
        
        
        
        UILabel *stateLabel = [Toos setUpWithUserLabel:status CGRect:CGRectMake(kWidthChange(15), 0, kScreenWidth - kWidthChange(50), kWidthChange(45)) color:[UIColor clearColor] textColor:newColor(77, 176, 99, 1) textSize:kWidthChange(13)];
        [self.bigView addSubview:stateLabel];
        
        
        
        
        stateLabel.textAlignment = NSTextAlignmentRight;
        
        
        for (int i = 0; i < [tempDic[@"product_list"]count]; i++) {
            NSDictionary *newDic = [tempDic[@"product_list"] objectAtIndex:i];
            UIView *smallView = [[UIView alloc]initWithFrame:CGRectMake(kWidthChange(15), CGRectGetMaxY(stateLabel.frame) + i * kWidthChange(80) + i * kWidthChange(5), kScreenWidth - kWidthChange(50), kWidthChange(80))];
            smallView.backgroundColor = newColor(244, 249, 250, 1);
            smallView.layer.masksToBounds = YES;
            smallView.layer.cornerRadius = 5;
            [self.bigView addSubview:smallView];
            
            UIImageView *bigImage = [[UIImageView alloc]initWithFrame:CGRectMake(kWidthChange(15), kWidthChange(15), kWidthChange(50), kWidthChange(50))];
            [bigImage sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",newDic[@"product"][@"img"]]]];
            bigImage.backgroundColor = [UIColor whiteColor];
            [smallView addSubview:bigImage];
            //    [NSString stringWithFormat:@"%@",newDic[@""]]
            
            
            
            
            
            UILabel *nameLabel  = [Toos setUpWithUserLabel:[NSString stringWithFormat:@"%@",newDic[@"product"][@"title"]] CGRect:CGRectMake(CGRectGetMaxX(bigImage.frame) + kWidthChange(15),kWidthChange(15) , kScreenWidth - CGRectGetMaxX(bigImage.frame) - kWidthChange(80), kWidthChange(30)) color:[UIColor clearColor] textColor:newColor(97, 107, 113, 1) textSize:kWidthChange(14)];
            [smallView addSubview:nameLabel];
            
            UILabel *moneyLabel  = [Toos setUpWithUserLabel:@"¥ 129" CGRect:CGRectMake(CGRectGetMaxX(bigImage.frame) + kWidthChange(15),kWidthChange(15) + kWidthChange(30) , kScreenWidth - CGRectGetMaxX(bigImage.frame) - kWidthChange(25), kWidthChange(20)) color:[UIColor clearColor] textColor:newColor(51, 59, 76, 1) textSize:kWidthChange(16)];
            [smallView addSubview:moneyLabel];
            
            
            moneyLabel.attributedText = [Toos setUpWithtext:[NSString stringWithFormat:@"¥ %@",newDic[@"product"][@"price"]] color:newColor(51, 59, 76, 1) color1:newColor(51, 59, 76, 1) font:kWidthChange(12) font1:kWidthChange(16) length:2 length1:[newDic[@"product"][@"price"]length]];
            
            
            UILabel *XiaoLabel  = [Toos setUpWithUserLabel:[NSString stringWithFormat:@"X %@",newDic[@"num"]] CGRect:CGRectMake( kWidthChange(15),kWidthChange(45) , kScreenWidth -  kWidthChange(50), kWidthChange(20)) color:[UIColor clearColor] textColor:newColor(164, 170, 180, 1) textSize:kWidthChange(12)];
            XiaoLabel.textAlignment = NSTextAlignmentRight;
            [smallView addSubview:XiaoLabel];
            
            
        }
        
        
        
        
        UILabel *MoneyLabel = [Toos setUpWithUserLabel:@"" CGRect:CGRectMake(kWidthChange(15), CGRectGetMaxY(stateLabel.frame) + [tempDic[@"product_list"]count] * kWidthChange(80) + ([tempDic[@"product_list"]count] - 1) * kWidthChange(5) + kWidthChange(8), kScreenWidth - kWidthChange(50), kWidthChange(30)) color:[UIColor clearColor] textColor:newColor(0, 0, 34, 1) textSize:kWidthChange(19)];
        [self.bigView addSubview:MoneyLabel];
        MoneyLabel.attributedText = [Toos setUpWithtext:[NSString stringWithFormat:@"¥ %@",tempDic[@"pay_price"]] color:newColor(0, 0, 34, 1) color1:newColor(0, 0, 34, 1) font:kWidthChange(12) font1:kWidthChange(19) length:2 length1:[tempDic[@"pay_price"]length]];
        
        UILabel *numberLabel = [Toos setUpWithUserLabel: [NSString stringWithFormat:@"共 %@ 件",tempDic[@"count_num"]] CGRect:CGRectMake(kWidthChange(15), CGRectGetMaxY(MoneyLabel.frame), kScreenWidth - kWidthChange(50), kWidthChange(20)) color:[UIColor clearColor] textColor:newColor(158, 169, 179, 1) textSize:kWidthChange(12)];
        [self.bigView addSubview:numberLabel];
        
        
        [self.bigView addSubview:[self setUpWithStatus:tempDic indexPath:indexPath.section float:CGRectGetMaxY(stateLabel.frame) + [tempDic[@"product_list"]count] * kWidthChange(80) + ([tempDic[@"product_list"]count] - 1) * kWidthChange(5)]];
        
        bigFrame.size.height = kWidthChange(115) + [tempDic[@"product_list"]count] * kWidthChange(80) + ([tempDic[@"product_list"]count] - 1) * kWidthChange(5);
    }else {
        bigFrame.size.height = 0;
        
    }
    self.bigView.frame = bigFrame;
    
}

-(UIView *)setUpWithStatus:(NSDictionary *)statusDic  indexPath:(NSInteger )indexPath float:(CGFloat)yfloat{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, yfloat, kScreenWidth, kWidthChange(63))];
    view.backgroundColor = [UIColor clearColor];
    
    UIButton *ZhiFuBT = [UIButton buttonWithType:UIButtonTypeCustom];
    ZhiFuBT.frame = CGRectMake(kScreenWidth - kWidthChange(40) - kWidthChange(80), kWidthChange(60) / 2 - kWidthChange(16), kWidthChange(80), kWidthChange(32));
    [ZhiFuBT setTitle:@"继续支付" forState:UIControlStateNormal];
    [ZhiFuBT setTitleColor:newColor(76, 185, 190, 1) forState:UIControlStateNormal];
    ZhiFuBT.titleLabel.font = [UIFont systemFontOfSize:kWidthChange(15)];
    ZhiFuBT.layer.masksToBounds = YES;
    ZhiFuBT.layer.cornerRadius = kWidthChange(16);
    ZhiFuBT.layer.borderWidth = 1;
    ZhiFuBT.layer.borderColor = newColor(54, 187, 188, 1).CGColor;
    
    
    [view addSubview:ZhiFuBT];
    
    ZhiFuBT.tag = 1000 + indexPath;
    
    
    
    
    UIButton *QuXiaoBT  = [UIButton buttonWithType:UIButtonTypeCustom];
    QuXiaoBT.frame = CGRectMake(kScreenWidth - kWidthChange(40) - kWidthChange(80) - kWidthChange(10) - kWidthChange(80), kWidthChange(60) / 2 - kWidthChange(16) , kWidthChange(80), kWidthChange(32));
    [QuXiaoBT setTitle:@"取消订单" forState:UIControlStateNormal];
    [QuXiaoBT setTitleColor:newColor(182, 183, 183, 1) forState:UIControlStateNormal];
    QuXiaoBT.titleLabel.font = [UIFont systemFontOfSize:kWidthChange(15)];
    QuXiaoBT.layer.masksToBounds = YES;
    QuXiaoBT.layer.cornerRadius = kWidthChange(16);
    QuXiaoBT.layer.borderWidth = 1;
    QuXiaoBT.layer.borderColor = newColor(235, 236, 236, 1).CGColor;
    QuXiaoBT.tag = 200 + indexPath;
    [view addSubview:QuXiaoBT];
    
    [QuXiaoBT addTarget:self action:@selector(clickCanCulDD:) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton *ShouHouBT  = [UIButton buttonWithType:UIButtonTypeCustom];
    ShouHouBT.frame = CGRectMake(kScreenWidth - kWidthChange(40) - kWidthChange(80) - kWidthChange(10) - kWidthChange(80) - kWidthChange(10) - kWidthChange(80), kWidthChange(60) / 2 - kWidthChange(16) , kWidthChange(90), kWidthChange(32));
    [ShouHouBT setTitle:@"申请售后" forState:UIControlStateNormal];
    [ShouHouBT setTitleColor:newColor(182, 183, 183, 1) forState:UIControlStateNormal];
    ShouHouBT.titleLabel.font = [UIFont systemFontOfSize:kWidthChange(15)];
    ShouHouBT.layer.masksToBounds = YES;
    ShouHouBT.layer.cornerRadius = kWidthChange(16);
    ShouHouBT.layer.borderWidth = 1;
    ShouHouBT.layer.borderColor = newColor(235, 236, 236, 1).CGColor;
    ShouHouBT.tag = 200 + indexPath;
    [view addSubview:ShouHouBT];
    ShouHouBT.hidden = YES;
    [ShouHouBT addTarget:self action:@selector(clickShenQingShouHou:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    if ([statusDic[@"pay_status"] intValue] == 0) {
        [ZhiFuBT setTitle:@"继续支付" forState:UIControlStateNormal];
        
        QuXiaoBT.hidden = NO;
        
    }else if ([statusDic[@"order_status"] intValue] == 0 && [statusDic[@"pay_status"] intValue] == 1 ){
        
        [ZhiFuBT setTitleColor:newColor(116, 115, 116, 1) forState:UIControlStateNormal];
        ZhiFuBT.layer.borderColor = newColor(235, 235, 235, 1).CGColor;
        [ZhiFuBT setTitle:@"申请售后" forState:UIControlStateNormal];
        [ZhiFuBT setTitleColor:newColor(116, 115, 116, 1) forState:UIControlStateNormal];
        ZhiFuBT.hidden = NO;
        QuXiaoBT.hidden = YES;
        
    }else if ([statusDic[@"order_status"] intValue] == 1 ) {
        ShouHouBT.hidden = NO;
        [ZhiFuBT setTitle:@"确认收货" forState:UIControlStateNormal];
        
        QuXiaoBT.hidden = NO;
        
        [QuXiaoBT setTitle:@"查看物流" forState:UIControlStateNormal];
        
    }else if ([statusDic[@"order_status"] intValue] == 2 ) {
        
        
        if ([statusDic[@"after_status"]intValue] == 0) {
            [ZhiFuBT setTitle:@"去评价" forState:UIControlStateNormal];
            
            QuXiaoBT.hidden = YES;
            
            [QuXiaoBT setTitle:@"申请售后" forState:UIControlStateNormal];
        }
        
        
        
        
        if ([statusDic[@"after_status"]intValue] == 1) {
            ZhiFuBT.hidden = YES;
            QuXiaoBT.hidden = YES;
        }
        if ([statusDic[@"after_status"]intValue] == 2) {
            ZhiFuBT.hidden = YES;
            QuXiaoBT.hidden = YES;
        }
        if ([statusDic[@"after_status"]intValue] == 3) {
            ZhiFuBT.hidden = YES;
            QuXiaoBT.hidden = YES;
        }
        if ([statusDic[@"after_status"]intValue] == 4) {
            ZhiFuBT.hidden = YES;
            QuXiaoBT.hidden = YES;
        }
        if ([statusDic[@"after_status"]intValue] == 5) {
            ZhiFuBT.hidden = YES;
            QuXiaoBT.hidden = YES;
        }
        
        
        
        
        
        
        
        
    }else if ([statusDic[@"order_status"] intValue] == 3){
        
        ZhiFuBT.hidden = YES;
        QuXiaoBT.hidden = YES;
        
        
    }
    
    
    
    [ZhiFuBT addTarget:self action:@selector(clickZhiFuDD:) forControlEvents:UIControlEventTouchUpInside];
    
    return view;
    
    
}

#pragma mark---取消
-(void)clickCanCulDD:(UIButton *)sender {
    if (self.ClickBlock) {
        self.ClickBlock(sender.titleLabel.text, self.tempDic);
    }
    
    
}
#pragma mark---支付
-(void)clickZhiFuDD:(UIButton *)sender {
    
    if (self.ClickBlock) {
        self.ClickBlock(sender.titleLabel.text, self.tempDic);
    }
    
    
    
}

-(void)clickShenQingShouHou:(UIButton *)sender {
    if (self.ClickBlock) {
        self.ClickBlock(sender.titleLabel.text, self.tempDic);
    }
    
    
}


+(CGFloat)setUpWithHeightWithNewDic:(NSMutableDictionary *)newDic {
    
    
    if ([Toos isNotBlank:newDic[@"product_list"]] && [newDic[@"product_list"] isKindOfClass:[NSArray class]]) {
        return kWidthChange(115) + [newDic[@"product_list"]count] * kWidthChange(80) + ([newDic[@"product_list"]count] - 1) * kWidthChange(5);
    }
    return 0;
    
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
