//
//  CHDevice.h
//  TTC_ios
//
//  Created by 弹指婆婆纳 on 2018/9/17.
//  Copyright © 2018年 弹指婆婆纳. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <sys/utsname.h>
#define W 640
@interface CHDevice : NSObject

+(float)getW:(float)w;
+(float)byW:(float)w;

+(UIFont*)boldSystemFontSize:(CGFloat)fontSize;
+(UIFont*)systemFontSize:(CGFloat)fontSize;

+(UIFont*)BiBoldSystemFontSize:(CGFloat)fontSize;
+(UIFont*)BiSystemFontSize:(CGFloat)fontSize;

@end
