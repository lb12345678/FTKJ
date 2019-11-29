//
//  CarBayViewCell.m
//  FTKJ
//
//  Created by ios on 2019/11/20.
//  Copyright © 2019年 ios. All rights reserved.
//

#import "CarBayViewCell.h"

@implementation CarBayViewCell

-(UIImageView *)bigImage {
    if (_bigImage == nil) {
        self.bigImage = [[UIImageView alloc]initWithFrame:CGRectMake(kWidthChange(20), kWidthChange(15), kWidthChange(107), kWidthChange(107))];
        self.bigImage.backgroundColor = [UIColor redColor];
        self.bigImage.layer.masksToBounds = YES;
        self.bigImage.layer.cornerRadius = 5;
    }
    return _bigImage;
    
    
}

-(UILabel *)nameLabel {
    if (_nameLabel == nil) {
        self.nameLabel = [Toos setUpWithUserLabel:@"123456789" CGRect:CGRectMake(CGRectGetMaxX(self.bigImage.frame) + kWidthChange(20),0 , kScreenWidth - CGRectGetMaxX(self.bigImage.frame) - kWidthChange(40), kWidthChange(40)) color:[UIColor clearColor] textColor:newColor(42, 43, 43, 1) textSize:kWidthChange(16)];
        self.nameLabel.numberOfLines = 0;
    }
    
    return _nameLabel;
}

-(UILabel *)moneyLabel {
    if (_moneyLabel == nil) {
        self.moneyLabel = [Toos setUpWithUserLabel:@"¥ 129" CGRect:CGRectMake(CGRectGetMaxX(self.bigImage.frame) + kWidthChange(20),kWidthChange(60) , kScreenWidth - CGRectGetMaxX(self.bigImage.frame) - kWidthChange(25), kWidthChange(20)) color:[UIColor clearColor] textColor:newColor(250, 114, 0, 1) textSize:kWidthChange(22)];
    }
    
    return _moneyLabel;
    
    
    
}
-(UILabel *)XiaoLabel {
    if (_XiaoLabel == nil) {
        self.XiaoLabel = [Toos setUpWithUserLabel:@"销量 1572" CGRect:CGRectMake(CGRectGetMaxX(self.bigImage.frame) + kWidthChange(20),kWidthChange(90) , kScreenWidth - CGRectGetMaxX(self.bigImage.frame) - kWidthChange(25), kWidthChange(17)) color:[UIColor clearColor] textColor:newColor(131, 132, 133, 1) textSize:kWidthChange(14)];
    }
    
    return _XiaoLabel;
    
    
}

-(UIButton *)shareBT {
    
    if (_shareBT == nil) {
        self.shareBT = [UIButton buttonWithType:UIButtonTypeCustom];
        self.shareBT.frame = CGRectMake(kScreenWidth - kWidthChange(20) - kWidthChange(84), kWidthChange(77), kWidthChange(84), kWidthChange(30));
        self.shareBT.backgroundColor = newColor(233, 20, 50, 1);
        self.shareBT.layer.masksToBounds = YES;
        self.shareBT.layer.cornerRadius = kWidthChange(15);
        [self.shareBT setTitle:@"立即预约" forState:UIControlStateNormal];
        [self.shareBT setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        self.shareBT.titleLabel.font = [UIFont systemFontOfSize:kWidthChange(14)];
        
    }
    
    return _shareBT;
}


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.bigImage];
        [self.contentView addSubview:self.nameLabel];
        [self.contentView addSubview:self.moneyLabel];
        [self.contentView addSubview:self.XiaoLabel];
        [self.contentView addSubview:self.shareBT];
        //[self.contentView addSubview:self.GouWuCheBT];
    }
    
    return self;
}

-(void)setUpWithNewBigDic:(NSDictionary *)newDic {
    [self.bigImage sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",newDic[@"img"]]]];
    
    if ([newDic[@"label"]intValue] == 1) {
        self.nameLabel.attributedText = [Toos setUpWithNewAttributedString:@"icon_1home_tag_hot" name:[NSString stringWithFormat:@"  %@",newDic[@"title"]] number:0 CGRect:CGRectMake(0, kWidthChange(-2.5), kWidthChange(35), kWidthChange(15))];
    }else if ([newDic[@"label"]intValue] == 2){
        
        self.nameLabel.attributedText = [Toos setUpWithNewAttributedString:@"icon_1home_tag_selection" name:[NSString stringWithFormat:@"  %@",newDic[@"title"]] number:0 CGRect:CGRectMake(0, kWidthChange(-2.5), kWidthChange(35), kWidthChange(15))];
        
    }else {
        
        self.nameLabel.attributedText = [Toos setUpWithNewAttributedString:@"icon_1home_tag_new" name:[NSString stringWithFormat:@"  %@",newDic[@"title"]] number:0 CGRect:CGRectMake(0, kWidthChange(-2.5), kWidthChange(35), kWidthChange(15))];
        
    }
    
    
    self.moneyLabel.attributedText = [Toos setUpWithtext:[NSString stringWithFormat:@"¥%@",newDic[@"price"]] color:newColor(61, 73, 131, 1) color1:newColor(61, 73, 131, 1) font:kWidthChange(12) font1:kWidthChange(17) length:1 length1:[[NSString stringWithFormat:@"%@",newDic[@"price"]]length]];
    self.XiaoLabel.text = [NSString stringWithFormat:@"销量 %@  %d%@好评",newDic[@"sales"],[newDic[@"comment_num"]intValue],@"%"];
    
    
    
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
