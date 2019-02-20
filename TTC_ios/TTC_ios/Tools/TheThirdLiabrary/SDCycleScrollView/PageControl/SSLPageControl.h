//
//  SSLPageControl.h
//  YOUGU
//
//  Created by 孙升隆 on 15/7/25.
//  Copyright © 2015年 YG. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 *  pageControl的类型，默认为Default
 */
typedef NS_ENUM(NSInteger, SSLPageControlStyel) {
    SSLPageControlStyelDefault= 0, // 默认类型为与系统相同的小圆圈
    SSLPageControlStyelRectangle, // 长方形类型
    SSLPageControlStyelMixRectanglePoint, // 默认和长方形混搭,这种类型只能通过pageIndicatorTintColor改变pageControl的颜色
};

@class SSLPageControl;
@protocol SSLPageControlDelegate <NSObject>
- (void)pageControl:(SSLPageControl *)pageControl changgeCurrentPage:(NSInteger)currentPage;
@end

@interface SSLPageControl : UIView
@property (nonatomic, assign) id<SSLPageControlDelegate> delegate;
/**
 *  总page数。默认为0
 */
@property(nonatomic) NSInteger numberOfPages;
/**
 *  当前page。默认为0，范围从0~page个数-1
 */
@property(nonatomic) NSInteger currentPage;
/**
 *  如果pageNum只有一个，那么关闭下面的图标，默认为NO
 */
@property(nonatomic) BOOL hidesForSinglePage;
/**
 *  如果设置了，关闭用户交互，直到-updateCurrentPageDisplay方法被唤醒的时候才开启用户交互，默认是NO
 */
@property(nonatomic) BOOL defersCurrentPageDisplay;
/**
 *  更新页面的当前page，如果defersCurrentPageDisplay为NO可以忽略这个方法
 */
- (void)updateCurrentPageDisplay;
/**
 *  未选中小圈圈的颜色
 */
@property(nonatomic,strong) UIColor *pageIndicatorTintColor;
/**
 *  当前小圈圈的颜色
 */
@property(nonatomic,strong) UIColor *currentPageIndicatorTintColor;
/**
 *  用图片给未选中page设颜色
 */
@property (nonatomic, strong) UIImage *pageImage;
/**
 *  用图片给选中的page设颜色
 */
@property (nonatomic, strong) UIImage *currentPageImage;
/**
 *  pageControl的类型，默认为Default
 */
@property (nonatomic, assign, readonly) SSLPageControlStyel styel;
/**
 *  快速创建一个pageControl
 */
+ (instancetype)pageControl;
/**
 *  设置风格，只能设置一次
 */
- (instancetype)initWithStyel:(SSLPageControlStyel)styel andCount:(NSInteger)count;

@end
