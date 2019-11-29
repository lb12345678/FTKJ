//
//  MyYouHuiViewCell.m
//  FTKJ
//
//  Created by ios on 2019/11/26.
//  Copyright © 2019年 ios. All rights reserved.
//

#import "MyYouHuiViewCell.h"

@implementation MyYouHuiViewCell
-(UIImageView *)BigView {
    if (_BigView == nil) {
        self.BigView = [[UIImageView alloc]initWithFrame:CGRectMake(12, 0, kScreenWidth - 24, kWidthChange(94))];
        //self.BigView.backgroundColor = [UIColor whiteColor];
        self.BigView.image = [UIImage imageNamed:@"bg7"];
    }
    return _BigView;
}


-(UILabel *)moneyLabel {
    if (_moneyLabel == nil) {
        self.moneyLabel = [Toos setUpWithUserLabel:@"¥ 100" CGRect:CGRectMake(12, kWidthChange(25), kWidthChange(140), kWidthChange(25)) color:[UIColor clearColor] textColor:newColor(250, 120, 42, 1) textSize:kWidthChange(25)];
        self.moneyLabel.adjustsFontSizeToFitWidth = YES;
        self.moneyLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _moneyLabel;
    
}

-(UILabel *)YongLabel {
    if (_YongLabel == nil) {
        self.YongLabel = [Toos setUpWithUserLabel:@"满500" CGRect:CGRectMake(12, CGRectGetMaxY(self.moneyLabel.frame), kWidthChange(140), 30) color:[UIColor clearColor] textColor:newColor(130, 131, 132, 1) textSize:kWidthChange(15)];
        self.YongLabel.adjustsFontSizeToFitWidth = YES;
         self.YongLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _YongLabel;
}

-(UILabel *)messageLabel {
    
    if (_messageLabel == nil) {
        self.messageLabel = [Toos setUpWithUserLabel:@"【全场通用券】" CGRect:CGRectMake(kWidthChange(140), kWidthChange(20), kScreenWidth - 24 - 12 - kWidthChange(140), kWidthChange(27)) color:[UIColor clearColor] textColor:newColor(35, 37, 38, 1) textSize:kWidthChange(16)];
    }
    return _messageLabel;
}

-(UILabel *)timeLabel {
    if (_timeLabel == nil) {
        self.timeLabel = [Toos setUpWithUserLabel:@"2019" CGRect:CGRectMake(kWidthChange(140), CGRectGetMaxY(self.messageLabel.frame), kScreenWidth - 24 - 12 - kWidthChange(140), kWidthChange(27)) color:[UIColor clearColor] textColor:newColor(168, 168, 168, 1) textSize:kWidthChange(15)];
    }
    return _timeLabel;
}

//-(UILabel *)numberLabel {
//    if (_numberLabel == nil) {
//        self.numberLabel = [Toos setUpWithUserLabel:@"" CGRect:CGRectMake(CGRectGetMaxX(self.smallImage.frame) + 12, CGRectGetMaxY(self.timeLabel.frame), kScreenWidth - 24 - 12 - CGRectGetMaxX(self.smallImage.frame), 80 / 4) color:[UIColor clearColor] textColor:newColor(168, 168, 168, 1) textSize:kWidthChange(12)];
//    }
//    return _numberLabel;
//}
//
//
//
//-(UILabel *)jiFenLabel {
//
//    if (_jiFenLabel == nil) {
//        self.jiFenLabel = [Toos setUpWithUserLabel:@"" CGRect:CGRectMake(CGRectGetMaxX(self.smallImage.frame) + 12, CGRectGetMaxY(self.timeLabel.frame), kScreenWidth - 24 - 12 - CGRectGetMaxX(self.smallImage.frame), 80 / 3) color:[UIColor clearColor] textColor:newColor(245, 61, 5, 1) textSize:kWidthChange(12)];
//    }
//    return _jiFenLabel;
//
//}

-(UILabel *)DuiHuanLabel {
    if (_DuiHuanLabel == nil) {
        self.DuiHuanLabel = [Toos setUpWithUserLabel:@"立即\n使用" CGRect:CGRectMake(kScreenWidth - 12 - kWidthChange(68), 0,kWidthChange(68), kWidthChange(94)) color:[UIColor clearColor] textColor:newColor(255, 255, 255, 1) textSize:kWidthChange(15)];
        
        self.DuiHuanLabel.numberOfLines = 0;
     
        self.DuiHuanLabel.textAlignment = NSTextAlignmentCenter;
        self.DuiHuanLabel.font = [UIFont systemFontOfSize:kWidthChange(17) weight:UIFontWeightBlack];
        //        self.DuiHuanBT.layer.masksToBounds = YES;
        //        self.DuiHuanBT.layer.cornerRadius = 25 / 2;
       
        //        self.DuiHuanBT.layer.borderWidth = 1;
    }
    return _DuiHuanLabel;
    
    
}



//-(UIImageView *)stateImage {
//    if (_stateImage == nil) {
//        self.stateImage = [[UIImageView alloc]initWithFrame:CGRectMake(kScreenWidth - 12 - 10 - kWidthChange(42), 40 - kWidthChange(21), kWidthChange(42), kWidthChange(42))];
//        self.stateImage.contentMode = UIViewContentModeCenter;
//        self.stateImage.hidden = YES;
//    }
//    return _stateImage;
//}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.BigView];
        //[self.contentView addSubview:self.smallImage];
        [self.contentView addSubview:self.moneyLabel];
        [self.contentView addSubview:self.YongLabel];
        [self.contentView addSubview:self.messageLabel];
        [self.contentView addSubview:self.timeLabel];
        //[self.contentView addSubview:self.numberLabel];
        //[self.contentView addSubview:self.jiFenLabel];
        [self.contentView addSubview:self.DuiHuanLabel];
        [self.contentView addSubview:self.stateImage];
    }
    return self;
}

