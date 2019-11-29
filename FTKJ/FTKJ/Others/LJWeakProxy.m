//
//  LJWeakProxy.m
//  CarRescueCompany
//
//  Created by ios on 2019/4/11.
//  Copyright © 2019年 xiayin. All rights reserved.
//

#import "LJWeakProxy.h"

@implementation LJWeakProxy
+ (instancetype)proxyWithTarget:(id)target {
    LJWeakProxy *proxy = [LJWeakProxy alloc];
    proxy.target = target;
    return proxy;
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel {
    return [self.target methodSignatureForSelector:sel];
}

- (void)forwardInvocation:(NSInvocation *)invocation {
    [invocation invokeWithTarget:self.target];
}
@end
