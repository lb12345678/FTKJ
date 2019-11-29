//
//  MyPLViewCell.m
//  FTKJ
//
//  Created by ios on 2019/11/26.
//  Copyright © 2019年 ios. All rights reserved.
//

#import "MyPLViewCell.h"

@implementation MyPLViewCell

-(UIImageView *)headerImage {
    if (_headerImage == nil) {
        self.headerImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@""]];
        self.headerImage.frame = CGRectMake(kWidthChange(20), kWidthChange(20), kWidthChange(30), kWidthChange(30));
        self.headerImage.layer.masksToBounds = YES;
        self.headerImage.layer.cornerRadius = kWidthChange(15);
        self.headerImage.backgroundColor = [UIColor redColor];
    }
    return _headerImage;
    
}

- (UILabel *)phoneLabel {
    
    if (_phoneLabel == nil) {
        self.phoneLabel = [Toos setUpWithUserLabel:@"12345678910" CGRect:CGRectMake(CGRectGetMaxX(self.headerImage.frame) + kWidthChange(15), kWidthChange(20), [Toos textRect:@"12345678910" textFont:[UIFont systemFontOfSize:kWidthChange(17)]], kWidthChange(30)) color:[UIColor clearColor] textColor:newColor(38, 38, 39, 1) textSize:kWidthChange(17)];
    }
    
    return _phoneLabel;
}
-(XHStarRateView *)starView {
    if (_starView == nil) {
        self.starView = [[XHStarRateView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.phoneLabel.frame), kWidthChange(30), kWidthChange(70), kWidthChange(10)) numberOfStars:5 rateStyle:3 isAnination:YES finish:^(CGFloat currentScore) {
            
        }];
        self.starView.currentScore = 3;
    }
    return _starView;
}

- (UILabel *)GuiGeLabel {
    
    if (_GuiGeLabel == nil) {
        self.GuiGeLabel = [Toos setUpWithUserLabel:@"500g/份*2" CGRect:CGRectMake( kWidthChange(20), kWidthChange(20), kScreenWidth - kWidthChange(40), kWidthChange(30)) color:[UIColor clearColor] textColor:newColor(150, 151, 153, 1) textSize:kWidthChange(13)];
        self.GuiGeLabel.textAlignment = NSTextAlignmentRight;
    }
    
    return _GuiGeLabel;
}
-(UILabel *)messageLabel {
    
    if (_messageLabel == nil) {
        self.messageLabel = [Toos setUpWithUserLabel:@"123456" CGRect:CGRectMake(CGRectGetMaxX(self.headerImage.frame)+ kWidthChange(15), CGRectGetMaxY(self.headerImage.frame), kScreenWidth - kWidthChange(40) - kWidthChange(45), kWidthChange(30)) color:[UIColor clearColor] textColor:newColor(38, 38, 39, 1) textSize:kWidthChange(17)];
        self.messageLabel.numberOfLines = 0;
       
    }
    
    return _messageLabel;
    
}

-(UIView *)bigView {
    
    if (_bigView == nil) {
        self.bigView = [[UIView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.headerImage.frame)+ kWidthChange(15), CGRectGetMaxY(self.messageLabel.frame),  kScreenWidth - kWidthChange(40) - kWidthChange(45), 0)];
        self.bigView.backgroundColor = [UIColor whiteColor];
    }
    return _bigView;
}


-(UIView *)oneBigView {
    
    if (_oneBigView == nil) {
        self.oneBigView = [[UIView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.headerImage.frame)+ kWidthChange(15), CGRectGetMaxY(self.bigView.frame),  kScreenWidth - kWidthChange(40) - kWidthChange(45), kWidthChange(127))];
        self.oneBigView.backgroundColor = [UIColor whiteColor];
    }
    return _oneBigView;
}


