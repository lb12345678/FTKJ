//
//  MDLBViewCell.m
//  FTKJ
//
//  Created by ios on 2019/11/20.
//  Copyright © 2019年 ios. All rights reserved.
//

#import "MDLBViewCell.h"

@implementation MDLBViewCell
-(UIImageView *)bigImage {
    if (_bigImage == nil) {
        self.bigImage = [[UIImageView alloc]initWithFrame:CGRectMake(kWidthChange(20), kWidthChange(20), kWidthChange(104), kWidthChange(86))];
        self.bigImage.backgroundColor = [UIColor redColor];
        self.bigImage.layer.masksToBounds = YES;
        self.bigImage.layer.cornerRadius = 5;
    }
    return _bigImage;
    
    
}

-(UILabel *)nameLabel {
    if (_nameLabel == nil) {
        self.nameLabel = [Toos setUpWithUserLabel:@"123456789" CGRect:CGRectMake(CGRectGetMaxX(self.bigImage.frame) + kWidthChange(20),kWidthChange(20) , kScreenWidth - CGRectGetMaxX(self.bigImage.frame) - kWidthChange(40), kWidthChange(20)) color:[UIColor clearColor] textColor:newColor(0, 19, 30, 1) textSize:kWidthChange(16)];
        self.nameLabel.numberOfLines = 0;
    }
    
    return _nameLabel;
}


-(UILabel *)ZTLabel {
    if (_ZTLabel == nil) {
        self.ZTLabel = [Toos setUpWithUserLabel:@"营业中" CGRect:CGRectMake(CGRectGetMaxX(self.bigImage.frame) + kWidthChange(20),CGRectGetMaxY(self.nameLabel.frame)+kWidthChange(10) ,kWidthChange(58), kWidthChange(20)) color:[UIColor clearColor] textColor:newColor(250, 140, 55, 1) textSize:kWidthChange(14)];
        self.ZTLabel.numberOfLines = 0;
        self.ZTLabel.textAlignment = NSTextAlignmentCenter;
        self.ZTLabel.layer.masksToBounds = YES;
        self.ZTLabel.layer.cornerRadius = kWidthChange(10);
        self.ZTLabel.layer.borderWidth = 1;
        self.ZTLabel.layer.borderColor = newColor(250, 140, 55, 1).CGColor;
    }
    
    return _ZTLabel;
    
    
}


-(UILabel *)JuLiLabel {
    if (_JuLiLabel == nil) {
        self.JuLiLabel = [Toos setUpWithUserLabel:@"¥ 129" CGRect:CGRectMake(CGRectGetMaxX(self.ZTLabel.frame) + kWidthChange(15),CGRectGetMaxY(self.nameLabel.frame)+kWidthChange(10) , kScreenWidth - CGRectGetMaxX(self.bigImage.frame) - kWidthChange(25), kWidthChange(20)) color:[UIColor clearColor] textColor:newColor(135, 142, 152, 1) textSize:kWidthChange(15)];
    }
    
    return _JuLiLabel;
    
    
    
}
-(UILabel *)AddressLabel {
    if (_AddressLabel == nil) {
        self.AddressLabel = [Toos setUpWithUserLabel:@"销量 1572" CGRect:CGRectMake(CGRectGetMaxX(self.bigImage.frame) + kWidthChange(20),CGRectGetMaxY(self.JuLiLabel.frame)+ kWidthChange(10) , kScreenWidth - CGRectGetMaxX(self.bigImage.frame) - kWidthChange(25), kWidthChange(24)) color:[UIColor clearColor] textColor:newColor(135, 142, 152, 1) textSize:kWidthChange(15)];
    }
    
    return _AddressLabel;
    
    
}

-(UIButton *)shareBT {
    
    if (_shareBT == nil) {
        self.shareBT = [UIButton buttonWithType:UIButtonTypeCustom];
        self.shareBT.frame = CGRectMake(kScreenWidth - kWidthChange(20) - kWidthChange(84), kWidthChange(20), kWidthChange(84), kWidthChange(30));
//        self.shareBT.backgroundColor = newColor(233, 20, 50, 1);
//        self.shareBT.layer.masksToBounds = YES;
//        self.shareBT.layer.cornerRadius = kWidthChange(15);
//        [self.shareBT setTitle:@"立即预约" forState:UIControlStateNormal];
//        [self.shareBT setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//        self.shareBT.titleLabel.font = [UIFont systemFontOfSize:kWidthChange(14)];
        [self.shareBT setImage:[UIImage imageNamed:@"box30"] forState:UIControlStateNormal];
    }
    
    return _shareBT;
}

-(UIImageView *)rightImage {
    if (_rightImage == nil) {
        self.rightImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"box21"]];
        self.rightImage.frame = CGRectMake(kScreenWidth - kWidthChange(20) - kWidthChange(12), CGRectGetMaxY(self.shareBT.frame) + kWidthChange(50) / 2 - kWidthChange(10), kWidthChange(12), kWidthChange(20));
    }
    
    return _rightImage;
}


-(UILabel *)lineLabel {
    if (_lineLabel == nil) {
        self.lineLabel = [Toos setUpWithUserLabel:@"" CGRect:CGRectMake( kWidthChange(20),kWidthChange(126) - 1 , kScreenWidth -  kWidthChange(40), 1) color:lineColor_gary textColor:newColor(0, 19, 30, 1) textSize:kWidthChange(16)];
        self.lineLabel.numberOfLines = 0;
    }
    
    return _lineLabel;
}


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.bigImage];
        [self.contentView addSubview:self.nameLabel];
        [self.contentView addSubview:self.ZTLabel];
        [self.contentView addSubview:self.JuLiLabel];
        [self.contentView addSubview:self.AddressLabel];
        [self.contentView addSubview:self.shareBT];
        [self.contentView addSubview:self.rightImage];
        [self.contentView addSubview:self.lineLabel];
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
