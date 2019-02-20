//
//  CHDevice.m
//  TTC_ios
//
//  Created by 弹指婆婆纳 on 2018/9/17.
//  Copyright © 2018年 弹指婆婆纳. All rights reserved.
//
#import "CHDevice.h"
@implementation CHDevice

+(float)byW:(float)w{
    return w/(W/[UIScreen mainScreen].bounds.size.width);
}
+(float)getW:(float)w{
    return w*(W/[UIScreen mainScreen].bounds.size.width);
}

+ (CGFloat)GetBI
{
    return W/[UIScreen mainScreen].bounds.size.width;
}

+(UIFont*)BiBoldSystemFontSize:(CGFloat)fontSize{
     return [UIFont boldSystemFontOfSize:FontSize(fontSize)];
//    return [UIFont boldSystemFontOfSize:fontSize/[self GetBI]];
}

+(UIFont*)BiSystemFontSize:(CGFloat)fontSize{
 
    return [UIFont systemFontOfSize:FontSize(fontSize)];
//    return [UIFont systemFontOfSize:fontSize/[self GetBI]];
}

+(UIFont*)boldSystemFontSize:(CGFloat)fontSize{
    return [UIFont boldSystemFontOfSize:FontSize(fontSize)];
//    return [UIFont boldSystemFontOfSize:fontSize/bi];
}

+(UIFont*)systemFontSize:(CGFloat)fontSize{
     return [UIFont systemFontOfSize:FontSize(fontSize)];
//    return [UIFont systemFontOfSize:fontSize/bi];
}

@end
