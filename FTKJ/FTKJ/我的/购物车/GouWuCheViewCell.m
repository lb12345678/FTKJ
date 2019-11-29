//
//  GouWuCheViewCell.m
//  JZGL
//
//  Created by ios on 2019/8/9.
//  Copyright © 2019年 ios. All rights reserved.
//

#import "GouWuCheViewCell.h"

@interface GouWuCheViewCell()<UITextFieldDelegate>

@end



@implementation GouWuCheViewCell

-(UIButton *)XuanZeBT {
    
    if (_XuanZeBT == nil) {
        self.XuanZeBT = [UIButton buttonWithType:UIButtonTypeCustom];
        self.XuanZeBT.frame = CGRectMake(kWidthChange(45) / 2 - kWidthChange(10), kWidthChange(130) / 2 - kWidthChange(20) / 2,  kWidthChange(20), kWidthChange(20));
        [self.XuanZeBT setImage:[UIImage imageNamed:@"box57"] forState:UIControlStateNormal];
    }
    return _XuanZeBT;
}

-(UIView *)bigView {
    if (_bigView == nil) {
        self.bigView = [[UIView alloc]initWithFrame:CGRectMake(kWidthChange(45), kWidthChange(10), kScreenWidth - kWidthChange(15) - kWidthChange(45), kWidthChange(110))];
        self.bigView.backgroundColor = [UIColor whiteColor];
        //self.bigView.layer.masksToBounds = YES;
        //self.bigView.layer.cornerRadius = 10;
    }
    
    return _bigView;
}

-(UIImageView *)bigImage {
    if (_bigImage == nil) {
        self.bigImage = [[UIImageView alloc]initWithFrame:CGRectMake(kWidthChange(0), kWidthChange(0), kWidthChange(110), kWidthChange(110))];
        self.bigImage.backgroundColor = [UIColor whiteColor];
        self.bigImage.layer.masksToBounds = YES;
        self.bigImage.layer.cornerRadius = 5;
    }
    return _bigImage;
    
    
}

-(UILabel *)nameLabel {
    if (_nameLabel == nil) {
        self.nameLabel = [Toos setUpWithUserLabel:@"杜兰特" CGRect:CGRectMake(CGRectGetMaxX(self.bigImage.frame) + kWidthChange(20),kWidthChange(0) , kScreenWidth - kWidthChange(61) - CGRectGetMaxX(self.bigImage.frame) - kWidthChange(25), kWidthChange(40)) color:[UIColor clearColor] textColor:newColor(72, 82, 92, 1) textSize:kWidthChange(18)];
        self.nameLabel.numberOfLines = 2;
    }
    
    return _nameLabel;
}


-(UILabel *)GuiGeLabel {
    if (_GuiGeLabel == nil) {
        self.GuiGeLabel = [Toos setUpWithUserLabel:@"科比" CGRect:CGRectMake(CGRectGetMaxX(self.bigImage.frame) + kWidthChange(20),kWidthChange(15)+CGRectGetMaxY(self.nameLabel.frame) , kScreenWidth - kWidthChange(60), kWidthChange(20)) color:[UIColor clearColor] textColor:newColor(122, 123, 124, 1) textSize:kWidthChange(15)];
    }
    
    return _GuiGeLabel;
}






-(UILabel *)moneyLabel {
    if (_moneyLabel == nil) {
        self.moneyLabel = [Toos setUpWithUserLabel:@"¥ 129" CGRect:CGRectMake(CGRectGetMaxX(self.bigImage.frame) + kWidthChange(20),CGRectGetMaxY(self.bigImage.frame) - kWidthChange(20) , kScreenWidth - CGRectGetMaxX(self.bigImage.frame) - kWidthChange(25), kWidthChange(25)) color:[UIColor clearColor] textColor:newColor(231, 23, 50, 1) textSize:kWidthChange(22)];
    }
    
    return _moneyLabel;
    
    
    
}

-(UIButton *)JianBT {
    
    if (_JianBT == nil) {
        
   
    
    
    self.JianBT = [UIButton buttonWithType:UIButtonTypeCustom];
    self.JianBT.frame = CGRectMake(kWidthChange(220),  CGRectGetMaxY(self.bigImage.frame) - kWidthChange(25), kWidthChange(25), kWidthChange(25));
    [self.JianBT setImage:[UIImage imageNamed:@"box45"] forState:UIControlStateNormal];
    
//    [self.JianBT addTarget:self action:@selector(clickJian:) forControlEvents:UIControlEventTouchUpInside];
   
    }
    return _JianBT;
}



-(UITextField *)XiaoLabel {
    if (_XiaoLabel == nil) {
        
        self.XiaoLabel = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.JianBT.frame),   CGRectGetMaxY(self.bigImage.frame) - kWidthChange(25), kWidthChange(45), kWidthChange(25))];
        self.XiaoLabel.textColor = newColor(0, 0, 0, 1);
        self.XiaoLabel.textAlignment = NSTextAlignmentCenter;
        self.XiaoLabel.font = [UIFont systemFontOfSize:kWidthChange(15)];
        
        self.XiaoLabel.delegate = self;
        
        self.XiaoLabel.keyboardType = UIKeyboardTypePhonePad;
        
     
    }
    
    return _XiaoLabel;
    
    
}

