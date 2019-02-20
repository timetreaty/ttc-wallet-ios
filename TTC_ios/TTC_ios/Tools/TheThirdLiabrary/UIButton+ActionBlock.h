//
//  UIButton+ActionBlock.h
//  KJ
//
//  Created by chenghao on 2017/10/10.
//  Copyright © 2017年 cpcp5588.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <objc/runtime.h>
@interface UIButton (ActionBlock)
typedef void (^VoidBlock)(void);
+(UIButton*)initWithFrame:(CGRect)frame andBgColor:(UIColor*)color andTitleColor:(UIColor*)titleColor andFont:(float)font andImage:(UIImage*)image andTitle:(NSString*)title andBorderRadius:(float)radius andActionBlock:(VoidBlock)action;
+(UIButton*)initWithTitle:(NSString*)title  andActionBlock:(VoidBlock)action;
+(UIButton*)initActionBlock:(VoidBlock)action;
@end
