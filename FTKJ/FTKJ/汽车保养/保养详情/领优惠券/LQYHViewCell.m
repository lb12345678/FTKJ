//
//  LQYHViewCell.m
//  FTKJ
//
//  Created by ios on 2019/11/22.
//  Copyright © 2019年 ios. All rights reserved.
//

#import "LQYHViewCell.h"

@implementation LQYHViewCell


-(UILabel *)moneyLabel {
    if (_moneyLabel == nil) {
        self.moneyLabel = [Toos setUpWithUserLabel:@"100" CGRect:CGRectMake(kWidthChange(20), kWidthChange(20), kScreenWidth - kWidthChange(40), kWidthChange(25)) color:[UIColor clearColor] textColor:newColor(250, 118, 25, 1) textSize:kWidthChange(24)];
    }
    
    return _moneyLabel;
}

-(UILabel *)timeLabel {
    if (_timeLabel == nil) {
        self.timeLabel = [Toos setUpWithUserLabel:@"2019-12" CGRect:CGRectMake(kWidthChange(20), CGRectGetMaxY(self.moneyLabel.frame), kScreenWidth - kWidthChange(40), kWidthChange(20)) color:[UIColor clearColor] textColor:newColor(174, 174, 175, 1) textSize:kWidthChange(14)];
    }
    return _timeLabel;
}
-(UILabel *)TiaoJianLabel {
    if (_TiaoJianLabel == nil) {
        self.TiaoJianLabel = [Toos setUpWithUserLabel:@"2019-12" CGRect:CGRectMake(kWidthChange(20), CGRectGetMaxY(self.timeLabel.frame), kScreenWidth - kWidthChange(40), kWidthChange(20)) color:[UIColor clearColor] textColor:newColor(174, 174, 175, 1) textSize:kWidthChange(14)];
    }
    return _TiaoJianLabel;
}
-(UILabel *)categoryLabel {
    if (_categoryLabel == nil) {
        self.categoryLabel = [Toos setUpWithUserLabel:@"2019-12" CGRect:CGRectMake(kWidthChange(20), CGRectGetMaxY(self.TiaoJianLabel.frame), kScreenWidth - kWidthChange(40), kWidthChange(20)) color:[UIColor clearColor] textColor:newColor(174, 174, 175, 1) textSize:kWidthChange(14)];
    }
    return _categoryLabel;
}

-(UILabel *)lineLabel {
    
    if (_lineLabel == nil) {
        self.lineLabel = [Toos setUpWithUserLabel:@"" CGRect:CGRectMake(0, CGRectGetMaxY(self.categoryLabel.frame) + kWidthChange(20), kScreenWidth ,1) color:lineColor_gary textColor:newColor(174, 174, 175, 1) textSize:kWidthChange(14)];
    }
    return _lineLabel;
    
    
}

-(UIButton *)LQBT {
    if (_LQBT == nil) {
        self.LQBT = [UIButton buttonWithType:UIButtonTypeCustom];
        self.LQBT.frame = CGRectMake(kScreenWidth - kWidthChange(100), CGRectGetMaxY(self.moneyLabel.frame), kWidthChange(80), kWidthChange(35));
        self.LQBT.layer.masksToBounds = YES;
        self.LQBT.layer.cornerRadius = kWidthChange(17.5);
        self.LQBT.layer.borderWidth = 1;
        self.LQBT.layer.borderColor = newColor(243, 150, 160, 1).CGColor;
        [self.LQBT setTitle:@"领优惠券" forState:UIControlStateNormal];
        [self.LQBT setTitleColor:newColor(243, 150, 160, 1) forState:UIControlStateNormal];
        self.LQBT.titleLabel.font = [UIFont systemFontOfSize:kWidthChange(15)];
    }
    
    return _LQBT;
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.moneyLabel];
        [self.contentView addSubview:self.timeLabel];
        [self.contentView addSubview:self.TiaoJianLabel];
        [self.contentView addSubview:self.categoryLabel];
        [self.contentView addSubview:self.lineLabel];
        [self.contentView addSubview:self.LQBT];
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
