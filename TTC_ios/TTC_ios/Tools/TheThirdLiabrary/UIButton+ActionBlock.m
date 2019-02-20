//
//  UIButton+ActionBlock.m
//  KJ
//
//  Created by chenghao on 2017/10/10.
//  Copyright © 2017年 cpcp5588.com. All rights reserved.
//

#import "UIButton+ActionBlock.h"

@implementation UIButton (ActionBlock)
static char overviewKey;
+(UIButton*)initWithFrame:(CGRect)frame andBgColor:(UIColor*)color andTitleColor:(UIColor*)titleColor andFont:(float)font andImage:(UIImage*)image andTitle:(NSString*)title andBorderRadius:(float)radius andActionBlock:(VoidBlock)action{
    UIButton* but = [UIButton buttonWithType:UIButtonTypeCustom];
    but.frame = frame;
    but.backgroundColor = color;
    but.titleLabel.font = [UIFont systemFontOfSize:font];
    [but setTitleColor:titleColor forState:UIControlStateNormal];
    [but setTitle:title forState:UIControlStateNormal];
    [but setImage:image forState:UIControlStateNormal];
    but.layer.cornerRadius = radius;
    but.layer.masksToBounds = YES;
    objc_setAssociatedObject(but, &overviewKey, action,OBJC_ASSOCIATION_COPY_NONATOMIC);
    [but addTarget:but action:@selector(callActionBlock:)forControlEvents:UIControlEventTouchUpInside];
    return but;
}
+(UIButton*)initWithTitle:(NSString*)title  andActionBlock:(VoidBlock)action{
    UIButton* but = [UIButton buttonWithType:UIButtonTypeCustom];
    but.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    [but setTitle:title forState:UIControlStateNormal];
    objc_setAssociatedObject(but, &overviewKey, action,OBJC_ASSOCIATION_COPY_NONATOMIC);
    [but addTarget:but action:@selector(callActionBlock:)forControlEvents:UIControlEventTouchUpInside];
    return but;
}
+(UIButton*)initActionBlock:(VoidBlock)action{
    UIButton* but = [UIButton buttonWithType:UIButtonTypeCustom];
    objc_setAssociatedObject(but, &overviewKey, action,OBJC_ASSOCIATION_COPY_NONATOMIC);
    [but addTarget:but action:@selector(callActionBlock:)forControlEvents:UIControlEventTouchUpInside];
    return but;
}
- (void)callActionBlock:(id)sender {
    VoidBlock block = (VoidBlock)objc_getAssociatedObject(self, &overviewKey);
    if (block) {
        block();
    }
}
@end
