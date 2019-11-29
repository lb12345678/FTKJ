//
//  THYYView.h
//  JZGL
//
//  Created by ios on 2019/8/23.
//  Copyright © 2019年 ios. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface THYYView : UIView

@property(nonatomic,retain)NSMutableArray *dataArray;

@property(nonatomic,copy)void(^clickBlock)(NSString *newId);

@end

NS_ASSUME_NONNULL_END
