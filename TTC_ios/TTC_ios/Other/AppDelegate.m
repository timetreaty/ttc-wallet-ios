//
//  AppDelegate.m
//  TTC_ios
//
//  Created by 弹指婆婆纳 on 2018/9/17.
//  Copyright © 2018年 弹指婆婆纳. All rights reserved.
//

#import "AppDelegate.h"
#import "LoginViewController.h"
#import "AssetsViewController.h"
#import "TradingViewController.h"
#import "MyViewController.h"
#import "WelcomeViewController.h"
#import "XHLaunchAd.h"
#import "HWNavigationController.h"
#import "JSHAREService.h"
@interface AppDelegate ()
@property(nonatomic, strong)UITabBarController *tabBarController;
@end

@implementation AppDelegate

+ (instancetype)sharedAppDelegate
{
    return (AppDelegate *)[UIApplication sharedApplication].delegate;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    JSHARELaunchConfig *config = [[JSHARELaunchConfig alloc] init];
    config.appKey = @"b99eb4efd918671e6714c31e";
    config.SinaWeiboAppKey = @"374535501";
    config.SinaWeiboAppSecret = @"baccd12c166f1df96736b51ffbf600a2";
    config.SinaRedirectUri = @"https://www.jiguang.cn";
    config.QQAppId = @"1107953562";
    config.QQAppKey = @"7jjeFXJkgJ5VibBO";
    config.WeChatAppId = @"wx8152ee1b7829f6f5";
    config.WeChatAppSecret = @"caea3459e3db9f791fc0689ace1055e6";
//    config.FacebookAppID = @"1847959632183996";
//    config.FacebookDisplayName = @"JShareDemo";
//    config.TwitterConsumerKey = @"4hCeIip1cpTk9oPYeCbYKhVWi";
//    config.TwitterConsumerSecret = @"DuIontT8KPSmO2Y1oAvby7tpbWHJimuakpbiAUHEKncbffekmC";
    config.JChatProAuth = @"a7e2ce002d1a071a6ca9f37d";
    config.isSupportWebSina = YES;
    [JSHAREService setupWithConfig:config];
//    [JSHAREService setDebug:YES];
    
    //注册登录状态监听
    [[NSNotificationCenter defaultCenter]addObserver:self
                                            selector:@selector(receiveLoginStatueChangeNotif:)
                                                name:kLoginSuccessStatue
                                              object:nil];
    
    //注册退出状态监听
    [[NSNotificationCenter defaultCenter]addObserver:self
                                            selector:@selector(receiveexitLoginStatueChangeNotif:)
                                                name:exitLoginSuccessStatue
                                              object:nil];
    
    
    //判断是否是第一次启动页面，如果是的话就用导航页面
    if (![[NSUserDefaults standardUserDefaults] objectForKey:@"TTC"]) {
        [[NSUserDefaults standardUserDefaults] setObject:@"vlaue" forKey:@"TTC"];
        WelcomeViewController *guidence = [[WelcomeViewController alloc] init];
        self.window.rootViewController = guidence;
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loginRootVC) name:@"TTC" object:nil];
    }else{
//        //设置你工程的启动页使用的是:LaunchImage 还是 LaunchScreen.storyboard(不设置默认:LaunchImage)
//        [XHLaunchAd setLaunchSourceType:SourceTypeLaunchScreen];
//        //1.因为数据请求是异步的,请在数据请求前,调用下面方法配置数据等待时间.
//        //2.设为3即表示:启动页将停留3s等待服务器返回广告数据,3s内等到广告数据,将正常显示广告,否则将不显示
//        //3.数据获取成功,配置广告数据后,自动结束等待,显示广告
//        //注意:请求广告数据前,必须设置此属性,否则会先进入window的的根控制器
//        [XHLaunchAd setWaitDataDuration:3];
//        //广告数据请求
//        HttpHelper *helper = [[HttpHelper alloc] init];
//        [helper getstartPageSuccess:^(NSDictionary *resultDic) {
//            NSLog(@"广告数据 = %@",resultDic);
//            //广告数据转模型
////            LaunchAdModel *model = [[LaunchAdModel alloc] initWithDict:response[@"data"]];
//            //配置广告数据
//            XHLaunchImageAdConfiguration *imageAdconfiguration = [XHLaunchImageAdConfiguration new];
//            //广告停留时间
////            imageAdconfiguration.duration = model.duration;
//            //广告frame
////            imageAdconfiguration.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.width/model.width*model.height);
//            //广告图片URLString/或本地图片名(.jpg/.gif请带上后缀)
////            imageAdconfiguration.imageNameOrURLString = model.content;
//            //设置GIF动图是否只循环播放一次(仅对动图设置有效)
//            imageAdconfiguration.GIFImageCycleOnce = NO;
//            //缓存机制(仅对网络图片有效)
//            //为告展示效果更好,可设置为XHLaunchAdImageCacheInBackground,先缓存,下次显示
//            imageAdconfiguration.imageOption = XHLaunchAdImageDefault;
//            //图片填充模式
//            imageAdconfiguration.contentMode = UIViewContentModeScaleToFill;
//            //广告点击打开页面参数(openModel可为NSString,模型,字典等任意类型)
////            imageAdconfiguration.openModel = model.openUrl;
//            //广告显示完成动画
//            imageAdconfiguration.showFinishAnimate =ShowFinishAnimateLite;
//            //广告显示完成动画时间
//            imageAdconfiguration.showFinishAnimateTime = 0.8;
//            //跳过按钮类型
//            imageAdconfiguration.skipButtonType = SkipTypeTimeText;
//            //后台返回时,是否显示广告
//            imageAdconfiguration.showEnterForeground = NO;
//
//            //显示开屏广告
//            [XHLaunchAd imageAdWithImageAdConfiguration:imageAdconfiguration delegate:self];
                        //从归档的库中获得用户信息
                            ArcherTTC *archer = [[ArcherTTC alloc] init];
                            UserModel *myUser = [archer unarchiver];
                            if([myUser.userToken isEqualToString:@""] || myUser.userToken == nil || myUser.userToken == NULL || [myUser.userToken isEqual:[NSNull null]]){
                                [self loginRootVC];
                            }else{
                                //登录成功通知
                                [[NSNotificationCenter defaultCenter] postNotificationName:kLoginSuccessStatue object:@YES];
                            }
//        } fail:^(NSString *description) {
//            //[Tool progressPlease:@"登陆中" showView:self];
//        }];
    
    }
    //[[NSNotificationCenter defaultCenter] postNotificationName:kLoginSuccessStatue object:@YES];
    return YES;
}

