//
//  RigisterView.m
//  一点就评
//
//  Created by ccclear on 15/6/28.
//  Copyright (c) 2015年 陈超,苏刁,杜燚项目. All rights reserved.
//

#import "RigisterView.h"


@interface RigisterView ()

@property (strong, nonatomic) IBOutlet UITextField *rigisterAccountNumber;
@property (strong, nonatomic) IBOutlet UITextField *rigisterPassword;
@property (strong, nonatomic) IBOutlet UITextField *rigisterName;
@property (strong, nonatomic) IBOutlet UIButton *chooseManButton;
@property (strong, nonatomic) IBOutlet UIButton *chooseGirlButton;
@property (strong, nonatomic) IBOutlet UIButton *accomplishButton;

- (IBAction)backToSubView:(id)sender;

@end
@implementation RigisterView


- (IBAction)backToSubView:(id)sender {
    
    [UIView animateWithDuration:1 animations:^{
        
        [self removeFromSuperview];
    }];
}
@end
