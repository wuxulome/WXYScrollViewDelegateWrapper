//
//  WXYScrollViewDelegateWrapper.m
//  WXYScrollViewDelegateWrapperDemo
//
//  Created by Lome on 16/2/25.
//  Copyright © 2016年 wuxu. All rights reserved.
//

#import "WXYScrollViewDelegateWrapper.h"

@implementation WXYScrollViewDelegateWrapper

- (BOOL)respondsToSelector:(SEL)aSelector
{
    if (!_delegate) {
        NSLog(@"call selector:%s", sel_getName(aSelector));
        return NO;
    }
    
    return [_delegate respondsToSelector:aSelector];
}

- (id)forwardingTargetForSelector:(SEL)aSelector
{
    if (_delegate) {
        return _delegate;
    }
    return [super forwardingTargetForSelector:aSelector];
}

@end
