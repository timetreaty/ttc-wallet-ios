//
//  CHUpdateView.h
//  GGL
//
//  Created by syhdMacMini4 on 2018/10/22.
//  Copyright © 2018年 syhd. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^UpdateBlock)(void);
NS_ASSUME_NONNULL_BEGIN

@interface CHUpdateView : UIView
-(void)show;
-(void)diss;
+(CHUpdateView*)initWithVint:(NSString*)vint andVtime:(NSString*)vtime andVcontent:(NSString*)vcontent andUpdate:(UpdateBlock)updateBlock;
@end

NS_ASSUME_NONNULL_END
