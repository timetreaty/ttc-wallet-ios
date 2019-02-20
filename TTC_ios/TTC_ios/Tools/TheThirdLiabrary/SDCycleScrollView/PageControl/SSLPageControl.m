//
//  SSLPageControl.m
//  YouGu
//
//  Created by 孙升隆 on 15/7/25.
//  Copyright © 2015年 YG. All rights reserved.
//

#import "SSLPageControl.h"
#define SSLPagePadding 0
#define SSLPageWight 6

#define SSLRecPointW  15.f //宽的
#define SSLRectangleH 5.f  //小的
#define SSLRectangle2PagePadding 5 //间距

static UIImage *currentPageImageView;

@interface SSLPageControl ()
{
    CGFloat SSLRectangleW;
}


/**
 *  存放page对象的
 */
@property (nonatomic, strong) NSMutableArray *pagesList;
/**
 *  page背景视图
 */
@property (nonatomic, strong) UIView *pageBackgroundView;
/**
 *  未被点击的page视图
 */
@property (nonatomic, strong) UIView *pageView;
/**
 *  被选中的page视图
 */
@property (nonatomic, strong) UIView *currentPageView;
/**
 *  用图片给未选中page设颜色
 */
@property (nonatomic, strong) UIImageView *pageImageView;
/**
 *  用图片给选中的page设颜色
 */
@property (nonatomic, strong) UIImageView *currentPageImageView;
@property (nonatomic, strong) NSMutableArray *pageViewList;
@property (nonatomic, strong) NSMutableArray *pageImageList;
@end

@implementation SSLPageControl
@synthesize styel = _styel;
#pragma mark - 类方法+构造方法

+ (instancetype)pageControl
{
    return [[self alloc] init];
}
- (instancetype)initWithStyel:(SSLPageControlStyel)styel andCount:(NSInteger)count
{
    if (self = [super init]) {
        
        SSLRectangleW = SSLRecPointW;//[UIScreen mainScreen].bounds.size.width / count;
        _styel = styel;
        self.currentPage = 0;
        self.numberOfPages = 0;
        [self initWithMustData];
        [self addObserver:self forKeyPath:@"currentPage" options:0 context:nil];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        _styel = SSLPageControlStyelDefault;
        [self initWithMustData];
    }
    return self;
}
- (instancetype)init
{
    if (self = [super init]) {
        _styel = SSLPageControlStyelDefault;
        [self initWithMustData];
        // 用KVO监听currentPage的属性变化
        [self addObserver:self forKeyPath:@"currentPage" options:0 context:nil];
    }
    return self;
}
- (void)layoutSubviews
{
    if (_styel == SSLPageControlStyelDefault) {
        self.bounds = CGRectMake(0, 0, SSLPageWight*self.numberOfPages+SSLPagePadding*(self.numberOfPages-1), SSLPageWight);
    }else if (_styel == SSLPageControlStyelRectangle ){
        self.bounds = CGRectMake(0, 0, SSLRectangleW*self.numberOfPages+SSLPagePadding*(self.numberOfPages-1), SSLRectangleH);
    }else if (_styel == SSLPageControlStyelMixRectanglePoint) {
        self.bounds = CGRectMake(0, 0, SSLRectangleW+(SSLRectangle2PagePadding+SSLRectangleH)*(self.numberOfPages-1), SSLRectangleH);
    }
    [super layoutSubviews];
}
#pragma mark - KVO相关
- (void)dealloc
{
    [self removeObserver:self forKeyPath:@"currentPage"];
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    [self moveScreen];
}
#pragma mark - 重写setter方法
/**
 *  如果pageNum只有一个，那么关闭下面的图标，默认为NO
 */
