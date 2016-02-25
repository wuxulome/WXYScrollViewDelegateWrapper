//
//  UIScrollView+DelegateHook.h
//  WXYScrollViewDelegateWrapper
//
//  Created by wuxu on 16/2/25.
//  Copyright © 2016年 wuxu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WXYScrollViewDelegateWrapper;

@interface UIScrollView (DelegateHook)

@property (nonatomic, strong) WXYScrollViewDelegateWrapper *wrapper;

@end
