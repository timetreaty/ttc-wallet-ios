//
//  Tool
//  TTC_ios
//
//  Created by 弹指婆婆纳 on 2018/9/26.
//  Copyright © 2018年 弹指婆婆纳. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Tool : NSObject

/**
 *  显示提示信息
 *
 *  @param content  提示内容
 *  @param selfView 提示信息所在的页面
 */
+ (void)showPromptContent:(NSString *)content onView:(UIView *)selfView;

/**
 *  显示提示信息
 *
 *  @param please  提示内容
 *  @param showView 提示信息所在的页面
 */
+ (void)progressPlease:(NSString *)please showView:(UIView *)showView;

/**
 *  显示详细提示信息
 *
 *  @param content  提示内容
 *  @param selfView 提示信息所在的页面
 */
+ (void)showPromptDetailContent:(NSString *)content onView:(UIView *)selfView delay:(NSTimeInterval)delay;

/**
 *  present ViewController
 *
 *  @param viewController        presenting viewController
 *  @param presentViewController presented viewController
 *  @param animated              animation
 */
+ (void)presentModalFromViewController:(UIViewController *)viewController
                 presentViewController:(UIViewController *)presentViewController
                              animated:(BOOL)animated;

/**
 *  dismiss viewController
 *
 *  @param dismissViewController dismissed viewController
 *  @param animated              animation
 */
+ (void)dismissModalViewController:(UIViewController *)dismissViewController
                          animated:(BOOL)animated;

/*
 * 检查手机号是否合法
 *
 */
+ (BOOL)isMobileNumberClassification:(NSString*)phone;


/*
 * 邮箱地址的正则表达式
 *
 */
+ (BOOL)isValidateEmail:(NSString *)email;

/**
 *  统一收起键盘
 */
+ (void)hideAllKeyboard;

/**
 * 判断内容是否全部为空格  yes 全部为空格  no 不是
 */
+ (BOOL) isEmpty:(NSString *) str ;

/**
 * 时间转换
 */
+ (NSString *)returndate:(NSString *)num;
@end
