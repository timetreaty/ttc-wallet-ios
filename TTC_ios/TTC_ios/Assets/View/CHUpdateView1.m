//
//  CHUpdateView.m
//  GGL
//
//  Created by syhdMacMini4 on 2018/10/22.
//  Copyright © 2018年 syhd. All rights reserved.
//

#import "CHUpdateView.h"
#import <Masonry/Masonry.h>
#import "UIButton+ActionBlock.h"
@implementation CHUpdateView{
    UILabel* title;
    UIImageView* star;
    UILabel* vint;
    UILabel* vtime;
    UIView* line;
    UITextView* vcontent;
}
+(CHUpdateView*)initWithVint:(NSString*)vint andVtime:(NSString*)vtime andVcontent:(NSString*)vcontent andUpdate:(UpdateBlock)updateBlock{
    CHUpdateView* update = [[CHUpdateView alloc]init];
    update.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.0f];
    [[update getCurrentVC].view.window addSubview:update];
    update.frame = CGRectMake(-[UIScreen mainScreen].bounds.size.width, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    
    UIView* bg = [[UIView alloc]init];
    bg.backgroundColor = [UIColor whiteColor];
    [update addSubview:bg];
    
    update->title = [[UILabel alloc] init];
    update->title.text = @"新版发布";
    update->title.font = [CHDevice BiSystemFontSize:30];
    update->title.textColor = LightBlackBtnColor;
    [bg addSubview:update->title];
    [update->title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@20);
        make.top.equalTo(@25);
        make.height.equalTo(@20);
        make.width.greaterThanOrEqualTo(@30);
    }];
    update->star = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"LittleStars"]];
    [bg addSubview:update->star];
    [update->star mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@([CHDevice byW:52]));
        make.top.equalTo(update->title.mas_bottom).offset([CHDevice byW:20*2]);
        make.height.width.equalTo(@15);
    }];
    
    update->vint = [[UILabel alloc] init];
    update->vint.font = [CHDevice BiSystemFontSize:24];
    update->vint.text = vint;
    update->vint.backgroundColor = [UIColor groupTableViewBackgroundColor];
    update->vint.textColor = LightBlackBtnColor;
    [bg addSubview:update->vint];
    [update->vint mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(update->star.mas_right).offset([CHDevice byW:8]);
        make.top.equalTo(update->title.mas_bottom).offset([CHDevice byW:42]);
//        make.height.equalTo(@20);
//        make.width.greaterThanOrEqualTo(@10);
    }];
    
    update->vtime = [[UILabel alloc] init];
    update->vtime.font = [CHDevice BiSystemFontSize:24];
    update->vtime.text = vtime;
    update->vtime.backgroundColor = [UIColor groupTableViewBackgroundColor];
    update->vtime.textColor =LightBlackBtnColor;
    [bg addSubview:update->vtime];
    [update->vtime mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(update->vint.mas_left);
        make.top.equalTo(update->vint.mas_bottom).offset([CHDevice byW:10]);
//        make.height.equalTo(@20);
//        make.width.greaterThanOrEqualTo(@10);
    }];
    
    
    update->vcontent = [[UITextView alloc]init];
    update->vcontent.editable = NO;
    update->vcontent.font = [CHDevice BiSystemFontSize:24];
    update->vcontent.text = vcontent;
    [bg addSubview:update->vcontent];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = 5;// 字体的行间距
    
    NSDictionary *attributes = @{
                                 NSFontAttributeName:[UIFont systemFontOfSize:15],
                                 NSParagraphStyleAttributeName:paragraphStyle
                                 };
    update->vcontent.attributedText = [[NSAttributedString alloc] initWithString:update->vcontent.text attributes:attributes];

    
    
    [update->vcontent mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(update->vint.mas_left);
        make.top.equalTo(update->vtime.mas_bottom).offset([CHDevice byW:19*2]);
        make.height.equalTo(@70);
        make.right.equalTo(@-40);
    }];
    
    UIButton* cancel = [UIButton initWithTitle:@"取消" andActionBlock:^{
        [update diss];
    }];
    cancel.titleLabel.font = [CHDevice BiSystemFontSize:26];
    [cancel setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [bg addSubview:cancel];
    [cancel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@([CHDevice byW:45*2]));
        make.top.equalTo(update->vcontent.mas_bottom).offset([CHDevice byW:31*2]);
        make.bottom.equalTo(@(-[CHDevice byW:40]));
//        make.height.equalTo(@50);
//        make.right.equalTo(update.mas_centerX).offset(-20);
    }];
    
    UIButton* updatebut = [UIButton initWithTitle:@"升级" andActionBlock:^{
        [update diss];
        updateBlock();
    }];
    updatebut.titleLabel.font = [CHDevice BiSystemFontSize:26];
    [updatebut setTitleColor:[UIColor colorWithRed:110/255.0 green:134/255.0 blue:211/255.0 alpha:1.0] forState:UIControlStateNormal];
    [bg addSubview:updatebut];
    [updatebut mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.right.equalTo(@0);
        make.right.equalTo(@(-[CHDevice byW:45*2]));
        make.top.equalTo(update->vcontent.mas_bottom).offset([CHDevice byW:31*2]);
//        make.height.equalTo(@50);
        make.bottom.equalTo(@(-[CHDevice byW:40]));
//        make.left.equalTo(update.mas_centerX).offset(20);
    }];
    
    UIView* line = [[UIView alloc]init];
    [bg addSubview:line];
    line.backgroundColor = [UIColor colorWithRed:110/255.0 green:134/255.0 blue:211/255.0 alpha:1.0];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(update->star.mas_centerX);
        make.top.equalTo(update->vtime.mas_top).offset(2);
        make.width.equalTo(@1);
        make.bottom.equalTo(update->vcontent.mas_bottom);
    }];
    
    [bg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@([CHDevice byW:20*2]));
        make.right.equalTo(@(-[CHDevice byW:20*2]));
//        make.bottom.equalTo(updatebut.mas_bottom);
        make.top.equalTo(@([CHDevice byW:153*2]));
//        make.centerY.equalTo(update.mas_centerY);
    }];
    return update;
}
-(void)show{
    [UIView animateWithDuration:0.3 animations:^{
        self.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.2 animations:^{
            self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5f];
        }];
    }];
}
-(void)diss{
    [UIView animateWithDuration:0.2 animations:^{
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.0f];
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.3 animations:^{
           self.frame = CGRectMake([UIScreen mainScreen].bounds.size.width, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
        } completion:^(BOOL finished) {
           self.frame = CGRectMake(-[UIScreen mainScreen].bounds.size.width, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
        }];
    }];
}
//获取当前屏幕显示的viewcontroller
- (UIViewController *)getCurrentVC
{
    UIViewController *result = nil;
    
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows)
        {
            if (tmpWin.windowLevel == UIWindowLevelNormal)
            {
                window = tmpWin;
                break;
            }
        }
    }
    
    UIView *frontView = [[window subviews] objectAtIndex:0];
    id nextResponder = [frontView nextResponder];
    
    if ([nextResponder isKindOfClass:[UIViewController class]])
        result = nextResponder;
    else
        result = window.rootViewController;
    
    return result;
}

@end
