//
//  HWGressView.m
//  TTC_ios
//
//  Created by 弹指婆婆纳  on 2018/11/7.
//  Copyright © 2018年 弹指婆婆纳 . All rights reserved.
//

#import "HWGressView.h"
@implementation HWGressView{
    UIView* line;
    UIImageView* trackLine;
    UIImageView* point;
}
-(instancetype)initWithFrame:(CGRect)frame{
    if ([super initWithFrame:frame]) {
        line = [[UIView alloc]init];line.backgroundColor = [UIColor colorWithRed:211/255.0 green:211/255.0 blue:211/255.0 alpha:1];
        [self addSubview:line];
        
        trackLine = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"sliderImage"]];
        trackLine.contentMode = UIViewContentModeScaleToFill;
        [self addSubview:trackLine];
        point = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"dot"]];
        point.contentMode = UIViewContentModeScaleToFill;
        [self addSubview:point];
    }
    return self;
}
-(void)setGress:(float)gress{
//    line.frame = CGRectMake(1, 4.5, self.frame.size.width, 2);
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
        make.centerY.equalTo(self.mas_centerY);
        make.height.equalTo(@(1));
    }];
    [trackLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).mas_offset(@(-[CHDevice byW:5]));
        make.centerY.equalTo(self.mas_centerY);
        make.right.equalTo(self.mas_right).mas_offset(@([CHDevice byW:5]));
    }];
    [point mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).mas_offset((SCREEN_WIDTH-[CHDevice byW:17*2]-[CHDevice byW:17*2])*gress-[CHDevice byW:10]);
        make.centerY.equalTo(self.mas_centerY);
//        make.size.mas_equalTo(CGSizeMake([CHDevice byW:10], [CHDevice byW:10]));
    }];
    if (gress == 1.0) {
//        point.hidden = YES;
        point.hidden = NO;
        [point mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).mas_offset((SCREEN_WIDTH-[CHDevice byW:17*2]-[CHDevice byW:17*2])*gress-5);
            make.centerY.equalTo(self.mas_centerY);
//            make.size.mas_equalTo(CGSizeMake([CHDevice byW:10], [CHDevice byW:10]));
        }];
    }else if (gress == 0){
        point.hidden = NO;
        [point mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).mas_offset((SCREEN_WIDTH-[CHDevice byW:17*2]-[CHDevice byW:17*2])*gress-5);
            make.centerY.equalTo(self.mas_centerY);
//            make.size.mas_equalTo(CGSizeMake([CHDevice byW:10], [CHDevice byW:10]));
        }];
        [trackLine mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).mas_offset(@(-[CHDevice byW:5]));
            make.centerY.equalTo(self.mas_centerY);
            make.width.equalTo(@(0));
        }];
    }else{
        point.hidden = NO;
        [trackLine mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).mas_offset(@(-[CHDevice byW:5]));
            make.centerY.equalTo(self.mas_centerY);
            make.width.equalTo(@(((SCREEN_WIDTH-[CHDevice byW:17*2]-[CHDevice byW:17*2])*gress)+[CHDevice byW:5]));
        }];
    }
}
@end
