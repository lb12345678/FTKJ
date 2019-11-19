//
//  AllSearchView.m
//  TTZS
//
//  Created by ios on 2018/4/12.
//  Copyright © 2018年 ios. All rights reserved.
//

#import "AllSearchView.h"
@interface AllSearchView()

@property(nonatomic,retain)UIView *bigView;

@end

@implementation AllSearchView

-(void)layoutSubviews {
    [super layoutSubviews];
    
    self.bigView = [[UIView alloc]init];
    self.bigView.backgroundColor = [UIColor whiteColor];
    self.bigView.frame = CGRectMake(0, 0, kScreenWidth, self.frame.size.height);
   
    [self addSubview:self.bigView];
    
    for (int i = 0; i < self.dataArray.count; i++) {
        
        UIButton *newBT = [UIButton buttonWithType:UIButtonTypeCustom];
        newBT.frame = CGRectMake(i * kScreenWidth / self.dataArray.count, 0, kScreenWidth / self.dataArray.count, self.frame.size.height);
        [newBT setTitle:[self.dataArray objectAtIndex:i] forState:UIControlStateNormal];
        newBT.tag = i + 100;
        if (i == 0) {
            [newBT setTitleColor:newColor(45, 45, 45, 1) forState:UIControlStateNormal];
            newBT.titleLabel.font = [UIFont setFontWithSize:kWidthChange(19)];
        }else {
             [newBT setTitleColor:newColor(119, 119, 119, 1) forState:UIControlStateNormal];
              newBT.titleLabel.font = [UIFont setFontWithSize:kWidthChange(15)];
        }
        
        [self.bigView addSubview:newBT];
        [newBT addTarget:self action:@selector(clickTag:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    

    UILabel *linelabel = [Toos setUpWithUserLabel:@"" CGRect:CGRectMake(0, self.frame.size.height - 0.6, kScreenWidth, 0.6) color:lineColor_gary textColor:RedColor textSize:14];
    [self.bigView addSubview:linelabel];
    
    
}

-(void)clickTag:(UIButton *)sender {
    
    
    for (int i = 100; i < self.dataArray.count + 100; i++) {
        
        UIButton *newBT = (UIButton *)[self.bigView viewWithTag:i];
        if (newBT == sender) {
            [sender setTitleColor:newColor(45, 45, 45, 1) forState:UIControlStateNormal];
            sender.titleLabel.font = [UIFont setFontWithSize:kWidthChange(19)];
        }else {
            [newBT setTitleColor:newColor(119, 119, 119, 1) forState:UIControlStateNormal];
            newBT.titleLabel.font = [UIFont setFontWithSize:kWidthChange(15)];
        }
        
        
    }
    
    if (self.ClickBlock) {
        self.ClickBlock(sender.tag - 100);
    }
    
    
}



@end
