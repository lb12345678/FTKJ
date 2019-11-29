//
//  THYYViewCell.m
//  JZGL
//
//  Created by ios on 2019/8/23.
//  Copyright © 2019年 ios. All rights reserved.
//

#import "THYYViewCell.h"

@implementation THYYViewCell


-(UILabel *)nameLabel {
    
    if (_nameLabel == nil) {
        self.nameLabel = [Toos setUpWithUserLabel:@"" CGRect:CGRectMake(kWidthChange(15), 0, kScreenWidth - kWidthChange(30), kWidthChange(55)) color:[UIColor clearColor] textColor:newColor(71, 80, 90, 1) textSize:kWidthChange(15)];
        
    }
    return _nameLabel;
}


-(UIButton *)button {
    if (_button == nil) {
        self.button = [UIButton buttonWithType:UIButtonTypeCustom];
        self.button.frame = CGRectMake(kScreenWidth - kWidthChange(40), kWidthChange(55) / 2 - kWidthChange(15), kWidthChange(30), kWidthChange(30));
        [self.button setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        
    }
    return _button;
    
    
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.nameLabel];
        [self.contentView addSubview:self.button];
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
