//
//  UIViewController+BackButtonHandler.h
//  TTC_ios
//
//  Created by casic on 2018/10/22.
//  Copyright © 2018年 弹指婆婆纳. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol BackButtonHandlerProtocol <NSObject>

@optional

// Override this method in UIViewController derived class to handle 'Back' button click

- (BOOL)navigationShouldPopOnBackButton;

@end
@interface UIViewController (BackButtonHandler)<BackButtonHandlerProtocol>

@end


