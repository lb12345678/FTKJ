//
//  HomeTwoHeaderView.m
//  FTKJ
//
//  Created by ios on 2019/11/19.
//  Copyright © 2019年 ios. All rights reserved.
//

#import "HomeTwoHeaderView.h"
#import "XSYHViewController.h"
#import "LJWeakProxy.h"
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
        self.MoreBT.frame = CGRectMake(kScreenWidth - kWidthChange(20) - [Toos textRect:@"更多 " textFont:[UIFont systemFontOfSize:kWidthChange(13)]] - kWidthChange(12), 0,  [Toos textRect:@"更多 " textFont:[UIFont systemFontOfSize:kWidthChange(13)]] + kWidthChange(12), kWidthChange(45));
        self.MoreBT.titleLabel.font = [UIFont systemFontOfSize:kWidthChange(13)];
        [self.MoreBT setImage:[UIImage imageNamed:@"box21"] forState:UIControlStateNormal];
        [self.MoreBT layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleRight imageTitleSpace:2 weight:2];
         
    }
    
    return _MoreBT;
    
}

-(NSMutableArray *)timeArray {
    if (_timeArray == nil) {
        self.timeArray = [NSMutableArray arrayWithCapacity:1];
    }
    return _timeArray;
    
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

-(void)setUpWithNewBigTimeStr:(NSString *)timeStr type:(NSString *)type{
    [self.timeView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    self.timeStr = timeStr;
    [self.timeArray removeAllObjects];
    
    
    if (self.addressTime) {
        [self.addressTime invalidate];
//        self.addressTime = nil;
    }
    
    
    
    
    self.addressTime = [NSTimer scheduledTimerWithTimeInterval:1 target:[LJWeakProxy proxyWithTarget:self] selector:@selector(updateAddress) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.addressTime forMode:NSRunLoopCommonModes];
    CGRect timeFrame = self.timeView.frame;
    
     CGRect oneFrame = self.oneLabel.frame;
    if ([type intValue] == 1) {
        timeFrame.origin.x = kScreenWidth - kWidthChange(140);
        self.MoreBT.hidden = YES;
        oneFrame.size.width = kScreenWidth;
        self.oneLabel.text = @"距离本场结束还有:";
        self.oneLabel.textColor = newColor(139, 140, 142, 1);
    }else {
        self.oneLabel.text = @"限时特价";
        self.oneLabel.textColor = newColor(239, 91, 70, 1);
          self.MoreBT.hidden = NO;
        
    }
    
    self.timeView.frame = timeFrame;
    
    self.oneLabel.frame = oneFrame;
    NSMutableArray *oneArray = [NSMutableArray arrayWithCapacity:1];
    [oneArray addObject:[NSString stringWithFormat:@"%02d",[timeStr intValue] / 3600 ]];
    [oneArray addObject:[NSString stringWithFormat:@"%02d",[timeStr intValue] / 60 % 60]];
    [oneArray addObject:[NSString stringWithFormat:@"%02d",[timeStr intValue] % 60]];
    
    for (int j = 0; j < 3; j++) {
        
        UILabel *oneLabel = [Toos setUpWithUserLabel:[oneArray objectAtIndex:j] CGRect:CGRectMake(j * kWidthChange(28) + j * kWidthChange(10), 0, kWidthChange(28), kWidthChange(20)) color:newColor(31, 31, 32, 1) textColor:newColor(255, 255, 255, 1) textSize:kWidthChange(12)];
        [self.timeView addSubview:oneLabel];
       
        oneLabel.layer.masksToBounds = YES;
        oneLabel.layer.cornerRadius = 2;
        
        oneLabel.textAlignment = NSTextAlignmentCenter;
        
        [self.timeArray addObject:oneLabel];
        UILabel *twoLabel = [Toos setUpWithUserLabel:@":" CGRect:CGRectMake( kWidthChange(28) + j * kWidthChange(38), 0, kWidthChange(10), kWidthChange(20)) color:newColor(255, 255, 255, 1) textColor:newColor(102, 103, 104, 1) textSize:kWidthChange(12)];
        [self.timeView addSubview:twoLabel];
        
        if (j == 2) {
            twoLabel.hidden = YES;
        }
        
        twoLabel.textAlignment = NSTextAlignmentCenter;
        
        
        
    }
    
  
}

- (void)dealloc {
    [self.addressTime invalidate];
    
    
}
-(void)updateAddress {
  
    int time = [self.timeStr intValue];
    
   
    
    if ([self.timeStr intValue] > 0) {
        
         time --;
        self.timeStr = [NSString stringWithFormat:@"%d",time];
        NSMutableArray *oneArray = [NSMutableArray arrayWithCapacity:1];
        [oneArray addObject:[NSString stringWithFormat:@"%02d",time / 3600 ]];
          [oneArray addObject:[NSString stringWithFormat:@"%02d",time / 60 % 60]];
         [oneArray addObject:[NSString stringWithFormat:@"%02d",time % 60]];
        for (int i = 0; i < self.timeArray.count; i++) {
            UILabel *timeLabel = (UILabel *)[self.timeArray objectAtIndex:i];
              timeLabel.text = [oneArray objectAtIndex:i];
        }
        
        
      
    }
}


@end
