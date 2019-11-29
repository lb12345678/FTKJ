//
//  MyTeamViewCell.m
//  FTKJ
//
//  Created by ios on 2019/11/27.
//  Copyright © 2019年 ios. All rights reserved.
//

#import "MyTeamViewCell.h"

@implementation MyTeamViewCell
-(UIImageView *)bigImage {
    if (_bigImage == nil) {
        self.bigImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"box41-1"]];
        self.bigImage.frame = CGRectMake(kWidthChange(20), kWidthChange(20), kWidthChange(45), kWidthChange(45));
        self.bigImage.layer.masksToBounds = YES;
        self.bigImage.layer.cornerRadius = kWidthChange(45) / 2;
    }
    return _bigImage;
    
}

-(UILabel *)nameLabel {
    if (_nameLabel == nil) {
        self.nameLabel = [Toos setUpWithUserLabel:@"系统通知" CGRect:CGRectMake(CGRectGetMaxX(self.bigImage.frame) + kWidthChange(20), kWidthChange(20), kScreenWidth, kWidthChange(45)) color:[UIColor clearColor] textColor:newColor(2, 7, 12, 1) textSize:kWidthChange(18)];
    }
    
    return _nameLabel;
}




-(UILabel *)timeLabel {
    if (_timeLabel == nil) {
        self.timeLabel = [Toos setUpWithUserLabel:@"2019-06-01" CGRect:CGRectMake(0, kWidthChange(20), kScreenWidth - kWidthChange(20), kWidthChange(45)) color:[UIColor clearColor] textColor:newColor(175, 176, 178, 1) textSize:kWidthChange(16)];
        self.timeLabel.textAlignment = NSTextAlignmentRight;
    }
    
    return _timeLabel;
}




-(UILabel *)lineLabel {
    if (_lineLabel == nil) {
        self.lineLabel = [Toos setUpWithUserLabel:@"2019-06-01" CGRect:CGRectMake(0,CGRectGetMaxY(self.bigImage.frame)+ kWidthChange(20),kScreenWidth, kWidthChange(1)) color:lineColor_gary textColor:newColor(255, 255, 255, 1) textSize:kWidthChange(12)];
        
    }
    
    return _lineLabel;
}


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.bigImage];
        [self.contentView addSubview:self.nameLabel];
      
        [self.contentView addSubview:self.timeLabel];
      
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
