//
//  HomeOneHeaderView.m
//  FTKJ
//
//  Created by ios on 2019/11/19.
//  Copyright © 2019年 ios. All rights reserved.
//

#import "HomeOneHeaderView.h"

@implementation HomeOneHeaderView


-(UIView *)bigView {
    if (_bigView == nil) {
        self.bigView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kWidthChange(500))];
        self.bigView.backgroundColor = newColor(240, 243, 251, 1);
    }
    return _bigView;
    
}


-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.bigView];
    }
    
    return self;
}


-(void)setUpWithNewBigDic:(NSDictionary *)newDic{
    
    [self.bigView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    for (int i = 0; i < 2; i++) {
        
        UIButton *oneBT = [UIButton buttonWithType:UIButtonTypeCustom];
        oneBT.frame = CGRectMake(kWidthChange(20) + i * (kScreenWidth - kWidthChange(50)) / 2 + i * kWidthChange(10), kWidthChange(30), (kScreenWidth - kWidthChange(50)) / 2, kWidthChange(252));
        oneBT.layer.masksToBounds = YES;
        oneBT.layer.cornerRadius = 5;
         oneBT.backgroundColor = [UIColor whiteColor];
        [self.bigView addSubview:oneBT];
        
        UIImageView *oneImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@""]];
        oneImage.backgroundColor = [UIColor redColor];
        oneImage.frame = CGRectMake(0, 0, (kScreenWidth - kWidthChange(50)) / 2, kWidthChange(168));
        
        [oneBT addSubview:oneImage];
        
        for (int j = 0; j < 3; j++) {
            
            UILabel *oneLabel = [Toos setUpWithUserLabel:@"123456" CGRect:CGRectMake(kWidthChange(10), CGRectGetMaxY(oneImage.frame) +  j * kWidthChange(24), kScreenWidth - kWidthChange(70), kWidthChange(24)) color:[UIColor clearColor] textColor:newColor(0, 0, 11, 1) textSize:kWidthChange(14)];
            [oneBT addSubview:oneLabel];
            if (j == 0) {
                oneLabel.textColor = newColor(0, 0, 11, 1);
                oneLabel.font = [UIFont systemFontOfSize:kWidthChange(16)];
            }
            if (j == 1) {
                oneLabel.textColor = newColor(133, 141, 151, 1);
                oneLabel.font = [UIFont systemFontOfSize:kWidthChange(14)];
            }
            if (j == 2) {
                oneLabel.textColor = newColor(250, 97, 0, 1);
                oneLabel.font = [UIFont systemFontOfSize:kWidthChange(18)];
            }
            
            
            
        }
        
        
        
    }
    for (int i = 0; i < 3; i++) {
        
        UIButton *oneBT = [UIButton buttonWithType:UIButtonTypeCustom];
        oneBT.frame = CGRectMake(kWidthChange(20) + i * (kScreenWidth - kWidthChange(60)) / 3 + i * kWidthChange(10), kWidthChange(302), (kScreenWidth - kWidthChange(60)) / 3, kWidthChange(190));
        oneBT.layer.masksToBounds = YES;
        oneBT.layer.cornerRadius = 5;
        oneBT.backgroundColor = [UIColor whiteColor];
        [self.bigView addSubview:oneBT];
        
        UIImageView *oneImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@""]];
        oneImage.backgroundColor = [UIColor redColor];
        oneImage.frame = CGRectMake(0, 0, (kScreenWidth - kWidthChange(60)) / 3, kWidthChange(108));
        
        [oneBT addSubview:oneImage];
        
        for (int j = 0; j < 3; j++) {
            
            UILabel *oneLabel = [Toos setUpWithUserLabel:@"123456" CGRect:CGRectMake(kWidthChange(10), CGRectGetMaxY(oneImage.frame) + j * kWidthChange(27), (kScreenWidth - kWidthChange(60)) / 3 - kWidthChange(20), kWidthChange(27)) color:[UIColor clearColor] textColor:newColor(0, 0, 11, 1) textSize:kWidthChange(14)];
             [oneBT addSubview:oneLabel];
            if (j == 0) {
                oneLabel.textColor = newColor(0, 0, 11, 1);
                oneLabel.font = [UIFont systemFontOfSize:kWidthChange(16)];
            }
            if (j == 1) {
                oneLabel.textColor = newColor(133, 141, 151, 1);
                oneLabel.font = [UIFont systemFontOfSize:kWidthChange(14)];
            }
            if (j == 2) {
                oneLabel.textColor = newColor(250, 97, 0, 1);
                oneLabel.font = [UIFont systemFontOfSize:kWidthChange(18)];
            }
            
            
            
        }
        
        
        
    }
    
    
}



@end
