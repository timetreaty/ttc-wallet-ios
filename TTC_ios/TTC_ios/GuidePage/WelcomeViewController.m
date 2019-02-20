//
//  WelcomeViewController.m
//
//  Created by 冷求慧 on 16/12/19.
//  Copyright © 2016年 冷求慧. All rights reserved.
//

#import "WelcomeViewController.h"
#import "CusPageControlWithView.h"  // 自定义的Page视图

#define imageCount 4

@interface WelcomeViewController ()<UIScrollViewDelegate>{
    CusPageControlWithView *pageView;
    NSMutableArray *arrTitleName;
}

@end

@implementation WelcomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createScrollView];
    [self addPageControl];

}
#pragma mark 创建UIScrollView
-(void)createScrollView{
    arrTitleName=[NSMutableArray array];
    [arrTitleName addObjectsFromArray:@[@"",@"",@""]];
    UIScrollView *scrollView=[[UIScrollView alloc]init];
    scrollView.frame=[UIScreen mainScreen].bounds;
    scrollView.pagingEnabled=YES;//设置分页
    scrollView.showsHorizontalScrollIndicator=NO;
    scrollView.bounces=NO;//设置不能弹回
    scrollView.delegate=self;
    scrollView.contentSize=CGSizeMake(scrollView.frame.size.width*imageCount, 0);
    //添加图片
    for (int i=0; i<imageCount; i++) {
        UIImageView *imageView=[[UIImageView alloc]init];
        imageView.contentMode = UIViewContentModeScaleToFill;
        NSString *strImageName=[NSString stringWithFormat:@"T%i",i];
        imageView.image=[UIImage imageNamed:strImageName];
        imageView.frame=CGRectMake(i*scrollView.frame.size.width, 0, scrollView.frame.size.width, scrollView.frame.size.height);
        //在最后一个UIImageView上面添加开始App按钮
        if (i==imageCount-1) {
            [self addStartButton:imageView];//在图片上面添加开始按钮
        }
        [scrollView addSubview:imageView];//将图片视图添加到ScrollView上面
    }
    [self.view addSubview:scrollView];//将ScrollView添加到控制器的View上面
}
#pragma mark ScrollView的代理
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat  getNum=scrollView.contentOffset.x/scrollView.frame.size.width;
    NSInteger pageValue=(NSInteger)(getNum+0.5);
    
    pageView.indexNumWithSlide=pageValue; // 这个属性中的Setting会调用很多次,所以在其里面判断前后值
//    if(pageValue==(imageCount-1)){
//        pageView.hidden=YES;
//    }
//    else{
//        pageView.hidden=NO;
//    }
}
#pragma mark 创建UIPageControl
-(void)addPageControl{
    CGRect rectValue=CGRectMake(0, self.view.frame.size.height*0.85, SCREEN_WIDTH, 33);
    UIImage *currentImage=[UIImage imageNamed:@"rectangular"];
    UIImage *pageImage=[UIImage imageNamed:@"ellipse"];;
    pageView=[CusPageControlWithView cusPageControlWithView:rectValue pageNum:imageCount currentPageIndex:0 currentShowImage:currentImage pageIndicatorShowImage:pageImage];
    [self.view addSubview:pageView];
}
#pragma mark 在图片上面添加开始按钮
-(void)addStartButton:(UIImageView *)imageView{
    
    imageView.userInteractionEnabled=YES;//设置UIImageView可以点击,不然UIButton不能点击
    UIButton *skipButton = [[UIButton alloc] init];
    [skipButton setAutoresizingMask: UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin];
    //设置圆角的半径
    [skipButton.layer setCornerRadius:3];
    //切割超出圆角范围的子视图
    skipButton.layer.masksToBounds = YES;
    //设置边框的颜色
    [skipButton.layer setBorderColor:[UIColor colorWithRed:106/255.0 green:130/255.0 blue:206/255.0 alpha:1].CGColor];
    //设置边框的粗细
    [skipButton.layer setBorderWidth:1.0];
    skipButton.titleLabel.font = [CHDevice BiSystemFontSize:18];
    [skipButton setTitleColor:LightPurpleBtnColor forState:UIControlStateNormal];
    [skipButton setTitleColor:ClickLightPurpleBtnColor forState:UIControlStateHighlighted];
    [skipButton setTitle:NSLocalizedString(@"  开启区块价值链之旅  ", nil) forState:UIControlStateNormal];
    [skipButton addTarget:self action:@selector(startApp) forControlEvents:UIControlEventTouchUpInside];
    [imageView addSubview:skipButton];
    [skipButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(imageView.mas_centerX);
        make.bottom.equalTo(@(-[CHDevice byW:98*2]));
//        make.size.mas_equalTo(CGSizeMake([CHDevice byW:90*2], [CHDevice byW:27*2]));
    }];
    
//    [imageView addSubview:button];//将按钮添加到最后一个UIImageView里面
}
#pragma mark 开始App
-(void)startApp{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"TTC" object:nil];
}
-(BOOL)prefersStatusBarHidden{
    return YES;
}



@end
