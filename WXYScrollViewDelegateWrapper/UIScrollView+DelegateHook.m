//
//  UIScrollView+DelegateHook.m
//  WXYScrollViewDelegateWrapper
//
//  Created by wuxu on 16/2/25.
//  Copyright © 2016年 wuxu. All rights reserved.
//

#import "UIScrollView+DelegateHook.h"
#import "WXYScrollViewDelegateWrapper.h"
#import <objc/runtime.h>

@implementation UIScrollView (DelegateHook)
@dynamic wrapper;

+ (void)load
{
    [self delegateHook_start];
}

+ (void)delegateHook_start
{
    Class aclass = NSClassFromString(@"UIScrollView");
    
    Method setDelegateMethod = class_getInstanceMethod(aclass, @selector(setDelegate:));
    Method newSetDelegateMethod = class_getInstanceMethod([self class], @selector(hook_setDelegate:));
    
    method_exchangeImplementations(newSetDelegateMethod, setDelegateMethod);
}

- (void)hook_setDelegate:(id)delegate
{
    if (self.wrapper.delegate != delegate) {
        if (!self.wrapper) {
            self.wrapper = [WXYScrollViewDelegateWrapper new];
        }
        self.wrapper.delegate = delegate;
        
        [self hook_setDelegate:self.wrapper];
    }
}

- (WXYScrollViewDelegateWrapper *)wrapper
{
    return objc_getAssociatedObject(self, @selector(wrapper));
}

- (void)setWrapper:(WXYScrollViewDelegateWrapper *)wrapper
{
    objc_setAssociatedObject(self, @selector(wrapper), wrapper, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


@end
