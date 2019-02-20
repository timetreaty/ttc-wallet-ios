//
//  UINavigationController+ShouldPopOnBackButton.m
//  TTC_ios
//
//  Created by casic on 2018/10/22.
//  Copyright © 2018年 弹指婆婆纳. All rights reserved.
//

#import "UINavigationController+ShouldPopOnBackButton.h"

@implementation UINavigationController (ShouldPopOnBackButton)
- (BOOL)navigationBar:(UINavigationBar *)navigationBar shouldPopItem:(UINavigationItem*)item {
    if ([self.viewControllers count] < [navigationBar.items count]) {
        return YES;
    }
    UIViewController* vc = [self topViewController];
    if([vc respondsToSelector:@selector(navigationShouldPopOnBackButton)]) {
        [vc navigationShouldPopOnBackButton];
    }else {
        [self popViewControllerAnimated:YES];
    }
    return NO;
}

@end
