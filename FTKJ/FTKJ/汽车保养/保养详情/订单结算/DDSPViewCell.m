//
//  DDSPViewCell.m
//  JZGL
//
//  Created by ios on 2019/8/9.
//  Copyright © 2019年 ios. All rights reserved.
//

#import "DDSPViewCell.h"

@implementation DDSPViewCell




-(UIImageView *)bigImage {
    if (_bigImage == nil) {
        self.bigImage = [[UIImageView alloc]initWithFrame:CGRectMake(kWidthChange(45), kWidthChange(20), kWidthChange(60), kWidthChange(60))];
        self.bigImage.backgroundColor = [UIColor redColor];
    }
    return _bigImage;
    
    
}

-(UILabel *)nameLabel {
    if (_nameLabel == nil) {
        self.nameLabel = [Toos setUpWithUserLabel:@"123456789" CGRect:CGRectMake(CGRectGetMaxX(self.bigImage.frame) + kWidthChange(10),kWidthChange(20) , kScreenWidth - CGRectGetMaxX(self.bigImage.frame) - kWidthChange(55), kWidthChange(40)) color:[UIColor clearColor] textColor:newColor(72, 82, 92, 1) textSize:kWidthChange(16)];
        self.nameLabel.numberOfLines = 2;
    }
    
    return _nameLabel;
}

-(UILabel *)moneyLabel {
    if (_moneyLabel == nil) {
        self.moneyLabel = [Toos setUpWithUserLabel:@"¥ 129" CGRect:CGRectMake(CGRectGetMaxX(self.bigImage.frame) + kWidthChange(10),kWidthChange(80) - kWidthChange(20) , kScreenWidth - CGRectGetMaxX(self.bigImage.frame) - kWidthChange(25), kWidthChange(20)) color:[UIColor clearColor] textColor:newColor(6, 31, 118, 1) textSize:kWidthChange(18)];
    }
    
    return _moneyLabel;
    
    
    
}
-(UILabel *)XiaoLabel {
    if (_XiaoLabel == nil) {
        self.XiaoLabel = [Toos setUpWithUserLabel:@"" CGRect:CGRectMake(CGRectGetMaxX(self.bigImage.frame) + kWidthChange(10),kWidthChange(60) , kScreenWidth - CGRectGetMaxX(self.bigImage.frame) - kWidthChange(45), kWidthChange(20)) color:[UIColor clearColor] textColor:newColor(175, 182, 188, 1) textSize:kWidthChange(14)];
        self.XiaoLabel.textAlignment = NSTextAlignmentRight;
    }
    
    return _XiaoLabel;
    
    
}
-(UILabel *)lineLabel {
    if (_lineLabel == nil) {
        self.lineLabel = [Toos setUpWithUserLabel:@"" CGRect:CGRectMake( kWidthChange(45),CGRectGetMaxY(self.bigImage.frame) + kWidthChange(20) , kScreenWidth - kWidthChange(90), 1) color:lineColor_gary textColor:newColor(175, 182, 188, 1) textSize:kWidthChange(14)];
        
    }
    
    return _lineLabel;
    
    
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.bigImage];
        [self.contentView addSubview:self.nameLabel];
        [self.contentView addSubview:self.moneyLabel];
        [self.contentView addSubview:self.XiaoLabel];
        [self.contentView addSubview:self.lineLabel];
      
    }
    
    return self;
}

-(void)setUpWithNewDic:(NSDictionary *)tempDic {
    
    [self.bigImage sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",tempDic[@"img"]]]];
    
    if ([tempDic[@"label"]intValue] == 1) {
        self.nameLabel.attributedText = [Toos setUpWithNewAttributedString:@"icon_1home_tag_hot" name:[NSString stringWithFormat:@" %@",tempDic[@"title"]] number:0 CGRect:CGRectMake(0, kWidthChange(-2.5), kWidthChange(35), kWidthChange(15))];
    }else if ([tempDic[@"label"]intValue] == 2){
        
        self.nameLabel.attributedText = [Toos setUpWithNewAttributedString:@"icon_1home_tag_selection" name:[NSString stringWithFormat:@" %@",tempDic[@"title"]] number:0 CGRect:CGRectMake(0, kWidthChange(-2.5), kWidthChange(35), kWidthChange(15))];
        
    }else {
        
        self.nameLabel.attributedText = [Toos setUpWithNewAttributedString:@"icon_1home_tag_new" name:[NSString stringWithFormat:@" %@",tempDic[@"title"]] number:0 CGRect:CGRectMake(0, kWidthChange(-2.5), kWidthChange(35), kWidthChange(15))];
        
    }
    
    
    self.moneyLabel.attributedText = [Toos setUpWithtext:[NSString stringWithFormat:@"¥%@",tempDic[@"price"]] color:newColor(61, 73, 131, 1) color1:newColor(61, 73, 131, 1) font:kWidthChange(12) font1:kWidthChange(17) length:1 length1:[[NSString stringWithFormat:@"%@",tempDic[@"price"]]length]];
    
    
    if ([Toos isNotBlank:tempDic[@"num"]]) {
          self.XiaoLabel.text = [NSString stringWithFormat:@"数量*%@",tempDic[@"num"]];
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
