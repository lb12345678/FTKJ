//
//  HomeTwoHeaderView.m
//  FTKJ
//
//  Created by ios on 2019/11/19.
//  Copyright © 2019年 ios. All rights reserved.
//

#import "HomeTwoHeaderView.h"

@implementation HomeTwoHeaderView


-(UILabel *)oneLabel {
    if (_oneLabel == nil) {
        self.oneLabel = [Toos setUpWithUserLabel:@"限时特价" CGRect:CGRectMake(kWidthChange(20), 0, [Toos textRect:@"限时特价" textFont:[UIFont systemFontOfSize:kWidthChange(18) weight:UIFontWeightMedium]], kWidthChange(45)) color:[UIColor clearColor] textColor:newColor(239, 91, 70, 1) textSize:kWidthChange(15)];
        self.oneLabel.font = [UIFont systemFontOfSize:kWidthChange(18) weight:UIFontWeightMedium];
    }
    return _oneLabel;
    
    
}


-(UIView *)timeView {
    if (_timeView == nil) {
        self.timeView = [[UIView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.oneLabel.frame) + kWidthChange(30), kWidthChange(45) / 2 - kWidthChange(10), kWidthChange(100), kWidthChange(20))];
        self.timeView.backgroundColor = [UIColor clearColor];
    }
    return _timeView;
    
}

-(UIButton *)MoreBT {
    if (_MoreBT == nil) {
        self.MoreBT = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.MoreBT setTitle:@"更多 " forState:UIControlStateNormal];
        [self.MoreBT setTitleColor:newColor(130, 131, 133, 1) forState:UIControlStateNormal];
        self.MoreBT.frame = CGRectMake(kScreenWidth - kWidthChange(20) - [Toos textRect:@"更多 " textFont:[UIFont systemFontOfSize:kWidthChange(13)]] - kWidthChange(12), 0,  [Toos textRect:@"更多 " textFont:[UIFont systemFontOfSize:kWidthChange(13)]] - kWidthChange(12), kWidthChange(45));
        self.MoreBT.titleLabel.font = [UIFont systemFontOfSize:kWidthChange(13)];
    }
    
    return _MoreBT;
    
}



-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.oneLabel];
        [self.contentView addSubview:self.timeView];
        [self.contentView addSubview:self.MoreBT];
    }
    return self;
    
}

-(void)setUpWithNewBigTimeStr:(NSString *)timeStr {
    [self.timeView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    for (int j = 0; j < 3; j++) {
        
        UILabel *oneLabel = [Toos setUpWithUserLabel:@"01" CGRect:CGRectMake(j * kWidthChange(28) + j * kWidthChange(20), 0, kWidthChange(28), kWidthChange(20)) color:newColor(31, 31, 32, 1) textColor:newColor(255, 255, 255, 1) textSize:kWidthChange(12)];
        [self.timeView addSubview:oneLabel];
       
        oneLabel.layer.masksToBounds = YES;
        oneLabel.layer.cornerRadius = 2;
        
        oneLabel.textAlignment = NSTextAlignmentCenter;
        
        
        UILabel *twoLabel = [Toos setUpWithUserLabel:@":" CGRect:CGRectMake( kWidthChange(28) + j * kWidthChange(48), 0, kWidthChange(20), kWidthChange(20)) color:newColor(255, 255, 255, 1) textColor:newColor(102, 103, 104, 1) textSize:kWidthChange(12)];
        [self.timeView addSubview:twoLabel];
        
      
        
        twoLabel.textAlignment = NSTextAlignmentCenter;
        
        
        
    }
    
    
}

@end
