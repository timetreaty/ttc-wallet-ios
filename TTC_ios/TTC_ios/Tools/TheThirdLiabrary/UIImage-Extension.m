//
//  UIImage-Extensions.m
//  呦呦网络
//
//  Created by mac_ming on 14-4-9.
//  Copyright (c) 2014年 liming. All rights reserved.
//
#import "UIImage-Extension.h"

CGFloat DegreesToRadians(CGFloat degrees) {return degrees * M_PI / 180;};
CGFloat RadiansToDegrees(CGFloat radians) {return radians * 180/M_PI;};

@implementation UIImage (CS_Extension)

#pragma mark 使用
+(UIImage *)imageWithName:(NSString *)fileName {
    NSString *path = [[NSBundle mainBundle] pathForResource:fileName ofType:@"png"];
    return [UIImage imageWithContentsOfFile:path];
}

+(UIImage *)imageWithNamePNG:(NSString *)fileName {
    NSString *path = [[NSBundle mainBundle] pathForResource:fileName ofType:@"png"];
    
    return [UIImage imageWithContentsOfFile:path];
}
+(UIImage *)imageWithName2xPNG:(NSString *)fileName{
    NSString *path = [[NSBundle mainBundle] pathForResource:fileName ofType:@"png"];
    UIImage * image = [UIImage imageWithContentsOfFile:path];
    
    return [UIImage imageWithCGImage:image.CGImage scale:2.0 orientation:UIImageOrientationUp];
}
+(UIImage *)imageWithNameJPG:(NSString *)fileName
{
    NSString *path = [[NSBundle mainBundle] pathForResource:fileName ofType:@"jpg"];
    return [UIImage imageWithContentsOfFile:path];
}

-(UIImage *)imageAtRect:(CGRect)rect
{
    
    CGImageRef imageRef = CGImageCreateWithImageInRect([self CGImage], rect);
    UIImage* subImage = [UIImage imageWithCGImage: imageRef];
    CGImageRelease(imageRef);
    
    return subImage;
    
}



- (UIImage *)imageMarkImage:(CGRect)markRect
                  markImage:(UIImage*)markImage
{
    //创建绘图上下文
    UIGraphicsBeginImageContext(self.size);
    
    CGContextRef thisctx=UIGraphicsGetCurrentContext();
    //图像坐标变换
    CGContextRotateCTM(thisctx, M_PI);
    
    CGContextTranslateCTM(thisctx, -self.size.width, -self.size.height);
    //绘制底图
    CGContextDrawImage(thisctx, CGRectMake(0, 0, self.size.width, self.size.height), [self CGImage]);
    //在底图上绘制图片
    CGContextDrawImage(thisctx, CGRectMake(1, 1, self.size.width-2, self.size.height-2), [markImage CGImage]);
    //得到所绘制的图片
    UIImage *newImage=UIGraphicsGetImageFromCurrentImageContext();
    //关闭上下文
    UIGraphicsEndImageContext();
    
    
    return newImage;
}

+ (UIImage *)imageWithColor:(UIColor*)color{
    UIGraphicsBeginImageContext(CGSizeMake(1, 1));
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, CGRectMake(0, 0, 1, 1));
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end



