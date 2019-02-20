//
//  Tool.m
//  TTC_ios
//
//  Created by 弹指婆婆纳 on 2018/9/26.
//  Copyright © 2018年 弹指婆婆纳. All rights reserved.
//
#import "Tool.h"
#import "MBProgressHUD.h"
#import <SystemConfiguration/CaptiveNetwork.h>
#import <CommonCrypto/CommonCrypto.h>
#import "UIImage+GIF.h"
//#import <MessageUI/MFMessageComposeViewController.h>


#define IOS6_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 6.0)

@implementation Tool

/**
 *  显示提示信息
 *
 *  @param content  提示内容
 *  @param selfView 提示信息所在的页面
 */
+ (void)showPromptContent:(NSString *)content onView:(UIView *)selfView
{
    MBProgressHUD *HUD = [MBProgressHUD showHUDAddedTo:selfView animated:YES];
    HUD.mode = MBProgressHUDModeText;
    HUD.label.text = content;
    HUD.margin = 15.f;
    HUD.yOffset = 90.f ;
    HUD.removeFromSuperViewOnHide = YES;
    [HUD hideAnimated:YES afterDelay:1];
    HUD.color = [UIColor colorWithRed:218/255.0 green:218/255.0 blue:218/255.0 alpha:1.0];
//    HUD.yOffset = (SCREEN_HEIGHT*0.5 - [CHDevice byW:100]-Height_TabBar);
//    HUD.bezelView.layer.cornerRadius = 20.0;
//    CGSize size = [HUD.label.text sizeWithAttributes:@{NSFontAttributeName:HUD.label.font}];
//    HUD.offset = CGPointMake((SCREEN_WIDTH-size.width-HUD.margin*2)*0.5, SCREEN_HEIGHT -[CHDevice byW:100+Height_TabBar]);
    
}
/**
 *  显示提示信息
 *
 *  @param please  提示内容
 *  @param showView 提示信息所在的页面
 */
+ (void)progressPlease:(NSString *)please showView:(UIView *)showView
{
    if ([please isEqualToString:@"success"]) {
//        MBProgressHUD *hub = (MBProgressHUD *)[showView viewWithTag:109];
         MBProgressHUD *hub = [MBProgressHUD HUDForView:showView];
        hub.removeFromSuperViewOnHide = YES;
        [hub hideAnimated:YES afterDelay:1];
    }
    else
    {
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:showView animated:YES];
        hud.tag = 109;
        hud.backgroundColor =[UIColor clearColor];
//        hud.label.text = [NSString stringWithFormat:@"%@,请稍后...", please];
        hud.label.text = [NSString stringWithFormat:@"拼命加载中..."];

        hud.margin = 10.f;
//        UIImageView *littleView = [[UIImageView alloc] init];
//
//        NSString *path = [[NSBundle mainBundle] pathForResource:@"gifTest" ofType:@"gif"];
//        NSData *data = [NSData dataWithContentsOfFile:path];
//        UIImage *image = [UIImage sd_animatedGIFWithData:data];
//        littleView.image = image;
//        hud.customView = littleView;
//        hud.animationType = MBProgressHUDAnimationZoom;
        hud.mode = MBProgressHUDModeCustomView;
        
        hud.color = [UIColor colorWithRed:218/255.0 green:218/255.0 blue:218/255.0 alpha:1.0];
//        hud.yOffset = (SCREEN_HEIGHT*0.5 - [CHDevice byW:100]-Height_TabBar);
//        hud.bezelView.layer.cornerRadius = 20.0;
    }
    
}
/**
 *  显示提示信息
 *
 *  @param content  提示内容
 *  @param selfView 提示信息所在的页面
 */
+ (void)showPromptDetailContent:(NSString *)content onView:(UIView *)selfView delay:(NSTimeInterval)delay
{
    MBProgressHUD *HUD = [MBProgressHUD showHUDAddedTo:selfView animated:YES];
    HUD.mode = MBProgressHUDModeText;
//    HUD.detailsLabel.text = content;
    HUD.detailsLabel.text = @"拼命加载中...";
    HUD.margin = 10.f;
    HUD.yOffset = 90.f ;
    HUD.removeFromSuperViewOnHide = YES;
    [HUD hideAnimated:YES afterDelay:delay];
    
    HUD.color = [UIColor colorWithRed:218/255.0 green:218/255.0 blue:218/255.0 alpha:1.0];
//    HUD.yOffset = (SCREEN_HEIGHT*0.5 - [CHDevice byW:100]-Height_TabBar);
//    HUD.bezelView.layer.cornerRadius = 20.0;
}


