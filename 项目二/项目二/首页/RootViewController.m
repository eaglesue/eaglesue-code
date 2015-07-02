//
//  ViewController.m
//  一点就评
//
//  Created by rimi on 15/6/26.
//  Copyright (c) 2015年 陈超,苏刁,杜燚项目. All rights reserved.
//

#import "RootViewController.h"
#import "UIViewController+PortalTransition.h"
#import "CYViewControllerTransitioningDelegate.h"
#import "LoginView.h"
#import "SearchView.h"
#import "ClassfiyButtonViewController.h"

@interface RootViewController ()<UICollisionBehaviorDelegate>
{
    UIView * _basicView;
}

@property (strong, nonatomic) UIButton * searchButton;// 首页搜索按钮
@property (strong, nonatomic) UIButton * classfiyButton;// 首页分类按钮

@property (strong, nonatomic) UIDynamicAnimator * animator;

@property (nonatomic, strong) CYViewControllerTransitioningDelegate *viewControllerTransitionDelegate;

@property (nonatomic, strong) UIImageView * buttonImageView;

- (void)initializeAppearance;

- (void)buttonPressed:(UIButton *)sender;
@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.viewControllerTransitionDelegate = [CYViewControllerTransitioningDelegate new];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(dynimacAnimation) name:@"startAnimaton" object:nil];
    
    [self initializeAppearance];
    
}

- (void)initializeAppearance {
    
    self.view.backgroundColor = [UIColor clearColor];
    
    // 初始化首页背景
    UIImageView *backImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds))];
    backImageView.layer.cornerRadius = CGRectGetWidth(self.view.bounds) / 2;
    backImageView.image = ImageWithName(@"shouye.png");
    [self.view addSubview:backImageView];
    
    _buttonImageView = [[UIImageView alloc] initWithiPhoneFrame:CGRectMake(110, 500, 100, 100)];
    _buttonImageView.image = ImageWithName(@"fenleiButton@2x.png");
    
    // 添加一层物理动画的参照系视图
    _basicView = [[UIView alloc] initWithiPhoneFrame:CGRectMake(0, 0, 320, 280)];
    _basicView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_basicView];
    [_basicView addSubview:self.searchButton];
    
    // 添加重力动画以及旋转动画
    [self dynimacAnimation];
    
    [self.view addSubview:self.classfiyButton];
}

#pragma mark - 重力和旋转动画
- (void)dynimacAnimation {
    
    UIDynamicAnimator *animator = [[UIDynamicAnimator alloc] initWithReferenceView:_basicView];
    UIGravityBehavior *gravityBehavior = [[UIGravityBehavior alloc] initWithItems:@[_searchButton]];
    [animator addBehavior:gravityBehavior];
    
    UICollisionBehavior *collisionBehavior = [[UICollisionBehavior alloc] initWithItems:@[_searchButton]];
    collisionBehavior.translatesReferenceBoundsIntoBoundary = YES;
    collisionBehavior.collisionDelegate = self;
    [animator addBehavior:collisionBehavior];
    
    UIDynamicItemBehavior * itemBehavior = [[UIDynamicItemBehavior alloc] initWithItems:@[_searchButton]];
    itemBehavior.elasticity = 0.5;
    [animator addBehavior:itemBehavior];
    
    self.animator = animator;
    
    // 分类按钮背景以及动画
    [UIView animateWithDuration:15 animations:^{
        
        _buttonImageView.layer.transform = CATransform3DRotate(_buttonImageView.layer.transform, M_2_PI * 5, 0, 0, 1);
    }];
    [self.view addSubview:_buttonImageView];
    
}


- (void)collisionBehavior:(UICollisionBehavior *)behavior beganContactForItem:(id<UIDynamicItem>)item withBoundaryIdentifier:(id<NSCopying>)identifier atPoint:(CGPoint)p {
    
    [UIView animateWithDuration:1 animations:^{
       
        _searchButton.layer.transform = CATransform3DRotate(_searchButton.layer.transform, M_2_PI * 5, 0, 1, 0);

        
    }];
}

- (void)collisionBehavior:(UICollisionBehavior *)behavior endedContactForItem:(id<UIDynamicItem>)item withBoundaryIdentifier:(id<NSCopying>)identifier {
    
    
}
#pragma mark - 控件初始化
- (UIButton *)searchButton {
    
    if (!_searchButton) {
        
        _searchButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _searchButton.frame = [FlexibleFrame frameWithiPhone5Frame:CGRectMake(118, 0, 80, 80)];
        [_searchButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [_searchButton setImage:ImageWithName(@"search.png") forState:UIControlStateNormal];
        [_searchButton setTag:100];
        [_searchButton addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
        UILabel *lable = [[UILabel alloc] initWithiPhoneFrame:CGRectMake(20, 21, 40, 20)];
        lable.text = @"搜索";
        lable.textAlignment = NSTextAlignmentCenter;
        lable.textColor = [UIColor redColor];
        [_searchButton addSubview:lable];
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
            _searchButton.frame = [FlexibleFrame frameWithiPhone5Frame:CGRectMake(118, 0, 80, 80)];
            SearchView * searchView = [[SearchView alloc] initWithiPhoneFrame:CGRectMake(0, 0, 320, 565)];
            [self.view addSubview:searchView];
            
        }
            break;
            
        case 1:
        {
            ClassfiyButtonViewController * classfiyView = [ClassfiyButtonViewController new];
            classfiyView.view.frame = [FlexibleFrame frameWithiPhone5Frame:CGRectMake(0, 0, 320, 565)];
            classfiyView.modalPresentationStyle = UIModalPresentationCustom;
            self.viewControllerTransitionDelegate.viewController = classfiyView;
            [self presentPortalTransitionViewController:classfiyView completion:nil];
            _searchButton.frame = [FlexibleFrame frameWithiPhone5Frame:CGRectMake(118, 0, 80, 80)];
        }
            break;
            
        default:
            break;
    }
}



@end
