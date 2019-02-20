//
//  CHToolCollectionViewCell.m
//  PUH
//
//  Created by syhdMacMini4 on 2019/1/14.
//  Copyright © 2019年 syhd. All rights reserved.
//

#import "CHToolCollectionViewCell.h"
@implementation CHToolCollectionViewCell{
    UIImageView* icon;
    UILabel* name;
}
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.clipsToBounds = YES;
        self.backgroundColor = [UIColor clearColor];
        icon = [[UIImageView alloc]init];
        [self addSubview:icon];
        [icon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.mas_centerX);
            make.top.equalTo(@([CHDevice byW:14]));
            make.size.equalTo(@([CHDevice byW:36]));
        }];
        
        name = [[UILabel alloc]init];
        name.font = [CHDevice BiSystemFontSize:20];
        name.textColor = [UIColor whiteColor];
        [self addSubview:name];
        [name mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.mas_centerX);
            make.bottom.equalTo(@([CHDevice byW:-14]));
            make.width.greaterThanOrEqualTo(@1);
            make.height.equalTo(@([CHDevice byW:20]));
        }];
        
    }
    return self;
}
-(void)loadModel:(NSDictionary*)model{
    icon.image = [UIImage imageNamed:model[@"icon"]];
    name.text = model[@"name"];
}
@end
