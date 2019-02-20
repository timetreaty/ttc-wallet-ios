//
//  CHToolBar.h
//  PUH
//
//  Created by syhdMacMini4 on 2019/1/14.
//  Copyright © 2019年 syhd. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol CHToolBarDelegate <NSObject>
-(void)tap:(NSInteger)index;
@end
NS_ASSUME_NONNULL_BEGIN

@interface CHToolBar : UIView
@property (nonatomic,weak) id <CHToolBarDelegate>delegate;
-(void)loadModel:(NSArray*)models;
@end

NS_ASSUME_NONNULL_END
