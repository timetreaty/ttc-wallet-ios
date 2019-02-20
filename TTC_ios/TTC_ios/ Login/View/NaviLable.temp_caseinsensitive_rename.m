//
//  naviLable.m
//  TTC_ios
//
//  Created by 弹指婆婆纳 on 2018/9/19.
//  Copyright © 2018年 弹指婆婆纳. All rights reserved.
//

#import "NaviLable.h"

@implementation NaviLable

- (id)initWithFrame:(CGRect)frame style:(NSString *)style
{
    self = [super initWithFrame:frame];
    if (self) {
    // Drawing code
        self.titleLabel = [[UILabel alloc] init];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(194,15));
        }];
        self.titleLabel.backgroundColor = [UIColor clearColor];
        self.titleLabel.font = [CHDevice BiSystemFontSize:32];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.text = @"";
    }
    return self;
}


@end
