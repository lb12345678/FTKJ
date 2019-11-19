//
//  UIFont+Setting.m
//  ZJS
//
//  Created by ios on 2018/11/5.
//  Copyright © 2018年 ios. All rights reserved.
//

#import "UIFont+Setting.h"

@implementation UIFont (Setting)

+(UIFont *)setFontWithSize:(CGFloat)size {
    CGFloat fontSize = [[NSUserDefaults standardUserDefaults]floatForKey:@"fontSize"];
    
    UIFont *myFont;
    
    myFont = [UIFont systemFontOfSize:size * kWidthChange(12) / kWidthChange(14)  + fontSize * 6] ;
    
    
//    if (size < kWidthChange(12)) {
//
//    12 + size / 12 * 6
//
//         myFont = [UIFont systemFontOfSize:size * 0.86 + fontSize * 6];
//    }else {
//
//       myFont = [UIFont systemFontOfSize:12 + fontSize * 6];
//
//    }
    
////   if (fontSize < 0.33) {
////       myFont = [UIFont systemFontOfSize:size - fontSize * size];
////    }
////    else {
//        myFont = [UIFont systemFontOfSize:size + fontSize * 6];
////    }
    
    
//    CGFloat fontS = 2 * fontSize * size;
//    
//    UIFont *myFont = [UIFont systemFontOfSize:fontS + size];
    
    return myFont;
    
}




@end
