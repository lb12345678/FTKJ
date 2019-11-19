//
//  CustomView.m
//  ZZLM
//
//  Created by ios on 2017/6/20.
//  Copyright © 2017年 ios. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView



- (CGRect)caretRectForPosition:(UITextPosition *)position
{
    CGRect originalRect = [super caretRectForPosition:position];
    
    originalRect.size.height = self.font.lineHeight + 40;
    originalRect.size.width = 2;
    originalRect.origin.y = 10;
    
    return originalRect;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
