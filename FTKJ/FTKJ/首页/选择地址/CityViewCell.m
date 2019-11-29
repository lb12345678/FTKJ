//
//  CityViewCell.m
//  KuaiPai
//
//  Created by libo on 2018/6/17.
//  Copyright © 2018年 ios. All rights reserved.
//

#import "CityViewCell.h"

@implementation CityViewCell


-(UILabel *)oneLabel {
    if (_oneLabel == nil) {
        self.oneLabel = [Toos setUpWithUserLabel:@"重庆" CGRect:CGRectMake(15, 0, kScreenWidth - 30, kWidthChange(53)) color:[UIColor clearColor] textColor:newColor(58, 58, 58, 1) textSize:kWidthChange(14)];
    }
    return _oneLabel;
}

-(UILabel *)twoLabel {
    if (_twoLabel == nil) {
        self.twoLabel = [Toos setUpWithUserLabel:@"选择区县" CGRect:CGRectMake(15, 0, kScreenWidth - 30 - 10, kWidthChange(53)) color:[UIColor clearColor] textColor:newColor(158, 158, 158, 1) textSize:kWidthChange(12)];
        self.twoLabel.textAlignment = NSTextAlignmentRight;
    }
    return _twoLabel;
}

//-(UIImageView *)rightImage {
//    if (_rightImage == nil) {
//        self.rightImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"箭头下"]];
//        self.rightImage.frame = CGRectMake(kScreenWidth - 15 - 10, kHeightChange(25) - 3.5, 10, 7);
//    }
//    return _rightImage;
//}

-(UILabel *)lineLabel {
    if (_lineLabel == nil) {
        self.lineLabel = [Toos setUpWithUserLabel:@"" CGRect:CGRectMake(15, kWidthChange(53) - 1, kScreenWidth - 30, 1) color:[UIColor lightGrayColor] textColor:newColor(58, 58, 58, 1) textSize:kWidthChange(14)];
        self.lineLabel.alpha = .3;
    }
    return _lineLabel;
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.oneLabel];
//        [self.contentView addSubview:self.twoLabel];
        [self.contentView addSubview:self.rightImage];
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
