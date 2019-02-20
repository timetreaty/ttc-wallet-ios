//
//  CustomLabel.m
//  TTC_ios
//
//  Created by 弹指婆婆纳 on 2018/10/26.
//  Copyright © 2018年 弹指婆婆纳. All rights reserved.
//

#import "CustomLabel.h"

@implementation CustomLabel

- (instancetype)init {
    if (self = [super init]) {
        _textInsets = UIEdgeInsetsZero;
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _textInsets = UIEdgeInsetsZero;
    }
    return self;
}

- (void)drawTextInRect:(CGRect)rect {
    [super drawTextInRect:UIEdgeInsetsInsetRect(rect, _textInsets)];
}
@end
