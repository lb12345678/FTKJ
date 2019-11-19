//
//  HomeOneFooterView.m
//  FTKJ
//
//  Created by ios on 2019/11/19.
//  Copyright © 2019年 ios. All rights reserved.
//

#import "HomeOneFooterView.h"

@implementation HomeOneFooterView

-(UIImageView *)bigView {
    if (_bigView == nil) {
        self.bigView = [[UIImageView alloc]initWithFrame:CGRectMake(kWidthChange(20), kWidthChange(20), kScreenWidth - kWidthChange(40), kWidthChange(85))];
        self.bigView.backgroundColor = [UIColor redColor];
        self.bigView.layer.masksToBounds = YES;
        self.bigView.layer.cornerRadius = 5;
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




@end
