//
//  HWNavigationController.m
//  TTC_ios
//
//  Created by 弹指婆婆纳 on 2018/11/5.
//  Copyright © 2018年 弹指婆婆纳. All rights reserved.
//

#import "HWNavigationController.h"

@interface HWNavigationController ()

@end

@implementation HWNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [[UINavigationBar appearance] setTintColor:LightBlackBtnColor];
    //[[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"back"] forBarMetrics:UIBarMetricsDefault];
    UINavigationBar * navigationBar = [UINavigationBar appearance];
    
    UIImage *image = [UIImage imageNamed:@"back"];
    
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    navigationBar.backIndicatorImage = image;
    
    navigationBar.backIndicatorTransitionMaskImage = image;
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.viewControllers.count>0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
    //1.添加后退按钮
//    [self addBackButton:viewController];
}
//2 自定义后退按钮
- (void)addBackButton:(UIViewController *)viewController {

    UIBarButtonItem *back = [[UIBarButtonItem alloc]initWithImage: [[UIImage imageNamed:@"back"]imageWithRenderingMode: UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(backClick)];
//    //间距
//    UIBarButtonItem *fixed = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
//    fixed.width = -200;
    /**
     width为负数时，相当于btn向右移动width数值个像素，由于按钮本身和  边界间距为5pix，所以width设为-5时，间距正好调整为0；width为正数 时，正好相反，相当于往左移动width数值个像素
     */
    back.width = 5;
    viewController.navigationItem.leftBarButtonItems =@[back];
}

//点击后退的时候执行的方法
- (void)backClick {
    [self popViewControllerAnimated:YES];
}

@end