-(void)setUpWithType:(NSDictionary *)newType  isFrom:(NSString *)isType{
    
    
//    [self.DuiHuanBT addTarget:self action:@selector(clickDuiHuan:) forControlEvents:UIControlEventTouchUpInside];
    self.myDic = newType;
    
    self.moneyLabel.text = [NSString stringWithFormat:@"￥%@",newType[@"money"]];
    
    
    self.YongLabel.text = [NSString stringWithFormat:@"满%@元可用",newType[@"max_money"]];
    
    self.messageLabel.text = [NSString stringWithFormat:@"%@",newType[@"coupon_name"]];
    
    self.timeLabel.text = [NSString stringWithFormat:@"%@",[Toos setUpWithTime:newType[@"end_time"] foementData:@"YYYY-MM-dd"]];
    
    
    self.isFrom = isType;
    if ([isType isEqualToString:@"1"]) {
        self.stateImage.hidden = YES;
        
        
        //self.jiFenLabel.text = [NSString stringWithFormat:@"%@积分",newType[@"score"]];
        
        if ([newType[@"status"]intValue] == 1) {
//            [self.DuiHuanBT setTitleColor:newColor(245, 61, 5, 1) forState:UIControlStateNormal];
//            self.DuiHuanBT.layer.borderColor = newColor(245, 61, 5, 1).CGColor;
//            [self.DuiHuanBT setTitle:@"立即兑换" forState:UIControlStateNormal];
//            self.DuiHuanBT.userInteractionEnabled = YES;
            
        }
        else {
//            [self.DuiHuanBT setTitleColor:newColor(153, 153, 153, 1) forState:UIControlStateNormal];
//            self.DuiHuanBT.layer.borderColor = newColor(153, 153, 153, 1).CGColor;
//            [self.DuiHuanBT setTitle:@"积分不足" forState:UIControlStateNormal];
//
//            self.DuiHuanBT.userInteractionEnabled = NO;
        }
    }else if([isType isEqualToString:@"2"] || [isType isEqualToString:@"4"]){
        
        //self.numberLabel.text = [NSString stringWithFormat:@"数量：%@张",newType[@"num"]];;
        
        if ([newType[@"status"]intValue] == 0) {
            
            self.stateImage.hidden = YES;
//            self.DuiHuanBT.hidden = NO;
//            [self.DuiHuanBT setTitleColor:newColor(245, 61, 5, 1) forState:UIControlStateNormal];
//            self.DuiHuanBT.layer.borderColor = newColor(245, 61, 5, 1).CGColor;
//            [self.DuiHuanBT setTitle:@"去使用" forState:UIControlStateNormal];
//            self.DuiHuanBT.userInteractionEnabled = YES;
            //[self.smallImage setImage:[UIImage imageNamed:@"优惠券彩色1"]];
            
//            if ([isType isEqualToString:@"2"]) {
//                self.DuiHuanBT.hidden = NO;
//            }else {
//
//                self.DuiHuanBT.hidden = YES;
//            }
            
        }
        else {
            self.stateImage.hidden = NO;
//            self.DuiHuanBT.hidden = YES;
            //[self.smallImage setImage:[UIImage imageNamed:@"灰色-2"]];
            
            [self.stateImage setImage:[UIImage imageNamed:@"已使用"]];
        }
    }else {
        
        if ([newType[@"ydh"]intValue] == 1) {
            self.stateImage.hidden = YES;
//            self.DuiHuanBT.hidden = NO;
//            [self.DuiHuanBT setTitleColor:newColor(153, 153, 153, 1) forState:UIControlStateNormal];
//            self.DuiHuanBT.layer.borderColor = newColor(153, 153, 153, 1).CGColor;
//            self.DuiHuanBT.userInteractionEnabled = NO;
//            [self.DuiHuanBT setTitle:@"已领取" forState:UIControlStateNormal];
        }else {
            
            
            
            self.stateImage.hidden = YES;
//            self.DuiHuanBT.hidden = NO;
//            [self.DuiHuanBT setTitleColor:newColor(245, 61, 5, 1) forState:UIControlStateNormal];
//            self.DuiHuanBT.layer.borderColor = newColor(245, 61, 5, 1).CGColor;
//            self.DuiHuanBT.userInteractionEnabled = YES;
//            [self.DuiHuanBT setTitle:@"马上领劵" forState:UIControlStateNormal];
            
        }
        
        
    }
    
    
    
    
    
}

