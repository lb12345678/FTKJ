//
//  HomeOneViewCell.m
//  FTKJ
//
//  Created by ios on 2019/11/20.
//  Copyright © 2019年 ios. All rights reserved.
//

#import "HomeOneViewCell.h"

@implementation HomeOneViewCell

-(UIScrollView *)ScrollerView {
    if (_ScrollerView == nil) {
        self.ScrollerView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kWidthChange(165))];
        self.ScrollerView.backgroundColor = [UIColor whiteColor];
    }
    return _ScrollerView;
    
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.ScrollerView];
    }
    return self;
}

-(void)setUpWithBigDic:(NSDictionary *)bigDic {
    [self.ScrollerView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    for (int i = 0; i < 4; i++) {
        
      

        UIButton *oneBT = [UIButton buttonWithType:UIButtonTypeCustom];
        oneBT.frame = CGRectMake(kWidthChange(20) + i * (kScreenWidth - kWidthChange(60)) / 3 + i * kWidthChange(20), 0, (kScreenWidth - kWidthChange(60)) / 3, kWidthChange(165));
        oneBT.layer.masksToBounds = YES;
        oneBT.layer.cornerRadius = 5;
        oneBT.backgroundColor = [UIColor whiteColor];
        [self.ScrollerView addSubview:oneBT];
        
        UIImageView *oneImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@""]];
        oneImage.backgroundColor = [UIColor redColor];
        oneImage.frame = CGRectMake(0, 0, (kScreenWidth - kWidthChange(60)) / 3, kWidthChange(110));
        
        [oneBT addSubview:oneImage];
        
        for (int j = 0; j < 2; j++) {
            
            UILabel *oneLabel = [Toos setUpWithUserLabel:@"123456" CGRect:CGRectMake(0, CGRectGetMaxY(oneImage.frame) +  j * kWidthChange(24), (kScreenWidth - kWidthChange(60)) / 3, kWidthChange(24)) color:[UIColor clearColor] textColor:newColor(0, 0, 11, 1) textSize:kWidthChange(14)];
            [oneBT addSubview:oneLabel];
            if (j == 0) {
                oneLabel.textColor = newColor(56, 57, 58, 1);
                oneLabel.font = [UIFont systemFontOfSize:kWidthChange(14)];
            }
            if (j == 1) {
                oneLabel.textColor = newColor(250, 112, 0, 1);
                oneLabel.font = [UIFont systemFontOfSize:kWidthChange(16)];
            }
            if (j == 2) {
                oneLabel.textColor = newColor(250, 97, 0, 1);
                oneLabel.font = [UIFont systemFontOfSize:kWidthChange(18)];
            }
            
            
            
        }
        
        UILabel *twoLabel = [Toos setUpWithUserLabel:@"123456" CGRect:CGRectMake(0, CGRectGetMaxY(oneImage.frame) +  kWidthChange(24), (kScreenWidth - kWidthChange(60)) / 3, kWidthChange(24)) color:[UIColor clearColor] textColor:newColor(190, 191, 193, 1) textSize:kWidthChange(14)];
        [oneBT addSubview:twoLabel];
        
        twoLabel.textAlignment = NSTextAlignmentRight;
        
        
        
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
