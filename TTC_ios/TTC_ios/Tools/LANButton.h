//
//  LANButton.h
//  LANButton
//
//  Created by casic on 2018/10/29.
//  Copyright © 2018年 CASICloud. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LANButton : UIButton

/**
 点击范围左右各增加多少
 */
@property (nonatomic, assign) CGFloat addWidth;

/**
 点击范围上下各增加多少
 */
@property (nonatomic, assign) CGFloat addHeight;

@end

NS_ASSUME_NONNULL_END
