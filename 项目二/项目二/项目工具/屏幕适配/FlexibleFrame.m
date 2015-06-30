//
//  FlexibleFrame.m
//  屏幕适配2015-6-26
//
//  Created by rimi on 15/6/26.
//  Copyright (c) 2015年 陈超. All rights reserved.
//

#import "FlexibleFrame.h"

#define SCREEN_SIZE [UIScreen mainScreen].bounds.size
#define IPHONE5_SIZE CGSizeMake(320,565)
@implementation FlexibleFrame

+(CGFloat)ratio {
    
    return SCREEN_SIZE.height/IPHONE5_SIZE.height;
}

+ (CGRect)frameWithiPhone5Frame:(CGRect)iPhone5Frame {
    
    CGFloat x = iPhone5Frame.origin.x * [self ratio];
    CGFloat y = iPhone5Frame.origin.y * [self ratio];
    CGFloat width = iPhone5Frame.size.width * [self ratio];
    CGFloat hight = iPhone5Frame.size.height * [self ratio];
    
    return CGRectMake(x, y, width, hight);
}
@end
