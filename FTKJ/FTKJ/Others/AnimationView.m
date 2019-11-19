//
//  AnimationView.m
//  KuaiPai
//
//  Created by ios on 2018/7/18.
//  Copyright © 2018年 ios. All rights reserved.
//

#import "AnimationView.h"

@interface AnimationView()



@end

@implementation AnimationView

-(void)layoutSubviews {
    [super layoutSubviews];
    
    self.bigView = [[UIView alloc]initWithFrame:CGRectMake(kScreenWidth / 2 - (([Toos textRect:self.title textFont:[UIFont systemFontOfSize:14]] + 30 + 10 + 24)) / 2, (kScreenHeight - kTopHeight) / 2 - 20, (([Toos textRect:self.title textFont:[UIFont systemFontOfSize:14]] + 30 + 10 + 24)), 40)];
    self.bigView.backgroundColor = [UIColor redColor];
    self.bigView.layer.masksToBounds = YES;
    self.bigView.layer.cornerRadius = 20;
    [self addSubview:self.bigView];
    UILabel *oneLabel = [Toos setUpWithUserLabel:self.title CGRect:CGRectMake(15, 0, [Toos textRect:self.title textFont:[UIFont systemFontOfSize:14]], 40) color:[UIColor whiteColor] textColor:newColor(250, 137, 17, 1) textSize:14];
    [self.bigView addSubview:oneLabel];
    [self bringSubviewToFront:self.bigView];
    
    
    
    self.animationImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:self.imageName]];
    
    self.animationImage.frame = CGRectMake(CGRectGetMaxX(oneLabel.frame) + 15, 8, 24, 24);
    [self.bigView addSubview:self.animationImage];
    
    [self.animationImage.layer addAnimation:[self rotation:1 degree: M_PI_2 direction:80 repeatCount:MAXFLOAT] forKey:nil];
    
    
    
}
#pragma mark----动画旋转
-(CABasicAnimation *)rotation:(float)dur degree:(float)degree direction:(int)direction repeatCount:(int)repeatCount
{
    CATransform3D rotationTransform = CATransform3DMakeRotation(degree, 0, 0, direction);
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform"];
    animation.toValue = [NSValue valueWithCATransform3D:rotationTransform];
    animation.duration  =  dur;
    animation.autoreverses = NO;
    animation.cumulative = YES;
    
    animation.fillMode = kCAFillModeForwards;
    animation.repeatCount = repeatCount;
    
    return animation;
    
}
- (void)setUpWithMessage:(NSString *)title messageImage:(NSString *)imageName {
    
}

@end
