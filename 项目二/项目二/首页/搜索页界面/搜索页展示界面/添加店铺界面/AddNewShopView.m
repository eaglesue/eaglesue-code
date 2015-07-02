//
//  AddNewShopView.m
//  一点就评
//
//  Created by rimi on 15/6/30.
//  Copyright (c) 2015年 陈超,苏刁,杜燚项目. All rights reserved.
//

#import "AddNewShopView.h"

@interface AddNewShopView ()

- (IBAction)buttonPressed:(UIButton *)sender;

- (void)initializeAppearance;
@end
@implementation AddNewShopView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.frame = frame;
    }
    return self;
}

- (IBAction)buttonPressed:(UIButton *)sender {
    
    [self removeFromSuperview];
}

- (void)initializeAppearance {
    
    
}

@end
