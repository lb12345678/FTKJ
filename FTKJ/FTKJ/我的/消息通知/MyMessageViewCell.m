//
//  MyMessageViewCell.m
//  FTKJ
//
//  Created by ios on 2019/11/27.
//  Copyright © 2019年 ios. All rights reserved.
//

#import "MyMessageViewCell.h"

@implementation MyMessageViewCell


-(UIImageView *)bigImage {
    if (_bigImage == nil) {
        self.bigImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"box41-1"]];
        self.bigImage.frame = CGRectMake(kWidthChange(20), kWidthChange(20), kWidthChange(48), kWidthChange(48));
    }
    return _bigImage;
    
}

-(UILabel *)oneLabel {
    if (_oneLabel == nil) {
        self.oneLabel = [Toos setUpWithUserLabel:@"系统通知" CGRect:CGRectMake(CGRectGetMaxX(self.bigImage.frame) + kWidthChange(20), kWidthChange(20), kScreenWidth, kWidthChange(20)) color:[UIColor clearColor] textColor:newColor(2, 7, 12, 1) textSize:kWidthChange(18)];
    }
    
    return _oneLabel;
}


-(UILabel *)twoLabel {
    if (_twoLabel == nil) {
        self.twoLabel = [Toos setUpWithUserLabel:@"系统通知" CGRect:CGRectMake(CGRectGetMaxX(self.bigImage.frame) + kWidthChange(20),CGRectGetMaxY(self.bigImage.frame) - kWidthChange(20), kScreenWidth, kWidthChange(15)) color:[UIColor clearColor] textColor:newColor(114, 115, 116, 1) textSize:kWidthChange(15)];
    }
    
    return _twoLabel;
}

-(UILabel *)timeLabel {
    if (_timeLabel == nil) {
        self.timeLabel = [Toos setUpWithUserLabel:@"2019-06-01" CGRect:CGRectMake(0, kWidthChange(20), kScreenWidth - kWidthChange(20), kWidthChange(20)) color:[UIColor clearColor] textColor:newColor(175, 176, 178, 1) textSize:kWidthChange(13)];
        self.timeLabel.textAlignment = NSTextAlignmentRight;
    }
    
    return _timeLabel;
}


-(UILabel *)countLabel {
    if (_countLabel == nil) {
        self.countLabel = [Toos setUpWithUserLabel:@"2" CGRect:CGRectMake(kScreenWidth - kWidthChange(20) - kWidthChange(20),CGRectGetMaxY(self.bigImage.frame) - kWidthChange(20), kWidthChange(20), kWidthChange(20)) color:newColor(247, 168, 41, 1) textColor:newColor(255, 255, 255, 1) textSize:kWidthChange(13)];
        self.countLabel.textAlignment = NSTextAlignmentCenter;
        self.countLabel.layer.masksToBounds = YES;
        self.countLabel.layer.cornerRadius = kWidthChange(10);
    }
    
    return _countLabel;
}



-(UILabel *)lineLabel {
    if (_lineLabel == nil) {
        self.lineLabel = [Toos setUpWithUserLabel:@"" CGRect:CGRectMake(0,CGRectGetMaxY(self.bigImage.frame)+ kWidthChange(20),kScreenWidth, kWidthChange(1)) color:lineColor_gary textColor:newColor(255, 255, 255, 1) textSize:kWidthChange(12)];
       
    }
    
    return _lineLabel;
}


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.bigImage];
        [self.contentView addSubview:self.oneLabel];
        [self.contentView addSubview:self.twoLabel];
        [self.contentView addSubview:self.timeLabel];
        [self.contentView addSubview:self.countLabel];
        [self.contentView addSubview:self.lineLabel];
    }
    return self;
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
