//
//  LANButton.m
//  LANButton
//
//  Created by casic on 2018/10/29.
//  Copyright © 2018年 CASICloud. All rights reserved.
//

#import "LANButton.h"

@implementation LANButton
- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    BOOL isValid = [super pointInside:point withEvent:event];
    isValid = CGRectContainsPoint(CGRectMake(-_addWidth, -_addHeight, self.bounds.size.width + 2 * _addWidth, self.bounds.size.height + 2 * _addHeight), point);
    return isValid;
}


@end
