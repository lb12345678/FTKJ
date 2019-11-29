//  Created by 樊小聪  on 15/8/29.
//  Copyright (c) 2015年 macbookAir2. All rights reserved.
//

#import "UIView+Extension.h"
#import <objc/runtime.h>

@implementation UIView (Extension)

- (CGFloat)x {
    return self.frame.origin.x;
}
- (void)setX:(CGFloat)x {
    CGRect tempRect = self.frame;
    tempRect.origin.x = x;
    self.frame = tempRect;
}

- (CGFloat)y {
    return self.frame.origin.y;
}


- (void)setY:(CGFloat)y {
    CGRect tempRect = self.frame;
    tempRect.origin.y = y;
    self.frame = tempRect;
}


- (CGFloat)height {
    return self.frame.size.height;
}


- (void)setHeight:(CGFloat)height {
    
    CGRect tempRect = self.frame;
    tempRect.size.height = height;
    self.frame = tempRect;
}

- (CGFloat)width {
    return self.frame.size.width;
}


- (void)setWidth:(CGFloat)width {
    CGRect tempRect = self.frame;
    tempRect.size.width = width;
    self.frame = tempRect;
}

- (CGFloat)centerX {
    return self.center.x;
}
- (void)setCenterX:(CGFloat)centerX {
    CGPoint point = self.center;
    point.x = centerX;
    self.center = point;
}

- (CGFloat)centerY {
    return self.center.y;
}
- (void)setCenterY:(CGFloat)centerY {
    CGPoint point = self.center;
    point.y = centerY;
    self.center = point;
}

- (CGPoint)origin {
    return self.frame.origin;
}
- (void)setOrigin:(CGPoint)origin {
    CGRect rect = self.frame;
    rect.origin = origin;
    self.frame = rect;
}

- (CGSize)size {
    return self.frame.size;
}
- (void)setSize:(CGSize)size {
    CGRect rect = self.frame;
    rect.size = size;
    self.frame = rect;
}

- (void) setTop:(CGFloat)t {
    self.frame = CGRectMake(self.left, t, self.width, self.height);
}
- (CGFloat) top {
    return self.frame.origin.y;
}
- (void) setBottom:(CGFloat)b {
    self.frame = CGRectMake(self.left,b-self.height,self.width,self.height);
}
- (CGFloat) bottom {
    return self.frame.origin.y + self.frame.size.height;
}
- (void) setLeft:(CGFloat)l {
    self.frame = CGRectMake(l,self.top,self.width,self.height);
}
- (CGFloat) left {
    return self.frame.origin.x;
}
- (void) setRight:(CGFloat)r {
    self.frame = CGRectMake(r-self.width,self.top,self.width,self.height);
}
- (CGFloat) right {
    return self.frame.origin.x + self.frame.size.width;
}

static char event_key;

- (void)setTapGestureHandle:(void (^)(UITapGestureRecognizer *, UIView *))tapGestureHandle
{
    self.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapHandle:)];
    
    [self addGestureRecognizer:tapGesture];
    
    objc_setAssociatedObject(self, &event_key, tapGestureHandle, OBJC_ASSOCIATION_COPY);
}

- (void (^)(UITapGestureRecognizer *, UIView *))tapGestureHandle
{
    return objc_getAssociatedObject(self, &event_key);
}



- (void)didTapHandle:(UITapGestureRecognizer *)tap
{
    void (^tapGestureHandle)(UITapGestureRecognizer *tap, UIView *tapView) = objc_getAssociatedObject(self, &event_key);
    
    if (tapGestureHandle)
    {
        tapGestureHandle(tap, tap.view);
    }
}






#pragma mark - layer
- (void)rounded:(CGFloat)cornerRadius {
    [self rounded:cornerRadius width:0 color:nil];
}

- (void)border:(CGFloat)borderWidth color:(UIColor *)borderColor {
    [self rounded:0 width:borderWidth color:borderColor];
}

- (void)rounded:(CGFloat)cornerRadius width:(CGFloat)borderWidth color:(UIColor *)borderColor {
    self.layer.cornerRadius = cornerRadius;
    self.layer.borderWidth = borderWidth;
    self.layer.borderColor = [borderColor CGColor];
    self.layer.masksToBounds = YES;
}


-(void)round:(CGFloat)cornerRadius RectCorners:(UIRectCorner)rectCorner {
    
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:rectCorner cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}


-(void)shadow:(UIColor *)shadowColor opacity:(CGFloat)opacity radius:(CGFloat)radius offset:(CGSize)offset {
    //给Cell设置阴影效果
    self.layer.masksToBounds = NO;
    self.layer.shadowColor = shadowColor.CGColor;
    self.layer.shadowOpacity = opacity;
    self.layer.shadowRadius = radius;
    self.layer.shadowOffset = offset;
}


#pragma mark - base
- (UIViewController *)viewController {
    
    id nextResponder = [self nextResponder];
    while (nextResponder != nil) {
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            UIViewController *vc = (UIViewController *)nextResponder;
            return vc;
        }
        nextResponder = [nextResponder nextResponder];
    }
    return nil;
}

+ (CGFloat)getLabelHeightByWidth:(CGFloat)width Title:(NSString *)title font:(UIFont *)font {
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, 0)];
    label.text = title;
    label.font = font;
    label.numberOfLines = 0;
    [label sizeToFit];
    CGFloat height = label.frame.size.height;
    return height;
}
- (CGFloat)halfWidth {
    return CGRectGetWidth(self.frame) * 0.5;
}

- (CGFloat)halfHeight {
    return CGRectGetHeight(self.frame) * 0.5;
}

- (CGFloat)cornerRadius {
    return self.layer.cornerRadius;
}


- (void)setCornerRadius:(CGFloat)cornerRadius {
    self.layer.cornerRadius = cornerRadius;
    self.layer.masksToBounds = YES;
    
    
    
    
    
}

- (void)setCornerRadius:(CGFloat)cornerRadius rounding:(UIRectCorner)rounding {
    
    CAShapeLayer * layer = [CAShapeLayer layer];
    UIBezierPath * path = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:rounding cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];
    layer.path = path.CGPath;
    self.layer.mask = layer;
}


- (CGFloat)maxX {
    return CGRectGetMaxX(self.frame);
}
- (void)setMaxX:(CGFloat)maxX {
    self.x = maxX - CGRectGetWidth(self.frame);
}

- (CGFloat)maxY {
    return CGRectGetMaxY(self.frame);
}
- (void)setMaxY:(CGFloat)maxY {
    self.y = maxY - CGRectGetHeight(self.frame);
}

- (void)setMaxOrigin:(CGPoint)maxOrigin {
    CGRect frame = self.frame;
    frame.origin = CGPointMake(maxOrigin.x - CGRectGetWidth(self.frame), maxOrigin.y - CGRectGetHeight(self.frame));
    self.frame = frame;
}

- (CGPoint)maxOrigin {
    return CGPointMake(CGRectGetMaxX(self.frame), CGRectGetMaxY(self.frame));
}
@end