- (void)setHidesForSinglePage:(BOOL)hidesForSinglePage
{
    _hidesForSinglePage = hidesForSinglePage;
    if (_hidesForSinglePage == YES) {
        if (self.pagesList.count == 1) {
            self.pageBackgroundView.hidden = YES;
        }
    }
}
- (void)setPageIndicatorTintColor:(UIColor *)pageIndicatorTintColor
{
    _pageIndicatorTintColor = pageIndicatorTintColor;
    for (int index=0; index<self.pageViewList.count; index++) {
        self.pageView = self.pageViewList[index];
        self.pageView.backgroundColor = _pageIndicatorTintColor;
    }
}
- (void)setCurrentPageIndicatorTintColor:(UIColor *)currentPageIndicatorTintColor
{
    _currentPageIndicatorTintColor = currentPageIndicatorTintColor;
    self.currentPageView.backgroundColor = _currentPageIndicatorTintColor;
}
- (void)setPageImage:(UIImage *)pageImage
{
    _pageImage = pageImage;
    for (int index = 0; index < self.pageImageList.count; index++) {
        self.pageImageView = self.pageImageList[index];
        self.pageImageView.hidden = NO;
        self.pageImageView.contentMode = UIViewContentModeCenter;
        self.pageImageView.image = pageImage;
    }
}
- (void)setCurrentPageImage:(UIImage *)currentPageImage
{
    _currentPageImage = currentPageImage;
    self.currentPageImageView.hidden = NO;
    self.currentPageImageView.contentMode = UIViewContentModeCenter;
    self.currentPageImageView.image = currentPageImage;
    currentPageImageView = currentPageImage;
    
}
/**
 *  如果设置了，关闭用户交互，直到-updateCurrentPageDisplay方法被唤醒的时候才开启用户交互,默认是NO
 */
- (void)setDefersCurrentPageDisplay:(BOOL)defersCurrentPageDisplay
{
    _defersCurrentPageDisplay = defersCurrentPageDisplay;
    if (_defersCurrentPageDisplay == YES) {
        self.userInteractionEnabled = NO;
    }
}
/**
 *  总page数。默认为0
 */
- (void)setNumberOfPages:(NSInteger)numberOfPages
{
    _numberOfPages = numberOfPages;
    self.currentPageView = [[UIView alloc]init];
    for (int index = 0; index<numberOfPages; index++) {
        self.pageBackgroundView = [[UIView alloc]init];
        self.pageView = [[UIView alloc]init];
        if (_styel == SSLPageControlStyelDefault) {// 默认情况下的frame
            self.pageBackgroundView.frame = CGRectMake(index *(SSLPagePadding+SSLPageWight) , 0, SSLPageWight, SSLPageWight);
            self.pageView.layer.cornerRadius = SSLPageWight/2;
            self.currentPageView.layer.cornerRadius = SSLPageWight/2;
        }else if(_styel == SSLPageControlStyelRectangle){// 长方形风格
            self.pageBackgroundView.frame = CGRectMake(index *(SSLRectangleW+SSLPagePadding), 0, SSLRectangleW, SSLRectangleH);
            self.pageView.layer.cornerRadius = SSLRectangleH/2;
            self.currentPageView.layer.cornerRadius = SSLRectangleH/2;
        }else if(_styel == SSLPageControlStyelMixRectanglePoint){// 混搭风格
            if (index == self.currentPage) {
                self.pageBackgroundView.frame = CGRectMake(index *(SSLRectangleH+SSLRectangle2PagePadding), 0, SSLRectangleW, SSLRectangleH);
            }else if (index < self.currentPage){
                self.pageBackgroundView.frame = CGRectMake((SSLRectangleH+SSLRectangle2PagePadding)*index, 0, SSLRectangleH, SSLRectangleH);
            }else if (index > self.currentPage){
                self.pageBackgroundView.frame = CGRectMake((SSLRectangleW+SSLRectangle2PagePadding)+(index-1)*(SSLRectangle2PagePadding+SSLRectangleH), 0, SSLRectangleH, SSLRectangleH);
            }
            self.pageView.layer.cornerRadius = SSLRectangleH/2;
        }
        self.pageBackgroundView.backgroundColor = [UIColor clearColor];
        [self addSubview:self.pageBackgroundView];
        [self.pagesList addObject:self.pageBackgroundView];
        
        if (_styel != SSLPageControlStyelMixRectanglePoint) {
            [self setDetailsForView:index];
        }else{
            [self setDetailsForMix:index];
        }
        
    }
}
- (void)setDetailsForMix:(int)index
{
    if (index == self.currentPage) {
        self.currentPageView.frame = CGRectMake(0, 0, self.pageBackgroundView.bounds.size.width, self.pageBackgroundView.bounds.size.height);
        self.currentPageView.backgroundColor = self.currentPageIndicatorTintColor;
        [self.pageViewList addObject:self.currentPageView];
        [self.pageBackgroundView addSubview:self.currentPageView];
    } else {
        self.pageView.frame = CGRectMake(0, 0, self.pageBackgroundView.bounds.size.width, self.pageBackgroundView.bounds.size.height);
        self.pageView.backgroundColor = self.pageIndicatorTintColor;
        [self.pageViewList addObject:self.pageView];
        [self.pageBackgroundView addSubview:self.pageView];
    }
}

