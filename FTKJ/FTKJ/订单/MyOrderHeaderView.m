//
//  MyOrderHeaderView.m
//  FTKJ
//
//  Created by ios on 2019/11/25.
//  Copyright © 2019年 ios. All rights reserved.
//

#import "MyOrderHeaderView.h"

@implementation MyOrderHeaderView


-(UIView *)bigView {
    
    
    if (_bigView == nil) {
        self.bigView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kWidthChange(45))];
        self.bigView.backgroundColor = newColor(241, 242, 244, 1);
    }
    return _bigView;
}

-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        [self addSubview:self.bigView];
    }
    
    return self;
}


-(void)setUpWithBigArray:(NSArray *)bigArray {
    
    [self.bigView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    for (int i = 0; i < bigArray.count; i++) {
        
        UIButton *oneBT = [UIButton buttonWithType:UIButtonTypeCustom];
        oneBT.frame = CGRectMake(kScreenWidth / bigArray.count * i, 0, kScreenWidth / bigArray.count, kWidthChange(45));
        [oneBT setTitle:[bigArray objectAtIndex:i] forState:UIControlStateNormal];
        [oneBT setTitleColor:newColor(138, 139, 141, 1) forState:UIControlStateNormal];
        oneBT.titleLabel.font = [UIFont systemFontOfSize:kWidthChange(15)];
        if (i == 0) {
            [oneBT setTitleColor:newColor(0, 0, 0, 1) forState:UIControlStateNormal];
            oneBT.titleLabel.font = [UIFont systemFontOfSize:kWidthChange(18)];
        }
        
        
        [self.bigView addSubview:oneBT];
        
    }
    
    
    
}



@end
