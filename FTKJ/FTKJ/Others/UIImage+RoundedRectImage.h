//
//  UIImage+RoundedRectImage.h
//  ZZLM
//
//  Created by ios on 2017/7/28.
//  Copyright © 2017年 ios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (RoundedRectImage)
+ (UIImage *)createRoundedRectImage:(UIImage *)image withSize:(CGSize)size withRadius:(NSInteger)radius;
@end
