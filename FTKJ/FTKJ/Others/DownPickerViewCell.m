//
//  DownPickerViewCell.m
//  GZSC
//
//  Created by ios on 2018/9/8.
//  Copyright © 2018年 ios. All rights reserved.
//

#import "DownPickerViewCell.h"

@implementation DownPickerViewCell

-(UILabel *)nameLabel {
    
    if (_nameLabel == nil) {
        self.nameLabel = [Toos setUpWithUserLabel:@"" CGRect:CGRectMake(0, 0, kScreenWidth, kWidthChange(40)) color:[UIColor clearColor] textColor:newColor(51, 51, 51, 1) textSize:kWidthChange(14)];
        self.nameLabel.textAlignment = NSTextAlignmentCenter;
        
    }
    
    return _nameLabel;
}

-(UIImageView *)biaoShiImage {
    
    if (_biaoShiImage == nil) {
        self.biaoShiImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"选中"]];
        self.biaoShiImage.frame = CGRectMake(kScreenWidth - 15 - 15, kWidthChange(20) - 6, 15, 12);
        self.biaoShiImage.hidden = YES;
        self.biaoShiImage.contentMode = UIViewContentModeCenter;
    }
    return _biaoShiImage;
    
}

-(UILabel *)lineLabel {
    
    if (_lineLabel == nil) {
        self.lineLabel = [Toos setUpWithUserLabel:@"" CGRect:CGRectMake(0, kWidthChange(40) - 1, kScreenWidth, 1) color:newColor(230, 230, 230, 1) textColor:newColor(51, 51, 51, 1) textSize:kWidthChange(14)];
        
        
    }
    
    return _lineLabel;
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.nameLabel];
        [self.contentView addSubview:self.biaoShiImage];
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
