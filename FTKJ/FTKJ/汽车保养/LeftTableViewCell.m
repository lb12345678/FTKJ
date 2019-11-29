//
//  LeftTableViewCell.m
//  tableViewLianDong
//
//  Created by ios on 2017/6/1.
//  Copyright © 2017年 ios. All rights reserved.
//

#import "LeftTableViewCell.h"

@implementation LeftTableViewCell


-(UILabel *)nameLabel {
    if (_nameLabel == nil) {
        self.nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, kWidthChange(120), kWidthChange(46))];
        self.nameLabel.numberOfLines = 0;
        self.nameLabel.font = [UIFont systemFontOfSize:kWidthChange(16)];
        self.nameLabel.highlightedTextColor = [UIColor colorWithRed:229 / 255.0 green:0 / 255.0 blue:0 / 255.0 alpha:1];
        self.nameLabel.textColor = [UIColor colorWithRed:28 / 255.0 green:28 / 255.0 blue:30 / 255.0 alpha:1];
        self.nameLabel.textAlignment = NSTextAlignmentCenter;
    
    }
    return _nameLabel;
}

-(UIView *)yellowView {
    if (_yellowView == nil) {
        self.yellowView = [[UIView alloc]initWithFrame:CGRectMake(0, kWidthChange(46) - 1, kWidthChange(120), 1)];
        self.yellowView.backgroundColor = [UIColor colorWithRed:242 / 255.0 green:244 / 255.0 blue:245 / 255.0 alpha:1];
    }
    return _yellowView;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.nameLabel];
        [self.contentView addSubview:self.yellowView];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
//    self.contentView.backgroundColor = selected ? [UIColor whiteColor] : [UIColor colorWithWhite:0 alpha:0.1];
    self.highlighted = YES;
    self.nameLabel.highlighted = selected;
//    self.yellowView.hidden = !selected;
    
    
    

    // Configure the view for the selected state
}

@end
