//
//  ClassInfoView.m
//  一点就评
//
//  Created by rimi on 15/6/30.
//  Copyright (c) 2015年 陈超,苏刁,杜燚项目. All rights reserved.
//

#import "ClassInfoView.h"
#import "DBSphereView.h"
@interface ClassInfoView ()

@property (strong, nonatomic) UICollectionView * classCollectionView;

@property (strong, nonatomic) UIButton * backButton;// 返回按钮
@property (nonatomic, retain) DBSphereView *sphereView;

@property (strong, nonatomic) UIButton * detailShopImageView;// 店铺照片
@property (strong, nonatomic) UILabel * detailShopName;// 店铺名称
@property (strong, nonatomic) UILabel * detailShopAddress;// 店铺地址
@property (strong, nonatomic) UILabel * detailShopClass;// 店铺类型
@property (strong, nonatomic) UILabel * detailDistance;// 店铺具体离用户的距离
@property (strong, nonatomic) UIView *halvingLine;//分割线
- (void)initializeAppearance;
@end
@implementation ClassInfoView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = BASIC_COLOR;
        UIView *view = [[UIView alloc] initWithiPhoneFrame:CGRectMake(0, 425, 320, 110)];
        [view addSubview:self.detailShopImageView];
        [view addSubview:self.detailShopName];
        [view addSubview:self.detailShopAddress];
        [view addSubview:self.detailShopClass];
        [view addSubview:self.detailDistance];
        [view addSubview:self.halvingLine];
        [self addSubview:view];
        [self initializeAppearance];
    }
    return self;
}

- (void)initializeAppearance {
    
//    self.backgroundColor = BASIC_COLOR;
    [self addSubview:self.backButton];
    self.backgroundColor = [UIColor whiteColor];
    _sphereView = [[DBSphereView alloc] initWithiPhoneFrame:CGRectMake(10, 80, 300, 300)];
    NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:0];
    for (NSInteger i = 0; i < 50; i ++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
        [btn setTitle:[NSString stringWithFormat:@"P%ld", i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:24.];
        btn.frame = [FlexibleFrame frameWithiPhone5Frame:CGRectMake(0, 0, 50, 50)];

        [btn setImage:ImageWithName(@"jia.png") forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(sphereViewButtonPressed:) forControlEvents:UIControlEventTouchDown];
        [btn addTarget:self action:@selector(sphereViewButtonUpside:) forControlEvents:UIControlEventTouchUpInside];
        [array addObject:btn];
        [_sphereView addSubview:btn];
    }
    [_sphereView setCloudTags:array];
    _sphereView.backgroundColor = [UIColor whiteColor];
    [self addSubview:_sphereView];
    
}



#pragma mark - 店铺基本信息控件
- (UIButton *)detailShopImageView {
    
    if (!_detailShopImageView) {
        
        _detailShopImageView = [[UIButton alloc] initWithFrame:[FlexibleFrame frameWithiPhone5Frame:CGRectMake(10, 20, 100, 110)]];
        _detailShopImageView.backgroundColor = [UIColor brownColor];
        
    }
    return _detailShopImageView;
}

- (UILabel *)detailShopName {
    
    if (!_detailShopName) {
        _detailShopName = [[UILabel alloc] initWithFrame:[FlexibleFrame frameWithiPhone5Frame:CGRectMake(120, 20, 120, 20)]];
        _detailShopName.text = @"店铺名称";
        _detailShopName.textColor = [UIColor orangeColor];
        _detailShopName.font = [UIFont systemFontOfSize:13];
        _detailShopName.textAlignment = NSTextAlignmentLeft;
        
    }
    return _detailShopName;
}

- (UILabel *)detailShopAddress {
    
    if (!_detailShopAddress) {
        
        _detailShopAddress = [[UILabel alloc] initWithFrame:[FlexibleFrame frameWithiPhone5Frame:CGRectMake(120, 50, 150, 20)]];
        _detailShopAddress.text = @"店铺具体地址";
        _detailShopAddress.textAlignment = NSTextAlignmentLeft;
        _detailShopAddress.font = [UIFont systemFontOfSize:13];
        _detailShopAddress.textColor = [UIColor orangeColor];
    }
    return _detailShopAddress;
}

- (UILabel *)detailShopClass {
    
    if (!_detailShopClass) {
        
        _detailShopClass = [[UILabel alloc] initWithFrame:[FlexibleFrame frameWithiPhone5Frame:CGRectMake(120, 80, 80, 20)]];
        _detailShopClass.text = @"店铺类型";
        _detailShopClass.textAlignment = NSTextAlignmentLeft;
        _detailShopClass.font = [UIFont systemFontOfSize:13];
        _detailShopClass.textColor = [UIColor orangeColor];
    }
    return _detailShopClass;
}

- (UILabel *)detailDistance {
    
    if (!_detailDistance) {
        
        _detailDistance = [[UILabel alloc] initWithFrame:[FlexibleFrame frameWithiPhone5Frame:CGRectMake(120, 110, 150, 20)]];
        _detailDistance.text = @"店铺距离客户的距离";
        _detailDistance.font = [UIFont systemFontOfSize:13];
        _detailDistance.textAlignment = NSTextAlignmentLeft;
        _detailDistance.textColor = [UIColor purpleColor];
    }
    return _detailDistance;
}

//分割线
- (UIView *)halvingLine {

    _halvingLine = [[UIView alloc] initWithiPhoneFrame:CGRectMake(10,1, 300, 1)];
    _halvingLine.backgroundColor = [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1];
    return _halvingLine;
}

- (void)sphereViewButtonPressed:(UIButton *)btn
{
    [_sphereView timerStop];
    
    [UIView animateWithDuration:0.3 animations:^{
        btn.transform = CGAffineTransformMakeScale(1.5, 1.5);
    } completion:^(BOOL finished) {
        
    }];
}

- (void)sphereViewButtonUpside:(UIButton *)sender {

    [UIView animateWithDuration:0.3 animations:^{
        sender.transform = CGAffineTransformMakeScale(1., 1.);
    } completion:^(BOOL finished) {
        [_sphereView timerStart];
    }];

}

- (UIButton *)backButton {
    
    if (!_backButton) {
        
        _backButton = [[UIButton alloc] initWithiPhoneFrame:CGRectMake(40, 40, 40, 40)];
        [_backButton setTitle:@"返回" forState:UIControlStateNormal];
        [_backButton setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
        [_backButton addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backButton;
}

- (void)buttonPressed:(UIButton *)sender {
    
    [self removeFromSuperview];
}
@end
