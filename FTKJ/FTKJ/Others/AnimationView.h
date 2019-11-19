//
//  AnimationView.h
//  KuaiPai
//
//  Created by ios on 2018/7/18.
//  Copyright © 2018年 ios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AnimationView : UIView


@property(nonatomic,retain)NSString *title;

@property(nonatomic,retain)NSString *imageName;

@property(nonatomic,retain)UIView *bigView;

@property(nonatomic,retain)UIImageView *animationImage;


- (void)setUpWithMessage:(NSString *)title messageImage:(NSString *)imageName;

@end