- (void)setDetailsForView:(int)index
{
    // 设置未被点击的视图的样式
    self.pageView.frame = CGRectMake(0, 0, self.pageBackgroundView.bounds.size.width, self.pageBackgroundView.bounds.size.height);
    self.pageView.backgroundColor = self.pageIndicatorTintColor;
    [self.pageViewList addObject:self.pageView];
    [self.pageBackgroundView addSubview:self.pageView];
    
    if (index == 0) {
        self.currentPageView.frame = CGRectMake(0, 0, self.pageBackgroundView.bounds.size.width, self.pageBackgroundView.bounds.size.height);
        self.currentPageView.backgroundColor = self.currentPageIndicatorTintColor;
        [self.pageBackgroundView addSubview:self.currentPageView];
    }
    
    // 设置未被点击的图片
    self.pageImageView = [[UIImageView alloc]init];
    self.pageImageView.frame = CGRectMake(0, 0, self.pageBackgroundView.bounds.size.width, self.pageBackgroundView.bounds.size.height);
    self.pageImageView.hidden = YES;
    [self.pageImageList addObject:self.pageImageView];
    [self.pageBackgroundView addSubview:self.pageImageView];
    
    if (index == 0) {
        self.currentPageImageView = [[UIImageView alloc]init];
        self.currentPageImageView.frame = CGRectMake(0, 0, self.pageBackgroundView.bounds.size.width, self.pageBackgroundView.bounds.size.height);
        self.currentPageImageView.hidden = YES;
        [self.pageBackgroundView addSubview:self.currentPageImageView];
    }
    
    // 设置透明的按钮，触发点击方法
    UIButton *pageButton = [UIButton buttonWithType:UIButtonTypeCustom];
    pageButton.backgroundColor = [UIColor clearColor];
    pageButton.tag = index;
    pageButton.frame = CGRectMake(0, 0, self.pageBackgroundView.bounds.size.width, self.pageBackgroundView.bounds.size.height);
    [pageButton addTarget:self action:@selector(clickPageButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.pageBackgroundView addSubview:pageButton];
}
/**
 *  当前page。默认为0，范围从0~page个数-1
 */
- (void)setCurrentPage:(NSInteger)currentPage
{
    _currentPage = currentPage;
}

#pragma mark - 抽出来的方法
/**
 *  加载必要的数据
 */
- (void)initWithMustData
{
    self.currentPage = 0;
    self.numberOfPages = 0;
    self.pagesList = [NSMutableArray array];
    self.pageViewList = [NSMutableArray array];
    self.pageImageList = [NSMutableArray array];
    self.pageIndicatorTintColor = [UIColor grayColor];
    self.currentPageIndicatorTintColor = [UIColor greenColor];
    self.userInteractionEnabled = YES;
    self.hidesForSinglePage = NO;
    self.defersCurrentPageDisplay = NO;
}
/**
 *  更新页面的当前page，如果defersCurrentPageDisplay为NO可以忽略这个方法
 */
- (void)updateCurrentPageDisplay
{
    if (self.defersCurrentPageDisplay==YES) {
        self.userInteractionEnabled = YES;
    }
}
/**
 *  移动屏幕或者点击圈圈的时候调用
 */
- (void)moveScreen
{
    if (_styel == SSLPageControlStyelMixRectanglePoint) {
//        for (int index = 0; index < self.numberOfPages; index++) {
//            self.pageBackgroundView = self.pagesList[index];
//            self.pageView = self.pageViewList[index];
//            [self.pageView removeFromSuperview];
//            [self.pageBackgroundView removeFromSuperview];
//            if (index == self.currentPage) {
//                self.pageBackgroundView.frame = CGRectMake(index *(SSLRectangleH+SSLRectangle2PagePadding), 0, SSLRectangleW, SSLRectangleH);
//            }else if (index < self.currentPage){
//                self.pageBackgroundView.frame = CGRectMake((SSLRectangleH+SSLRectangle2PagePadding)*index, 0, SSLRectangleH, SSLRectangleH);
//            }else if (index > self.currentPage){
//                self.pageBackgroundView.frame = CGRectMake((SSLRectangleW+SSLRectangle2PagePadding)+(index-1)*(SSLRectangle2PagePadding+SSLRectangleH), 0, SSLRectangleH, SSLRectangleH);
//            }
//            self.pageView.layer.cornerRadius = SSLRectangleH/2;
//            self.pageBackgroundView.backgroundColor = [UIColor clearColor];
//            [self addSubview:self.pageBackgroundView];
//            [self setDetailsForMix:index];
//            //            [self.pagesList addObject:self.pageBackgroundView];
//            //            [self setDetailsForView:index];
//        }
        for (int index = 0; index < self.numberOfPages; index++) {
            self.pageBackgroundView = self.pagesList[index];
            self.pageView = self.pageViewList[index];
            self.currentPageView = self.pageViewList[index];
            [self.pageView removeFromSuperview];
            [self.currentPageView removeFromSuperview];
            [self.pageBackgroundView removeFromSuperview];
            if (index == self.currentPage) {
                self.pageBackgroundView.frame = CGRectMake(index *(SSLRectangleH+SSLRectangle2PagePadding), 0, SSLRectangleW, SSLRectangleH);
            }else if (index < self.currentPage){
                self.pageBackgroundView.frame = CGRectMake((SSLRectangleH+SSLRectangle2PagePadding)*index, 0, SSLRectangleH, SSLRectangleH);
            }else if (index > self.currentPage){
                self.pageBackgroundView.frame = CGRectMake((SSLRectangleW+SSLRectangle2PagePadding)+(index-1)*(SSLRectangle2PagePadding+SSLRectangleH), 0, SSLRectangleH, SSLRectangleH);
            }
            self.currentPageView.layer.cornerRadius = SSLRectangleH/2;
            self.pageView.layer.cornerRadius = SSLRectangleH/2;
            self.pageBackgroundView.backgroundColor = [UIColor clearColor];
            [self addSubview:self.pageBackgroundView];
            [self setDetailsForMix:index];
        }
    }else{
        self.pageBackgroundView = self.pagesList[self.currentPage];
        
        [self.currentPageView removeFromSuperview];
        self.currentPageView.bounds = CGRectMake(0, 0, self.pageBackgroundView.bounds.size.width, self.pageBackgroundView.bounds.size.height);
        self.currentPageView.backgroundColor = self.currentPageIndicatorTintColor;
        [self.pageBackgroundView addSubview:self.currentPageView];
        
        [self.currentPageImageView removeFromSuperview];
        self.currentPageImageView.bounds = CGRectMake(0, 0, self.pageBackgroundView.bounds.size.width, self.pageBackgroundView.bounds.size.height);
        self.currentPageImageView.image = currentPageImageView;
        [self.pageBackgroundView addSubview:self.currentPageImageView];
    }
}
/**
 *  pageButton的点击方法
 */
- (void)clickPageButton:(UIButton *)pageButton
{
    // 首先判断currentPage是+1还是-1
    if (pageButton.tag>self.currentPage) {
        self.currentPage += 1;
    }else if(pageButton.tag<self.currentPage){
        self.currentPage -= 1;
    }
    if ([self.delegate respondsToSelector:@selector(pageControl:changgeCurrentPage:)]) {
        [self.delegate pageControl:self changgeCurrentPage:self.currentPage];
    }
    [self moveScreen];
}

@end
