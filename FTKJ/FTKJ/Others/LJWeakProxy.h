//
//  LJWeakProxy.h
//  CarRescueCompany
//
//  Created by ios on 2019/4/11.
//  Copyright © 2019年 xiayin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LJWeakProxy : NSProxy

+ (instancetype)proxyWithTarget:(id)target;
@property (weak, nonatomic) id target;
@end

NS_ASSUME_NONNULL_END
