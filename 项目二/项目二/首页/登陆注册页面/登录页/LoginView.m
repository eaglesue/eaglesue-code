//
//  LoginViewController.m
//  一点就评
//
//  Created by ccclear on 15/6/28.
//  Copyright (c) 2015年 陈超,苏刁,杜燚项目. All rights reserved.
//

#import "LoginView.h"
#import "RigisterView.h"

@interface LoginView ()


@property (strong, nonatomic) IBOutlet UIImageView *logoImage;// logo
@property (strong, nonatomic) IBOutlet UITextField *userName;// 用户名
@property (strong, nonatomic) IBOutlet UITextField *password;// 用户密码
@property (strong, nonatomic) IBOutlet UIButton *findPassword;// 找回密码按钮
@property (strong, nonatomic) IBOutlet UIButton *loginButton;// 登录按钮
@property (strong, nonatomic) IBOutlet UIButton *rigisterButton;// 注册按钮
@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (weak, nonatomic) IBOutlet UIButton *registerButton;


- (IBAction)findMyPassword:(id)sender;

- (IBAction)login:(id)sender;

- (IBAction)rigister:(id)sender;

- (IBAction)backToSubView:(id)sender;

- (void)initializeAppearance;

@end

@implementation LoginView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self = [[[NSBundle mainBundle] loadNibNamed:@"LoginView" owner:nil options:nil] lastObject];
        self.frame = frame;
        [self initializeAppearance];
    }
    return self;
}

- (void)initializeAppearance {
    
    NSArray *buttons = @[_backButton, _loginButton, _registerButton];
    for (UIButton *button in buttons) {
        button.layer.cornerRadius = 10;
        button.layer.masksToBounds = YES;
    }
}

- (IBAction)findMyPassword:(id)sender {
    
    NSLog(@"点击找回密码按钮");
}

- (IBAction)login:(id)sender {
    
    NSLog(@"点击登录按钮");
}

- (IBAction)rigister:(id)sender {
    
    NSLog(@"点击登录按钮");
    RigisterView * rigisterView = [[[NSBundle mainBundle] loadNibNamed:@"RigisterView" owner:nil options:nil] lastObject];

    rigisterView.frame = CGRectMake(0, 0, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds));
    [self addSubview:rigisterView];
}

- (IBAction)backToSubView:(id)sender {
    
    [UIView animateWithDuration:1 animations:^{
        
        [self removeFromSuperview];
    }];
}


@end
