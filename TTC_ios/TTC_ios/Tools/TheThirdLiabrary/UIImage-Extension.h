//
//  UIImage-Extensions.h
//  呦呦网络
//
//  Created by mac_ming on 14-4-9.
//  Copyright (c) 2014年 liming. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIImage (CS_Extension)

- (UIImage *)imageAtRect:(CGRect)rect;

+ (UIImage *)imageWithName:(NSString*)fileName;
+ (UIImage *)imageWithNamePNG:(NSString*)fileName;
+ (UIImage *)imageWithName2xPNG:(NSString *)fileName;
+ (UIImage *)imageWithNameJPG:(NSString *)fileName;

- (UIImage *)imageMarkImage:(CGRect)markRect
                  markImage:(UIImage*)markImage;

+ (UIImage *)imageWithColor:(UIColor*)color;

@end;


@interface UIImage(refilection)

+(UIImage *)imageScaleNarrow:(UIImage *)img;

//+(UIImage *)imageZoomNarrow:(UIImage *)img;

+ (UIImage *)imageWithNameForBackGroup:(NSString *)imageName capSize:(CGSize)capSize;

+ (UIImage *)imageWith2xNameForBackGroup:(NSString *)imageName capSize:(CGSize)capSize;

+(UIImage *)centerJoinImage:(UIImage *)backImage withImage:(UIImage *)frontImage;

+(UIImage *)imageZoomNarrow:(UIImage *)img size:(CGSize)size;

//等比缩小图片
+(UIImage *) imageCompressForSize:(UIImage *)sourceImage targetSize:(CGSize)size;
-(UIImage *)imageAspectFitCompress:(CGSize)limitSize;
@end
