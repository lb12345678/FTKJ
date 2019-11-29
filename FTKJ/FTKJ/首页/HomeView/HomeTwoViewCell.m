//
//  HomeTwoViewCell.m
//  FTKJ
//
//  Created by ios on 2019/11/20.
//  Copyright © 2019年 ios. All rights reserved.
//

#import "HomeTwoViewCell.h"

@implementation HomeTwoViewCell


-(UIView *)bigView {
    if (_bigView == nil) {
        self.bigView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kWidthChange(180))];
        self.bigView.backgroundColor = [UIColor whiteColor];
    }
    
    return _bigView;
    
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.bigView];
    }
    return self;
    
}

- (void)setUpWithBigDic:(NSDictionary *)bigDic {
    UIButton *oneBT = [UIButton buttonWithType:UIButtonTypeCustom];
    oneBT.frame = CGRectMake(kWidthChange(20), 0, kWidthChange(136), kWidthChange(180));
    oneBT.layer.masksToBounds = YES;
    oneBT.layer.cornerRadius = 5;
    oneBT.backgroundColor = [UIColor redColor];
    [self.bigView addSubview:oneBT];
    
    
    UIButton *twoBT = [UIButton buttonWithType:UIButtonTypeCustom];
    twoBT.frame = CGRectMake(kWidthChange(10) + CGRectGetMaxX(oneBT.frame), 0,kScreenWidth - kWidthChange(30) - CGRectGetMaxX(oneBT.frame) , kWidthChange(85));
    twoBT.layer.masksToBounds = YES;
    twoBT.layer.cornerRadius = 5;
    twoBT.backgroundColor = [UIColor redColor];
    [self.bigView addSubview:twoBT];
    
    
    for (int i = 0; i < 2; i++) {
        
        UIButton *threeBT = [UIButton buttonWithType:UIButtonTypeCustom];
        threeBT.frame = CGRectMake(kWidthChange(10) + CGRectGetMaxX(oneBT.frame) + i * (kScreenWidth - kWidthChange(40) - CGRectGetMaxX(oneBT.frame)) / 2 + i * kWidthChange(10), CGRectGetMaxY(twoBT.frame) +  kWidthChange(10),(kScreenWidth - kWidthChange(40) - CGRectGetMaxX(oneBT.frame)) / 2 , kWidthChange(85));
        threeBT.layer.masksToBounds = YES;
        threeBT.layer.cornerRadius = 5;
        threeBT.backgroundColor = [UIColor redColor];
        [self.bigView addSubview:threeBT];
        
        
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