-(UIView *)alphaView {
    
    if (_alphaView == nil) {
        self.alphaView = [[UIView alloc]initWithFrame:CGRectMake(0, 0,  kScreenWidth - kWidthChange(40) - kWidthChange(45), kWidthChange(80))];
        self.alphaView.backgroundColor = newColor(241, 242, 244, 1);
        self.alphaView.layer.masksToBounds = YES;
        self.alphaView.layer.cornerRadius = 3;
    }
    return _alphaView;
    
}

-(UIImageView *)SpImage {
    if (_SpImage == nil) {
        self.SpImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@""]];
        self.SpImage.frame = CGRectMake(kWidthChange(10), kWidthChange(20), kWidthChange(40), kWidthChange(40));
        self.SpImage.layer.masksToBounds = YES;
        self.SpImage.layer.cornerRadius = kWidthChange(3);
        self.SpImage.backgroundColor = [UIColor redColor];
    }
    return _SpImage;
    
}

- (UILabel *)SPNameLabel {
    
    if (_SPNameLabel == nil) {
        self.SPNameLabel = [Toos setUpWithUserLabel:@"123456789" CGRect:CGRectMake(CGRectGetMaxX(self.SpImage.frame) + kWidthChange(15), kWidthChange(20), kScreenWidth - CGRectGetMaxY(self.SpImage.frame) - kWidthChange(15) - kWidthChange(95), kWidthChange(20)) color:[UIColor clearColor] textColor:newColor(94, 95, 96, 1) textSize:kWidthChange(15)];
    }
    
    return _SPNameLabel;
}
- (UILabel *)SpMoneyLabel {
    
    if (_SpMoneyLabel == nil) {
        self.SpMoneyLabel = [Toos setUpWithUserLabel:@"123456789" CGRect:CGRectMake(CGRectGetMaxX(self.SpImage.frame) + kWidthChange(15), kWidthChange(45), kScreenWidth - CGRectGetMaxY(self.SpImage.frame) - kWidthChange(15) - kWidthChange(95), kWidthChange(15)) color:[UIColor clearColor] textColor:newColor(82, 83, 84, 1) textSize:kWidthChange(15)];
    }
    
    return _SpMoneyLabel;
}

-(UILabel *)timeLabel {
    
    if (_timeLabel == nil) {
        self.timeLabel = [Toos setUpWithUserLabel:@"123456789" CGRect:CGRectMake(0, CGRectGetMaxY(self.alphaView.frame), kScreenWidth , kWidthChange(35)) color:[UIColor clearColor] textColor:newColor(176, 177, 179, 1) textSize:kWidthChange(13)];
    }
    
    return _timeLabel;
    
}
-(UILabel *)lineLabel {
    
    if (_lineLabel == nil) {
        self.lineLabel = [Toos setUpWithUserLabel:@"" CGRect:CGRectMake(0, CGRectGetMaxY(self.timeLabel.frame) + kWidthChange(10), kScreenWidth - CGRectGetMaxX(self.headerImage.frame) - kWidthChange(35) , kWidthChange(1)) color:lineColor_gary textColor:newColor(201, 202, 203, 1) textSize:kWidthChange(11)];
    }
    
    return _lineLabel;
    
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.headerImage];
        [self.contentView addSubview:self.phoneLabel];
        [self.contentView addSubview:self.starView];
        [self.contentView addSubview:self.GuiGeLabel];
        [self.contentView addSubview:self.messageLabel];
        [self.contentView addSubview:self.bigView];
         [self.contentView addSubview:self.oneBigView];
        [self.oneBigView addSubview:self.alphaView];
        [self.alphaView addSubview:self.SpImage];
        [self.alphaView addSubview:self.SPNameLabel];
        [self.alphaView addSubview:self.SpMoneyLabel];
        [self.oneBigView addSubview:self.timeLabel];
        [self.oneBigView addSubview:self.lineLabel];
    }
    
    return self;
    
    
}
+(CGFloat)setUpWithHeightWithNewDic:(NSDictionary *)tempDic {
    
    
    
    return kWidthChange(20) + kWidthChange(60) + kWidthChange(80) + kWidthChange(45);
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