//登陆
- (void)loginRootVC
{
    LoginViewController *loginVC = [[LoginViewController alloc]init];
    loginVC.isAutoLogin = YES;
    HWNavigationController *navi = [[HWNavigationController alloc]initWithRootViewController:loginVC];
    self.window.rootViewController = navi;
}
//监听登录
- (void)receiveLoginStatueChangeNotif:(NSNotification *)notification
{
    BOOL loginSuccess = [notification.object boolValue];
    if (loginSuccess) {
        [self initlizeMainViewControllerWithLaunchOptions];
    }else{
        [self loginRootVC];
    }
}
//监听退出登录
- (void)receiveexitLoginStatueChangeNotif:(NSNotification *)notification
{
    //归档用户信息
    ArcherTTC *arcgTTC = [[ArcherTTC alloc] init];
    UserModel *user = [[UserModel alloc] init];
    user.userToken = @"";
    [arcgTTC archiver:user];
    [self loginRootVC];
}
#pragma mark - 初始化主页面
- (void)initlizeMainViewControllerWithLaunchOptions
{
    //资产
    AssetsViewController *assetsVC = [[AssetsViewController alloc] init];
    HWNavigationController *assetsVC_Navi = [[HWNavigationController alloc] initWithRootViewController:assetsVC];
    assetsVC_Navi.navigationBarHidden = YES;
    assetsVC_Navi.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"资产" image:nil selectedImage:nil];
    assetsVC_Navi.tabBarItem.image = [[UIImage imageNamed:@"assetsImage_grey"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    assetsVC_Navi.tabBarItem.selectedImage = [[UIImage imageNamed:@"assetsImage"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
//    //交易
//    TradingViewController *tradingVC = [[TradingViewController alloc] init];
//    HWNavigationController *tradingVC_Navi = [[HWNavigationController alloc] initWithRootViewController:tradingVC];
//    tradingVC_Navi.navigationBarHidden = YES;
//    tradingVC_Navi.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"交易" image:nil selectedImage:nil];
//    tradingVC_Navi.tabBarItem.image = [[UIImage imageNamed:@"tradingImage_grey"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    tradingVC_Navi.tabBarItem.selectedImage = [[UIImage imageNamed:@"tradingImage"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    //我的
    MyViewController *myVC = [[MyViewController alloc] init];
    HWNavigationController *myVC_Navi = [[HWNavigationController alloc] initWithRootViewController:myVC];
    myVC_Navi.navigationBarHidden = YES;
    myVC_Navi.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"我的" image:nil selectedImage:nil];
    myVC_Navi.tabBarItem.selectedImage = [[UIImage imageNamed:@"myImage"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    myVC_Navi.tabBarItem.image = [[UIImage imageNamed:@"myImage_grey"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    self.tabBarController= [[UITabBarController alloc] init];
    [[UITabBar appearance]setBackgroundColor:[UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1]];
    //设置选中颜色
    self.tabBarController.tabBar.tintColor = [UIColor colorWithRed:78/255.0 green:100/255.0 blue:171/255.0 alpha:1];
//    [self.tabBarController setViewControllers:@[assetsVC_Navi,tradingVC_Navi,myVC_Navi]];
    [self.tabBarController setViewControllers:@[assetsVC_Navi,myVC_Navi]];

    [UITabBar appearance].translucent = NO;
    self.window.rootViewController = self.tabBarController;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
//    [self saveContext];
}
- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url{
    [JSHAREService handleOpenUrl:url];
    return YES;
}
@end
