//
//  BasicCell.m
//  CustomerService
//
//  Created by 天智 on 16/7/5.
//  Copyright © 2016年 天智. All rights reserved.
//

#import "BasicCell.h"

@implementation BasicCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {

        self.bottomLineLayer = [[CALayer alloc]init];
//        self.bottomLineLayer.backgroundColor = [UIColor grayColor].CGColor;
         self.bottomLineLayer.backgroundColor =  [UIColor colorWithRed:243/255.0 green:243/255.0 blue:243/255.0 alpha:1].CGColor;
       
        [self.contentView.layer addSublayer:self.bottomLineLayer];
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.bottomLineLayer.frame = CGRectMake(self.lineX, self.bounds.size.height - 0.5f, self.bounds.size.width - self.lineX - self.lineRight, 0.5f);

}
@end
