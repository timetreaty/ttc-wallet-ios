//
//  ColorUtils.m
//  TwitterFon
//
//  Created by kaz on 7/21/08.
//  Copyright 2008 naan studio. All rights reserved.
//

#import "UIColor-Extension.h"
@implementation UIColor (Extension)
+ (UIColor *)colorWithRGBRed:(CGFloat)red green:(CGFloat)green  blue:(CGFloat)blue {
    return [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:1.0];
}



+ (UIColor*)colorWithNumber:(NSUInteger)number
{
    NSUInteger red = (number >> 16) & 0xff, green = (number >> 8) & 0xff, blue = number & 0xff;
    return [UIColor colorWithRed:(float)red / 255
                           green:(float)green / 255
                            blue:(float)blue / 255
                           alpha:1];
}

+ (UIColor *) colorWithHexString: (NSString *)color
{
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6 && [cString length] != 8)
        return [UIColor clearColor];
    
    // Separate into r, g, b substrings
    NSRange range;
    NSInteger offset = 0;
    if([cString length] ==8){
        offset = 2;
    }
    range.location = 0 + offset;
    range.length = 2;
    
    //r
    NSString *rString = [cString substringWithRange:range];
    
    //g
    range.location = 2 + offset;
    NSString *gString = [cString substringWithRange:range];
    
    //b
    range.location = 4 + offset;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b,a;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    if([cString length] ==8){
        range.location = 0;
        NSString *aString = [cString substringWithRange:range];
        [[NSScanner scannerWithString:aString] scanHexInt:&a];
    }else{
        a = 255;
    }
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:((float) a / 255.0f)];
}
+ (UIColor *) colorWithHexString: (NSString *)color andAlpha:(float)alpha
{
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6 && [cString length] != 8)
        return [UIColor clearColor];
    
    // Separate into r, g, b substrings
    NSRange range;
    NSInteger offset = 0;
    if([cString length] ==8){
        offset = 2;
    }
    range.location = 0 + offset;
    range.length = 2;
    
    //r
    NSString *rString = [cString substringWithRange:range];
    
    //g
    range.location = 2 + offset;
    NSString *gString = [cString substringWithRange:range];
    
    //b
    range.location = 4 + offset;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:alpha];
}
@end
