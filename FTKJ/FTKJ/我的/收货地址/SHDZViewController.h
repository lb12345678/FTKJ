//
//  SHDZViewController.h
//  JZGL
//
//  Created by ios on 2019/8/9.
//  Copyright © 2019年 ios. All rights reserved.
//

#import "BaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface SHDZViewController : BaseViewController

@property(nonatomic,copy)void(^ClickBlock)(NSDictionary *tempDic);

@end

NS_ASSUME_NONNULL_END