-(UIButton *)addBT {
    
    if (_addBT == nil) {
        self.addBT = [UIButton buttonWithType:UIButtonTypeCustom];
        self.addBT.frame = CGRectMake(CGRectGetMaxX(self.XiaoLabel.frame),   CGRectGetMaxY(self.bigImage.frame) - kWidthChange(25), kWidthChange(25), kWidthChange(25));
        [self.addBT setImage:[UIImage imageNamed:@"box46"] forState:UIControlStateNormal];
        
    }
    
    return _addBT;
}

//-(UIButton *)deleteBT {
//    if (_deleteBT == nil) {
//        self.deleteBT = [UIButton buttonWithType:UIButtonTypeCustom];
//        self.deleteBT.frame = CGRectMake(kScreenWidth - kWidthChange(61) - kWidthChange(20) - kWidthChange(30) , kWidthChange(43) / 2 - kWidthChange(30) / 2 + CGRectGetMaxY(self.lineLabel.frame), kWidthChange(30), kWidthChange(30));
//        [self.deleteBT setImage:[UIImage imageNamed:@"icon_4cart_delete"] forState:UIControlStateNormal];
//
//    }
//
//    return _deleteBT;
//
//
//}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.XuanZeBT];
        [self.contentView addSubview:self.bigView];
         [self.bigView addSubview:self.bigImage];
         [self.bigView addSubview:self.nameLabel];
         [self.bigView addSubview:self.GuiGeLabel];
         [self.bigView addSubview:self.moneyLabel];
         [self.bigView addSubview:self.JianBT];
         [self.bigView addSubview:self.XiaoLabel];
         [self.bigView addSubview:self.addBT];
           [self.bigView addSubview:self.deleteBT];
    }
    return self;
}


-(void)setUpWithBigDic:(NSMutableDictionary *)newDic {
    self.tempDic = newDic;
    [self.bigImage sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",newDic[@"product"][@"img"]]]];
    
    if ([newDic[@"product"][@"label"]intValue] == 1) {
        self.nameLabel.attributedText = [Toos setUpWithNewAttributedString:@"icon_1home_tag_hot" name:[NSString stringWithFormat:@" %@",newDic[@"product"][@"title"]] number:0 CGRect:CGRectMake(0,kWidthChange(-2.5), kWidthChange(35), kWidthChange(15))];
    }else if ([newDic[@"product"][@"label"]intValue] == 2){
        
        self.nameLabel.attributedText = [Toos setUpWithNewAttributedString:@"icon_1home_tag_selection" name:[NSString stringWithFormat:@" %@",newDic[@"product"][@"title"]] number:0 CGRect:CGRectMake(0, kWidthChange(-2.5), kWidthChange(35), kWidthChange(15))];
        
    }else {
        
        self.nameLabel.attributedText = [Toos setUpWithNewAttributedString:@"icon_1home_tag_new" name:[NSString stringWithFormat:@" %@",newDic[@"product"][@"title"]] number:0 CGRect:CGRectMake(0, kWidthChange(-2.5), kWidthChange(35), kWidthChange(15))];
        
    }
    
    
    self.moneyLabel.attributedText = [Toos setUpWithtext:[NSString stringWithFormat:@"¥%@",newDic[@"price"]] color:newColor(61, 73, 131, 1) color1:newColor(61, 73, 131, 1) font:kWidthChange(12) font1:kWidthChange(17) length:1 length1:[[NSString stringWithFormat:@"%@",newDic[@"price"]]length]];
    self.XiaoLabel.text = [NSString stringWithFormat:@"%@",newDic[@"num"]];
    
    if ([newDic[@"click"]intValue] == 0) {
         [self.XuanZeBT setImage:[UIImage imageNamed:@"icon_4cart_CheckBox_n"] forState:UIControlStateNormal];
    }else {
        
         [self.XuanZeBT setImage:[UIImage imageNamed:@"icon_4cart_CheckBox_s"] forState:UIControlStateNormal];
        
    }
    
    
    
}


-(void)textFieldDidEndEditing:(UITextField *)textField {
    
    
    if (textField.text.length == 0) {
        return;
    }
    
    
    
    if ([textField.text intValue] == 0) {
        return;
    }
    
    [Toos dataWithSessionurl:@"/app/mall/save_cart_num" body:@{@"uid":[UserModel shared].uid,@"id":self.tempDic[@"product_id"],@"num":textField.text,@"s_id":self.tempDic[@"s_id"]} view:[UIApplication sharedApplication].keyWindow token:@"" Block:^(id tempData) {
        
        if ([tempData[@"code"]intValue] == 200) {
             [self.tempDic setObject:textField.text forKey:@"num"];
        }else {
            
            textField.text = [NSString stringWithFormat:@"%@",tempData[@"num"]];
             [self.tempDic setObject:textField.text forKey:@"num"];
            
            [Toos setUpWithMBP:tempData[@"msg"] UIView:[UIApplication sharedApplication].keyWindow];
        }
        
        
        
        
    } failBlock:^(id tempData) {
        
    }];
    
    
    
    
//
//
    
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
