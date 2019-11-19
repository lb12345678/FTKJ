//
//  LBAlertView.h
//  BHXC
//
//  Created by ios on 2017/10/9.
//  Copyright © 2017年 ios. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void(^AlertResult)(NSInteger index,NSString *text);

@interface LBAlertView : UIView


@property(nonatomic,assign)NSInteger number;

@property(nonatomic,retain)UIColor *color;


@property (nonatomic,copy) AlertResult resultIndex;

- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message sureBtn:(NSString *)sureTitle cancleBtn:(NSString *)cancleTitle number:(NSInteger)number color:(UIColor *)color;

- (void)showXLAlertView;




@end