/**
 *  present ViewController
 *
 *  @param viewController        presenting viewController
 *  @param presentViewController presented viewController
 *  @param animated              animation
 */
+ (void)presentModalFromViewController:(UIViewController *)viewController
                 presentViewController:(UIViewController *)presentViewController
                              animated:(BOOL)animated
{
    if (IOS6_OR_LATER)
    {
        [viewController presentViewController:presentViewController
                                     animated:animated
                                   completion:nil];
    }
    else
    {
        [viewController presentViewController:presentViewController animated:YES completion:nil];
    }
}

/**
 *  dismiss viewController
 *
 *  @param dismissViewController dismissed viewController
 *  @param animated              animation
 */
+ (void)dismissModalViewController:(UIViewController *)dismissViewController
                          animated:(BOOL)animated
{
    if (IOS6_OR_LATER)
    {
        [dismissViewController dismissViewControllerAnimated:animated completion:nil];
    }
    else
    {
        [dismissViewController dismissViewControllerAnimated:YES completion:nil];
    }
}

+ (BOOL)isMobileNumberClassification:(NSString*)phone
{
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188,1705
     * 联通：130,131,132,152,155,156,185,186,1709
     * 电信：133,1349,153,180,189,1700
     */
    //    NSString * MOBILE = @"^1((3//d|5[0-35-9]|8[025-9])//d|70[059])\\d{7}$";//总况
    
    /**
     10         * 中国移动：China Mobile
     11         * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188，1705
     12         */
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d|705)\\d{7}$";
    /**
     15         * 中国联通：China Unicom
     16         * 130,131,132,152,155,156,185,186,1709
     17         */
    NSString * CU = @"^1((3[0-2]|5[256]|8[56])\\d|709)\\d{7}$";
    /**
     20         * 中国电信：China Telecom
     21         * 133,1349,153,180,189,1700
     22         */
    NSString * CT = @"^1((33|53|8[09])\\d|349|700)\\d{7}$";
    
    
    /**
     25         * 大陆地区固话及小灵通
     26         * 区号：010,020,021,022,023,024,025,027,028,029
     27         * 号码：七位或八位
     28         */
    NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    
    NSString * ten = @"(^1[3,4,5,7,8]\\d{9}$)";
    NSString * MOBILE = @"^(13[0-9]|14[579]|15[0-3,5-9]|16[6]|17[0135678]|18[0-9]|19[89])\\d{8}$";
    //    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    NSPredicate *regextestphs = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",PHS];
    
    NSPredicate *regextestten = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",ten];
    NSPredicate *regextestMOBILE = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    if (([regextestcm evaluateWithObject:phone] == YES)
        || ([regextestct evaluateWithObject:phone] == YES)
        || ([regextestcu evaluateWithObject:phone] == YES)
        || ([regextestphs evaluateWithObject:phone] == YES)
        || ([regextestten evaluateWithObject:phone] == YES)
        || ([regextestMOBILE evaluateWithObject:phone] == YES))
    {
        return YES;
    }
    else
    {
        return NO;
    }
}
/*
 * 邮箱地址的正则表达式
 *
 */
+ (BOOL)isValidateEmail:(NSString *)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    
    if ([emailTest evaluateWithObject:email] == YES) {
        return YES;
    } else {
        return NO;
    }
}
/**
 *  统一收起键盘
 */
+ (void)hideAllKeyboard
{
    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
}

/*
 * 时间戳转为时间字符串
 *
 */
+ (NSString *)timeStringToDateSting:(NSString *)timestr format:(NSString *)format
{
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:[timestr longLongValue]/1000];
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:format];//
    NSString *confromTimespStr = [formatter stringFromDate:confromTimesp];
    return confromTimespStr;
}


/**
 * 判断内容是否全部为空格  yes 全部为空格  no 不是
 */
+ (BOOL) isEmpty:(NSString *) str {
    
    if (!str) {
        return true;
    } else {
        //A character set containing only the whitespace characters space (U+0020) and tab (U+0009) and the newline and nextline characters (U+000A–U+000D, U+0085).
        NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
        //Returns a new string made by removing from both ends of the receiver characters contained in a given character set.
        NSString *trimedString = [str stringByTrimmingCharactersInSet:set];
        if ([trimedString length] == 0) {
            return true;
        } else {
            return false;
        }
    }
}
/**
 * 时间转换
 */
+ (NSString *)returndate:(NSString *)num{
    long long time=[num longLongValue];
    NSDate *d = [[NSDate alloc]initWithTimeIntervalSince1970:time/1000.0];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd hh:mm"];
    NSString*timeString=[formatter stringFromDate:d];
    return timeString;
}
@end
