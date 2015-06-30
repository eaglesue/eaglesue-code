//
//  CustomDetailView.m
//  一点就评
//
//  Created by rimi on 15/6/26.
//  Copyright (c) 2015年 陈超,苏刁,杜燚项目. All rights reserved.
//

#import "CustomDetailView.h"
#import "CommentTableViewCell.h"

@interface CustomDetailView ()<UITableViewDelegate, UITableViewDataSource>


@property (strong, nonatomic) UIImageView * detailShopImageView;// 店铺照片
@property (strong, nonatomic) UILabel * detailShopName;// 店铺名称
@property (strong, nonatomic) UILabel * detailShopAddress;// 店铺地址
@property (strong, nonatomic) UILabel * detailShopClass;// 店铺类型
@property (strong, nonatomic) UILabel * detailDistance;// 店铺具体离用户的距离


@property (strong, nonatomic) UITableView * detailComment;// 评论回复列表

@property (strong, nonatomic) UIButton * commentButton;// 发表评论按钮

@end
@implementation CustomDetailView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
       
        self.backgroundColor = [UIColor blueColor];
        [self addSubview:self.detailShopImageView];
        [self addSubview:self.detailShopName];
        [self addSubview:self.detailShopAddress];
        [self addSubview:self.detailShopClass];
        [self addSubview:self.detailDistance];
        [self addSubview:self.detailComment];
    }
    return self;
}

#pragma mark - 控件初始化
- (UIImageView *)detailShopImageView {
    
    if (!_detailShopImageView) {
        
        _detailShopImageView = [[UIImageView alloc] initWithFrame:[FlexibleFrame frameWithiPhone5Frame:CGRectMake(10, 20, 100, 110)]];
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


- (UITableView *)detailComment {

    if (!_detailComment) {
        
        _detailComment = [[UITableView alloc] initWithFrame:[FlexibleFrame frameWithiPhone5Frame:CGRectMake(0, 150, 320, 565 - 200)]];
        _detailComment.backgroundColor = [UIColor clearColor];
        _detailComment.delegate = self;
        _detailComment.dataSource = self;
    }
    return _detailComment;
}


//- (UIButton *)commentButton {
//    
//    if (!_commentButton) {
//        
//        _commentButton = [UIButton alloc] initWithiPhoneFrame:CGRectMake(<#CGFloat x#>, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>)
//    }
//}
#pragma mark - UITableViewDelegate/UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString * identifier = @"cell";
    CommentTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        
        cell = [[CommentTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.backgroundColor = [UIColor clearColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 70 * [FlexibleFrame ratio];
}


@end
