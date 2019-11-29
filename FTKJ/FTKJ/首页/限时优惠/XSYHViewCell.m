//
//  XSYHViewCell.m
//  FTKJ
//
//  Created by ios on 2019/11/21.
//  Copyright © 2019年 ios. All rights reserved.
//

#import "XSYHViewCell.h"

@implementation XSYHViewCell
-(UIImageView *)bigImage {
    if (_bigImage == nil) {
        self.bigImage = [[UIImageView alloc]initWithFrame:CGRectMake(kWidthChange(20), kWidthChange(15), kWidthChange(110), kWidthChange(110))];
        self.bigImage.backgroundColor = [UIColor redColor];
        self.bigImage.layer.masksToBounds = YES;
        self.bigImage.layer.cornerRadius = 5;
    }
    return _bigImage;
    
    
}
-(UILabel *)nameLabel {
    if (_nameLabel == nil) {
        self.nameLabel = [Toos setUpWithUserLabel:@"123456789" CGRect:CGRectMake(CGRectGetMaxX(self.bigImage.frame) + kWidthChange(20),kWidthChange(15) , kScreenWidth - CGRectGetMaxX(self.bigImage.frame) - kWidthChange(40), kWidthChange(40)) color:[UIColor clearColor] textColor:newColor(50, 51, 52, 1) textSize:kWidthChange(18)];
        self.nameLabel.numberOfLines = 0;
    }
    
    return _nameLabel;
}


-(UIProgressView *)ProgressView {
    
    if (_ProgressView == nil) {
        self.ProgressView = [[UIProgressView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.bigImage.frame) + kWidthChange(20), CGRectGetMaxY(self.nameLabel.frame) + kWidthChange(22.5), kScreenWidth - CGRectGetMaxX(self.bigImage.frame) - kWidthChange(40) - kWidthChange(75), 20)];
        self.ProgressView.progress = 0.6;
        self.ProgressView.trackTintColor = newColor(235, 234, 226, 1);
          self.ProgressView.progressTintColor = newColor(250, 123, 35, 1);
        self.ProgressView.transform = CGAffineTransformMakeScale(1.0f, 5.0f);
        self.ProgressView.layer.masksToBounds = YES;
        self.ProgressView.layer.cornerRadius = 10.0f;
        
    }
    
    return _ProgressView;
}

-(UILabel *)progressLabel {
    if (_progressLabel == nil) {
        self.progressLabel = [Toos setUpWithUserLabel:@"321件" CGRect:CGRectMake(CGRectGetMaxX(self.ProgressView.frame) + kWidthChange(15),CGRectGetMaxY(self.nameLabel.frame) + kWidthChange(15) , kScreenWidth - CGRectGetMaxX(self.bigImage.frame) - kWidthChange(25), kWidthChange(20)) color:[UIColor clearColor] textColor:newColor(250, 120, 0, 1) textSize:kWidthChange(16)];
    }
    
    return _progressLabel;
    
    
    
}


-(UILabel *)moneyLabel {
    if (_moneyLabel == nil) {
        self.moneyLabel = [Toos setUpWithUserLabel:@"¥ 129" CGRect:CGRectMake(CGRectGetMaxX(self.bigImage.frame) + kWidthChange(20),CGRectGetMaxY(self.bigImage.frame) - kWidthChange(20) , kScreenWidth - CGRectGetMaxX(self.bigImage.frame) - kWidthChange(25), kWidthChange(20)) color:[UIColor clearColor] textColor:newColor(230, 0, 0, 1) textSize:kWidthChange(24)];
    }
    
    return _moneyLabel;
    
    
    
}
-(UILabel *)XiaoLabel {
    if (_XiaoLabel == nil) {
        self.XiaoLabel = [Toos setUpWithUserLabel:@"销量 1572" CGRect:CGRectMake(CGRectGetMaxX(self.bigImage.frame) + kWidthChange(10),CGRectGetMaxY(self.bigImage.frame) - kWidthChange(20) , kScreenWidth - CGRectGetMaxX(self.bigImage.frame) - kWidthChange(25), kWidthChange(20)) color:[UIColor clearColor] textColor:newColor(154, 155, 156, 1) textSize:kWidthChange(12)];
    }
    
    return _XiaoLabel;
    
    
}

-(UIButton *)shareBT {
    
    if (_shareBT == nil) {
        self.shareBT = [UIButton buttonWithType:UIButtonTypeCustom];
        self.shareBT.frame = CGRectMake(kScreenWidth - kWidthChange(20) - kWidthChange(80), CGRectGetMaxY(self.bigImage.frame) - kWidthChange(30), kWidthChange(80), kWidthChange(30));
        self.shareBT.layer.masksToBounds = YES;
        self.shareBT.layer.cornerRadius = kWidthChange(15);
        [self.shareBT setTitle:@"立即抢购" forState:UIControlStateNormal];
        [self.shareBT setTitleColor:newColor(230, 0, 44, 1) forState:UIControlStateNormal];
        self.shareBT.layer.borderWidth = 1;
        self.shareBT.layer.borderColor = newColor(233, 12, 51, 1).CGColor;
        self.shareBT.titleLabel.font = [UIFont systemFontOfSize:kWidthChange(16)];
        
        
    }
    
    return _shareBT;
}


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.bigImage];
        [self.contentView addSubview:self.nameLabel];
        [self.contentView addSubview:self.ProgressView];
        [self.contentView addSubview:self.progressLabel];
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
