//
//  BasicCell.h
//  CustomerService
//
//  Created by 天智 on 16/7/5.
//  Copyright © 2016年 天智. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BasicCell : UITableViewCell

@property (nonatomic,strong) CALayer * bottomLineLayer;

@property (nonatomic,assign) CGFloat  lineX;
@property (nonatomic,assign) CGFloat  lineRight;


@end
