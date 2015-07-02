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
@property (strong, nonatomic) UIButton * positionButton;// 定位按钮
@property (strong, nonatomic) UILabel  * commentNum;// 评论数量
@property (strong, nonatomic) UIButton * sayGoodButton;// 点赞按钮;

@property (strong, nonatomic) UITableView * detailComment;// 评论回复列表

@property (strong, nonatomic) UIView * commentView;// 评论区域
@property (strong, nonatomic) UITextView * commentTextView;// 撰写评论
@property (strong, nonatomic) UIButton * commentButton;// 发送评论

@property (strong, nonatomic) UIButton * backButton;// 界面返回按钮

@end
@implementation CustomDetailView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
       
        self.backgroundColor = BASIC_COLOR;
        [self addSubview:self.detailShopImageView];
        [self addSubview:self.detailShopName];
        [self addSubview:self.detailShopAddress];
        [self addSubview:self.detailShopClass];
        [self addSubview:self.detailDistance];
        [self addSubview:self.backButton];
        [self addSubview:self.positionButton];
        [self addSubview:self.commentNum];
        [self addSubview:self.sayGoodButton];
        
        [self addSubview:self.detailComment];
        
        [self addSubview:self.commentView];
        [_commentView addSubview:self.commentTextView];
        [_commentView addSubview:self.commentButton];
    }
    return self;
}

#pragma mark - 店铺基本信息控件
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
        
        _detailShopAddress = [[UILabel alloc] initWithFrame:[FlexibleFrame frameWithiPhone5Frame:CGRectMake(120, 50, 120, 20)]];
        _detailShopAddress.text = @"店铺具体地址";
        _detailShopAddress.textAlignment = NSTextAlignmentLeft;
        _detailShopAddress.font = [UIFont systemFontOfSize:12];
        _detailShopAddress.textColor = [UIColor orangeColor];
        _detailShopAddress.numberOfLines = 2;
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
        
        _detailDistance = [[UILabel alloc] initWithFrame:[FlexibleFrame frameWithiPhone5Frame:CGRectMake(120, 110, 120, 20)]];
        _detailDistance.text = @"店铺距离客户的距离";
        _detailDistance.font = [UIFont systemFontOfSize:12];
        _detailDistance.textAlignment = NSTextAlignmentLeft;
        _detailDistance.textColor = [UIColor purpleColor];
        _detailDistance.numberOfLines = 2;
    }
    return _detailDistance;
}

- (UIButton *)positionButton {
    
    if (!_positionButton) {
        
        _positionButton = [[UIButton alloc] initWithiPhoneFrame:CGRectMake(280, 40, 30, 30)];
        [_positionButton setImage:ImageWithName(@"大头针.png") forState:UIControlStateNormal];
        _positionButton.tag = 100;
        [_positionButton addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _positionButton;
}

- (UILabel *)commentNum {
    
    if (!_commentNum) {
        
        _commentNum = [[UILabel alloc] initWithiPhoneFrame:CGRectMake(270, 80, 50, 20)];
        _commentNum.textAlignment = NSTextAlignmentLeft;
        _commentNum.text = @"赞数";
        _commentNum.textColor = [UIColor orangeColor];
    }
    return _commentNum;
}

- (UIButton *)sayGoodButton {
    
    if (!_sayGoodButton) {
        
        _sayGoodButton = [[UIButton alloc] initWithiPhoneFrame:CGRectMake(270, 100, 40, 40)];
        [_sayGoodButton setTitle:@"点赞" forState:UIControlStateNormal];
        _sayGoodButton.titleLabel.textAlignment = NSTextAlignmentCenter;
        [_sayGoodButton setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
        _sayGoodButton.tag = 101;
        [_sayGoodButton addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _sayGoodButton;
}

#pragma mark - 评论展示区域的TableView
- (UITableView *)detailComment {

    if (!_detailComment) {
        
        _detailComment = [[UITableView alloc] initWithFrame:[FlexibleFrame frameWithiPhone5Frame:CGRectMake(0, 150, 320, 565 - 200)]];
        _detailComment.backgroundColor = [UIColor clearColor];
        _detailComment.delegate = self;
        _detailComment.dataSource = self;
    }
    return _detailComment;
}

#pragma mark - 发表评论却区域控件
- (UIView *)commentView {
    
    if (!_commentView) {
        
        _commentView = [[UIView alloc] initWithiPhoneFrame:CGRectMake(50, 520, 320 - 50, 40)];
        _commentView.backgroundColor = [UIColor whiteColor];
    }
    return _commentView;
}

- (UITextView *)commentTextView {
    
    if (!_commentTextView) {
        
        _commentTextView = [[UITextView alloc] initWithiPhoneFrame:CGRectMake(0, 0, 230, 40)];
        _commentTextView.backgroundColor = BASIC_COLOR;
        _commentTextView.textAlignment = NSTextAlignmentLeft;
        _commentTextView.textColor = [UIColor orangeColor];
        _commentTextView.text = @"特备图标去大河比我好好吃不违反本为方便和一般我爸爸了解了解文本服务也不符合我并不wfhyewgbfyebgwygbryeyvgbrebregbirebguierbugbtrubgrebnutugeb";
    }
    return _commentTextView;
}

- (UIButton *)commentButton {
    
    if (!_commentButton) {
        
        _commentButton = [[UIButton alloc] initWithiPhoneFrame:CGRectMake(230, 0, 40, 40)];
        [_commentButton setTitle:@"发表" forState:UIControlStateNormal];
        _commentButton.backgroundColor = [UIColor orangeColor];
    }
    return _commentButton;
}

- (UIButton *)backButton {
    
    if (!_backButton) {
        
        _backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _backButton.frame = [FlexibleFrame frameWithiPhone5Frame:CGRectMake(0, 520, 40, 40)];
        _backButton.backgroundColor = [UIColor orangeColor];
        [_backButton setTitle:@"返回" forState:UIControlStateNormal];
        _backButton.tag = 102;
        [_backButton addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backButton;
}

#pragma mark - 按钮点击事件
- (void)buttonPressed:(UIButton *)sender {
    
    switch (sender.tag - 100) {
        case 0:
        {
            NSLog(@"开始定位");
        }
            break;
        case 1:
        {
         
            NSLog(@"为店铺点赞");
        }
            break;
        case 2:
        {
            
            [self removeFromSuperview];
        }
            break;
        default:
            break;
    }
}


#pragma mark - UITableViewDelegate/UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 10;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
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

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return 10;
}

- (void)tableView:(UITableView *)tableView willDisplayFooterView:(UIView *)view forSection:(NSInteger)section {
    
    view.tintColor = [UIColor clearColor];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 70 * [FlexibleFrame ratio];
}


@end
