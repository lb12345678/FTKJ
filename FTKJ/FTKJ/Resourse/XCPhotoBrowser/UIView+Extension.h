//  Created by 樊小聪  on 15/8/29.
//  Copyright (c) 2015年 macbookAir2. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Extension)

@property (nonatomic,assign)CGFloat top;
@property (nonatomic,assign)CGFloat bottom;
@property (nonatomic,assign)CGFloat left;
@property (nonatomic,assign)CGFloat right;

- (CGFloat)x;
- (void)setX:(CGFloat)x;

- (CGFloat)y;
- (void)setY:(CGFloat)y;

- (CGFloat)height;
- (void)setHeight:(CGFloat)height;

- (CGFloat)width;
- (void)setWidth:(CGFloat)width;

- (CGFloat)centerX;
- (void)setCenterX:(CGFloat)centerX;

- (CGPoint)origin;
- (void)setOrigin:(CGPoint)origin;

- (CGFloat)centerY;
- (void)setCenterY:(CGFloat)centerY;

- (CGSize)size;
- (void)setSize:(CGSize)size;

/**  起点x坐标  */
@property (nonatomic, assign) CGFloat x;
/**  起点y坐标  */
@property (nonatomic, assign) CGFloat y;
/**  中心点x坐标  */
@property (nonatomic, assign) CGFloat centerX;
/**  中心点y坐标  */
@property (nonatomic, assign) CGFloat centerY;
/**  宽度  */
@property (nonatomic, assign) CGFloat width;
/**  高度  */
@property (nonatomic, assign) CGFloat height;
/**  顶部  */

/**  size  */
@property (nonatomic, assign) CGSize size;
/**  origin */
@property (nonatomic, assign) CGPoint origin;

@property (nonatomic, assign, readonly) CGFloat halfHeight;
@property (nonatomic, assign, readonly) CGFloat halfWidth;
@property (nonatomic, assign) IBInspectable CGFloat cornerRadius;

/** 最大 X */
@property (nonatomic, assign) CGFloat maxX;
/** 最大 Y */
@property (nonatomic, assign) CGFloat maxY;
/// 同时设置 maxX 和 maxY
@property (nonatomic, assign) CGPoint maxOrigin;
/**  设置圆角  */
- (void)rounded:(CGFloat)cornerRadius;

/**  设置圆角和边框  */
- (void)rounded:(CGFloat)cornerRadius width:(CGFloat)borderWidth color:(UIColor *)borderColor;

/**  设置边框  */
- (void)border:(CGFloat)borderWidth color:(UIColor *)borderColor;

/**   给哪几个角设置圆角  */
-(void)round:(CGFloat)cornerRadius RectCorners:(UIRectCorner)rectCorner;

/**  设置阴影  */
-(void)shadow:(UIColor *)shadowColor opacity:(CGFloat)opacity radius:(CGFloat)radius offset:(CGSize)offset;

- (UIViewController *)viewController;

+ (CGFloat)getLabelHeightByWidth:(CGFloat)width Title:(NSString *)title font:(UIFont *)font;


/**
 *  手势事件
 */
@property (nullable, copy, nonatomic) void(^tapGestureHandle)(UITapGestureRecognizer * _Nullable gesture, UIView * _Nullable tapView);


@end





