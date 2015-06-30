//
//  ViewController.m
//  一点就评
//
//  Created by rimi on 15/6/26.
//  Copyright (c) 2015年 陈超,苏刁,杜燚项目. All rights reserved.
//

#import "RootViewController.h"
#import "LoginView.h"
#import "SearchView.h"
#import "ClassfiyButtonView.h"

@interface RootViewController ()

@property (strong, nonatomic) UIButton * searchButton;// 首页搜索按钮
@property (strong, nonatomic) UIButton * classfiyButton;// 首页分类按钮

- (void)initializeAppearance;

- (void)buttonPressed:(UIButton *)sender;
@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self initializeAppearance];
}

- (void)initializeAppearance {
    
    self.view.backgroundColor = [UIColor clearColor];
    UIImageView *backImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds))];
    backImageView.layer.cornerRadius = CGRectGetWidth(self.view.bounds) / 2;
    backImageView.image = [UIImage imageNamed:@"shouye"];
    [self.view addSubview:backImageView];
    
    UIImageView * buttonImageView = [[UIImageView alloc] initWithiPhoneFrame:CGRectMake(110, 500, 100, 100)];
    buttonImageView.image = [UIImage imageNamed:@"fenleiButton"];
    [UIView animateWithDuration:5 animations:^{
        
        buttonImageView.layer.transform = CATransform3DRotate(buttonImageView.layer.transform, M_2_PI * 5, 0, 0, 1);
    }];
    
    [self.view addSubview:buttonImageView];
    
    [self.view addSubview:self.searchButton];
    [self.view addSubview:self.classfiyButton];
}

#pragma mark - 控件初始化
- (UIButton *)searchButton {
    
    if (!_searchButton) {
        
        _searchButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _searchButton.frame = [FlexibleFrame frameWithiPhone5Frame:CGRectMake(110, 180, 100, 100)];
        [_searchButton setImage:[UIImage imageNamed:@"search"] forState:UIControlStateNormal];
        [_searchButton setTag:100];
        [_searchButton addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _searchButton;
}

- (UIButton *)classfiyButton {
    
    if (!_classfiyButton) {
        
        _classfiyButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _classfiyButton.frame = [FlexibleFrame frameWithiPhone5Frame:CGRectMake(118, 565 - 55, 80, 55)];
        _classfiyButton.backgroundColor = [UIColor clearColor];
        [_classfiyButton setTag:101];
        [_classfiyButton addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _classfiyButton;
}

#pragma mark - 触发事件的方法
- (void)buttonPressed:(UIButton *)sender {
    
    NSInteger index = sender.tag - 100;
    
    switch (index) {
        case 0:
        {
            SearchView * searchView = [[SearchView alloc] initWithFrame:CGRectMake(0, 0,CGRectGetWidth(self.view.bounds) , CGRectGetHeight(self.view.bounds) - 60)];
            [self.view addSubview:searchView];
            
        }
            break;
            
        case 1:
        {
            NSLog(@"点击分类按钮");
            LoginView * loginView = [[LoginView alloc] initWithFrame:self.view.bounds];
            [self.view addSubview:loginView];
            
//            ClassfiyButtonView * classfiyView = [[[NSBundle mainBundle] loadNibNamed:@"ClassfiyButtonView" owner:nil options:nil] lastObject];
//            classfiyView.frame = [FlexibleFrame frameWithiPhone5Frame:CGRectMake(0, 0, 320, 565)];
//            [self.view addSubview:classfiyView];
            
        }
            break;
            
        default:
            break;
    }
}







@end
