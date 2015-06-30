//
//  FlexibleFrame.h
//  屏幕适配2015-6-26
//
//  Created by rimi on 15/6/26.
//  Copyright (c) 2015年 陈超. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface FlexibleFrame : NSObject


+ (CGFloat)ratio;
+ (CGRect)frameWithiPhone5Frame:(CGRect)iPhone5Frame;

@end