#pragma mark---立即兑换
-(void)clickDuiHuan:(UIButton *)sender {
    
    
    if ([self.isFrom isEqualToString:@"1"]) {
        
        
        NSDictionary *newDic = @{@"token":[Toos setUpWithObjectForKey:@"token"],@"uid":[UserModel shared].uid,@"coupon_id":self.myDic[@"id"]};
        
        [self setUpWithNewDic:newDic urlStr:@"app/coupon/coupon_dh" type:self.isFrom];
        
        
    }else if ([self.isFrom isEqualToString:@"3"]) {
        
        
        NSDictionary *newDic = @{@"token":[Toos setUpWithObjectForKey:@"token"],@"uid":[UserModel shared].uid,@"coupon_id":self.myDic[@"id"]};
        
        [self setUpWithNewDic:newDic urlStr:@"app/coupon/coupon_lq" type:self.isFrom];
        
        
        
        
        
        
    }else {
        
        
        if (self.ClickYouHuiQuan) {
            self.ClickYouHuiQuan(self.myDic);
            
        }
        
        
        
    }
    
    
    
    
    
    
}

-(void)setUpWithNewDic:(NSDictionary *)newDic urlStr:(NSString *)urlStr type:(NSString *)istype{
    
    [Toos dataWithSessionurl:urlStr body:newDic view:self.viewController.view token:@"" Block:^(id tempData) {
        
        if ([tempData[@"status"]intValue] == 1) {
            
            
            if ([istype isEqualToString:@"1"]) {
                if (self.ClickDuiHuan) {
                    self.ClickDuiHuan(@"1");
                }
//                if (self.duiHuanView == nil) {
//                    self.duiHuanView = [[SussessDuiHuanView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
//                    self.duiHuanView.hidden = NO;
//                    [[UIApplication sharedApplication].keyWindow addSubview:self.duiHuanView];
//                }else {
//                    self.duiHuanView.hidden = NO;
//
//
//                }
                __weak typeof(self)weakSelf = self;
                self.ClickDuiHuan = ^(NSString *type) {
                    weakSelf.viewController.hidesBottomBarWhenPushed = YES;
//                    MyYouHuiViewController *youHui = [[MyYouHuiViewController alloc]init];
//                    [weakSelf.viewController.navigationController pushViewController:youHui animated:YES];
                };
                
            }else {
                [[NSNotificationCenter defaultCenter]postNotificationName:@"refresh" object:nil];
                [self.viewController.navigationController popViewControllerAnimated:YES];
                
            }
            
            
            
        }else {
            [Toos setUpWithMBP:tempData[@"msg"] UIView:self.viewController.view];
        }
        
        
    } failBlock:^(id tempData) {
        
    }];
    
    
    
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
