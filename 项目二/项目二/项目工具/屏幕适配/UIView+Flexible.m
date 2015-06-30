//
//  UIView+Flexible.m
//  屏幕适配2015-6-26
//
//  Created by rimi on 15/6/26.
//  Copyright (c) 2015年 陈超. All rights reserved.
//

#import "UIView+Flexible.h"
#import "FlexibleFrame.h"

@implementation UIView (Flexible)

- (instancetype)initWithiPhoneFrame:(CGRect)frame {
    
    self = [self initWithFrame:[FlexibleFrame frameWithiPhone5Frame:frame]];
    
    return self;
}

@end
