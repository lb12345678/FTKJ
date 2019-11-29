//
//  MyMoneyViewCell.m
//  FTKJ
//
//  Created by ios on 2019/11/26.
//  Copyright © 2019年 ios. All rights reserved.
//

#import "MyMoneyViewCell.h"

@implementation MyMoneyViewCell


-(UILabel *)oneLabel {
    if (_oneLabel == nil) {
        self.oneLabel = [Toos setUpWithUserLabel:@"购买" CGRect:CGRectMake(kWidthChange(20), kWidthChange(15), kScreenWidth - kWidthChange(40), kWidthChange(20)) color:[UIColor clearColor] textColor:newColor(0, 0, 0, 1) textSize:kWidthChange(17)];
        
    }
    
    return _oneLabel;
}

-(UILabel *)timeLabel {
    if (_timeLabel == nil) {
        self.timeLabel = [Toos setUpWithUserLabel:@"购买" CGRect:CGRectMake(kWidthChange(20), CGRectGetMaxY(self.oneLabel.frame), kScreenWidth - kWidthChange(40), kWidthChange(20)) color:[UIColor clearColor] textColor:newColor(135, 136, 137, 1) textSize:kWidthChange(17)];
        
    }
    
    return _timeLabel;
}

-(UILabel *)moneyLabel {
    if (_moneyLabel == nil) {
        self.moneyLabel = [Toos setUpWithUserLabel:@"购买" CGRect:CGRectMake(kWidthChange(20), 0, kScreenWidth - kWidthChange(40), kWidthChange(70)) color:[UIColor clearColor] textColor:newColor(0, 0, 0, 1) textSize:kWidthChange(17)];
        self.moneyLabel.font = [UIFont systemFontOfSize:kWidthChange(16) weight:UIFontWeightBold];
        self.moneyLabel.textAlignment = NSTextAlignmentRight;
    }
    
    return _moneyLabel;
}
-(UILabel *)lineLabel {
    if (_lineLabel == nil) {
        self.lineLabel = [Toos setUpWithUserLabel:@"" CGRect:CGRectMake(kWidthChange(0), kWidthChange(70) - 1, kScreenWidth , 1) color:lineColor_gary textColor:newColor(135, 136, 137, 1) textSize:kWidthChange(17)];
        
    }
    
    return _lineLabel;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.oneLabel];
        [self.contentView addSubview:self.timeLabel];
        [self.contentView addSubview:self.moneyLabel];
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
