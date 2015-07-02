//
//  SearchView.m
//  一点就评
//
//  Created by rimi on 15/6/26.
//  Copyright (c) 2015年 陈超,苏刁,杜燚项目. All rights reserved.
//

#import "SearchView.h"
#import "FlexibleFrame.h"
#import "CustomTableViewCell.h"
#import "AddNewShopView.h"
@interface SearchView ()<UITableViewDelegate, UITableViewDataSource>
{
    CustomTableViewCell *_cell;
}

@property (strong, nonatomic) UITableView * searchTableView;// 展示数据的TableView

@property (strong, nonatomic) UIButton * searchButton;// 搜索按钮
@property (strong, nonatomic) UITextView * searchTextView;// 搜索框

@property (strong, nonatomic) UIButton * addNewShopButton;// 添加新店铺按钮

- (void)initializeAppearance;
@end

@implementation SearchView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self initializeAppearance];
    }
    return self;
}

- (void)initializeAppearance {
    
    self.backgroundColor = [UIColor cyanColor];
    [self addSubview:self.searchTableView];
    
    [self addSubview:self.searchButton];
    [self addSubview:self.searchTextView];
    [self addSubview:self.addNewShopButton];
}

// 按钮初始化
- (UIButton *)searchButton {
    
    if (!_searchButton) {
        
        _searchButton = [[UIButton alloc] initWithiPhoneFrame:CGRectMake(10, 15, 40, 40)];
        _searchButton.backgroundColor = BASIC_COLOR;
        [_searchButton setTitle:@"搜索" forState:UIControlStateNormal];
        [_searchButton setTag:100];
        [_searchButton addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _searchButton;
}

// 搜索框初始化
- (UITextView *)searchTextView {
    
    if (!_searchTextView) {
        
        _searchTextView = [[UITextView alloc] initWithiPhoneFrame:CGRectMake(60, 15, 200, 40)];
        _searchTextView.backgroundColor = BASIC_COLOR;
    }
    return _searchTextView;
}

// 添加新店铺按钮
- (UIButton *)addNewShopButton {
    
    if (!_addNewShopButton) {
        
        _addNewShopButton = [[UIButton alloc] initWithiPhoneFrame:CGRectMake(270, 15, 40, 40)];
        _addNewShopButton.backgroundColor = BASIC_COLOR;
        [_addNewShopButton setTitle:@"添加" forState:UIControlStateNormal];
        _addNewShopButton.tag = 101;
        [_addNewShopButton addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _addNewShopButton;
}


#pragma maek - TableView初始化
- (UITableView *)searchTableView {
    
    if (!_searchTableView) {
        
        _searchTableView = [[UITableView alloc] initWithFrame:[FlexibleFrame frameWithiPhone5Frame:CGRectMake(0, 60, 320, 565 - 60)]];
        _searchTableView.backgroundColor = [UIColor orangeColor];
        _searchTableView.delegate = self;
        _searchTableView.dataSource = self;
    }
    return _searchTableView;
}

#pragma mark - 按钮触发事件
- (void)buttonPressed:(UIButton *)sender {
    
    NSInteger index = sender.tag - 100;
    switch (index) {
        case 0:
        {
            NSLog(@"开始搜索");
            [[NSNotificationCenter defaultCenter] postNotificationName:@"startAnimaton" object:nil];
            [self removeFromSuperview];
        }
            break;
        case 1:
        {
            NSLog(@"进入添加店铺界面");
            
            AddNewShopView *newShopView = [[[NSBundle mainBundle] loadNibNamed:@"AddNewShopView" owner:nil options:nil] lastObject];
            newShopView.frame = [FlexibleFrame frameWithiPhone5Frame:CGRectMake(0, 0, 320, 565)];
            [self addSubview:newShopView];
        }
            break;
            
        default:
            break;
    }
}

#pragma mark - UITableViewDelegate/UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 11;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString * indentifier = @"cell";
    
     CustomTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
    if (!cell) {
        
        cell = [[CustomTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = [UIColor redColor];
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 60 * [FlexibleFrame ratio];
}
#pragma mark - UITableViewDelegateEvents

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CustomDetailView * detailView = [[CustomDetailView alloc] initWithFrame:[FlexibleFrame frameWithiPhone5Frame:CGRectMake(0, 0, 320, 565)]];
    [self addSubview:detailView];
    
}






@end
