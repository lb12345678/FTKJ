//
//  MyViewCell.m
//  YXKJ
//
//  Created by ios on 2018/10/12.
//  Copyright © 2018年 ios. All rights reserved.
//

#import "MyViewCell.h"

@implementation MyViewCell


-(UIImageView *)cateImage {
    if (_cateImage == nil) {
        self.cateImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@""]];
        self.cateImage.frame = CGRectMake(15, kWidthChange(60) / 2 - kWidthChange(12), kWidthChange(21), kWidthChange(24));
        self.cateImage.contentMode = UIViewContentModeCenter;
        
    }
    return _cateImage;
}

-(UILabel *)namelabel {
    if (_namelabel == nil) {
        self.namelabel = [Toos setUpWithUserLabel:@"我的购物车" CGRect:CGRectMake(CGRectGetMaxX(self.cateImage.frame) + kWidthChange(15), 0, kScreenWidth, kWidthChange(60)) color:[UIColor whiteColor] textColor:newColor(51, 51, 51, 1) textSize:kWidthChange(16)];
    }
    return _namelabel;
}
-(UIImageView *)rightImage {
    if (_rightImage == nil) {
        self.rightImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"box21"]];
        self.rightImage.frame = CGRectMake(kScreenWidth - 15 - kWidthChange(12), kWidthChange(60) / 2 - kWidthChange(17) / 2, kWidthChange(12), kWidthChange(17));
        self.rightImage.contentMode = UIViewContentModeScaleAspectFill;
        
    }
    return _rightImage;
}

-(UILabel *)lineLabel {
    if (_lineLabel == nil) {
        self.lineLabel = [Toos setUpWithUserLabel:@"" CGRect:CGRectMake(15, kWidthChange(60) - 1, kScreenWidth, 1) color:newColor(242, 242, 242, 1) textColor:newColor(51, 51, 51, 1) textSize:kWidthChange(14)];
    }
    return _lineLabel;
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.cateImage];
        [self.contentView addSubview:self.namelabel];
        [self.contentView addSubview:self.rightImage];
        [self.contentView addSubview:self.lineLabel];
    }
    return self;
}
-(void)setUpWithNewDic:(NSDictionary *)newDic {
    
    self.cateImage.image = [UIImage imageNamed:newDic[@"icon"]];
    
   
    if ([newDic[@"title"]length] > 6) {
        self.namelabel.attributedText = [Toos setUpWithtext:newDic[@"title"] color:newColor(51, 51, 51, 1) color1:newColor(156, 157, 158, 1) font:kWidthChange(14) font1:kWidthChange(14) length:5 length1:7];
    }else {
         self.namelabel.text = [NSString stringWithFormat:@"%@",newDic[@"title"]];
        
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