@implementation UIImage(refilection)
+(UIImage *) imageCompressForSize:(UIImage *)sourceImage targetSize:(CGSize)size{
    UIImage *newImage = nil;
    CGSize imageSize = sourceImage.size;
    CGFloat width = imageSize.width;
    CGFloat height = imageSize.height;
    CGFloat targetWidth = size.width;
    CGFloat targetHeight = size.height;
    CGFloat scaleFactor = 0.0;
    CGFloat scaledWidth = targetWidth;
    CGFloat scaledHeight = targetHeight;
    CGPoint thumbnailPoint = CGPointMake(0.0, 0.0);
    if(CGSizeEqualToSize(imageSize, size) == NO){
        CGFloat widthFactor = targetWidth / width;
        CGFloat heightFactor = targetHeight / height;
        if(widthFactor > heightFactor){
            scaleFactor = widthFactor;
        }
        else{
            scaleFactor = heightFactor;
        }
        scaledWidth = width * scaleFactor;
        scaledHeight = height * scaleFactor;
        if(widthFactor > heightFactor){
            thumbnailPoint.y = (targetHeight - scaledHeight) * 0.5;
        }else if(widthFactor < heightFactor){
            thumbnailPoint.x = (targetWidth - scaledWidth) * 0.5;
        }
    }
    
    UIGraphicsBeginImageContext(size);
    
    CGRect thumbnailRect = CGRectZero;
    thumbnailRect.origin = thumbnailPoint;
    thumbnailRect.size.width = scaledWidth;
    thumbnailRect.size.height = scaledHeight;
    [sourceImage drawInRect:thumbnailRect];
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    if(newImage == nil){
        //nslog(@"scale image fail");
    }
    
    UIGraphicsEndImageContext();
    
    return newImage;
    
}
-(UIImage *)imageAspectFitCompress:(CGSize)limitSize{
    CGSize imageSize = self.size;
    CGFloat width = imageSize.width;
    CGFloat height = imageSize.height;
    CGFloat targetWidth = limitSize.width;
    CGFloat targetHeight = limitSize.height;
    if (width <= targetWidth && height <= targetHeight) {
        return self;
    }
    CGFloat wscale = targetWidth/width;
    CGFloat hscale = targetHeight/height;
    CGFloat scale = MIN(wscale, hscale);
    CGRect thumbnailRect = CGRectMake(0, 0, scale * width, scale * height);
    UIGraphicsBeginImageContext(thumbnailRect.size);
    [self drawInRect:thumbnailRect];
    UIImage * newimage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newimage;
}
+(UIImage *)imageScaleNarrow:(UIImage *)img
{
    if (img.size.width>img.size.height) {
        NSInteger itx = (img.size.width-img.size.height)/2;
        
        CGImageRef imageRef =img.CGImage;
        
        CGImageRef image = CGImageCreateWithImageInRect(imageRef,CGRectMake(itx, 0, img.size.height, img.size.height));
        
        return [UIImage imageWithCGImage:image];
        
    }
    if (img.size.width<img.size.height) {
        NSInteger itx = (img.size.height-img.size.width)/2;
        
        CGImageRef imageRef =img.CGImage;
        
        CGImageRef image = CGImageCreateWithImageInRect(imageRef,CGRectMake(0, itx, img.size.width, img.size.width));
        
        return [UIImage imageWithCGImage:image];
    }
    return img;
}



+(UIImage *)imageZoomNarrow:(UIImage *)img size:(CGSize)size
{
    //    CGSize size = CGSizeMake(160, 160);
    
    CGFloat srcScale = img.size.width/img.size.height;
    CGFloat dstScale = size.width/size.height;
    if (srcScale>dstScale) {
        //        NSInteger itx = (img.size.width / img.size.height - 1) * 90;
        
        UIGraphicsBeginImageContext(size);
        [img drawInRect:CGRectMake(0, 0, size.height*srcScale, size.height)];
        UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        return image;
    }
    if (srcScale<dstScale) {
        //        NSInteger itx = (img.size.height / img.size.width - 1) * 90;
        UIGraphicsBeginImageContext(size);
        [img drawInRect:CGRectMake(0, 0,  size.width,size.width/srcScale)];
        UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return image;
    }
    UIGraphicsBeginImageContext(size);
    [img drawInRect:CGRectMake(0, 0,  size.width,size.height)];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+ (UIImage *)imageWithNameForBackGroup:(NSString *)imageName capSize:(CGSize)capSize {
    UIImage *bgImage = [UIImage imageWithName2xPNG:imageName];
    if (bgImage != nil) {
        
        bgImage = [bgImage stretchableImageWithLeftCapWidth:floorf(bgImage.size.width/2)
                                               topCapHeight:floorf(bgImage.size.height/2)];
        
        //        bgImage = [bgImage stretchableImageWithLeftCapWidth:floorf(capSize.width)
        //                                             topCapHeight:floorf(capSize.height)];
    }
    return bgImage;
}
+ (UIImage *)imageWith2xNameForBackGroup:(NSString *)imageName capSize:(CGSize)capSize{
    UIImage * bgImage = [UIImage imageWithName2xPNG:imageName];
    if (bgImage != nil) {
        bgImage = [bgImage stretchableImageWithLeftCapWidth:floorf(capSize.width/2)
                                               topCapHeight:floorf(capSize.height/2)];
    }
    return bgImage;
}
+(UIImage *)centerJoinImage:(UIImage *)backImage withImage:(UIImage *)frontImage{
    CGSize size = backImage.size;
    UIGraphicsBeginImageContext(size);
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    CGSize size1 = frontImage.size;
    CGRect rect1 = CGRectMake((size.width - size1.width)/2, (size.height - size1.height)/2, size1.width, size1.height);
    [backImage drawInRect:rect];
    [frontImage drawInRect:rect1];
    UIImage *resultingImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    return resultingImage;
}
@end

