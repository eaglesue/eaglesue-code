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
@interface SearchView ()<UITableViewDelegate, UITableViewDataSource>
{
    CustomTableViewCell *_cell;
}

@property (strong, nonatomic) UITableView * searchTableView;// 展示数据的TableView
@property (strong, nonatomic) IBOutlet UITableView *searchTable;

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
    [self addSubview:_searchTable];
}

#pragma maek - TableView初始化
- (UITableView *)searchTable {
    
    if (!_searchTable) {
        
        _searchTable.delegate = self;
        _searchTable.dataSource = self;
    }
    return _searchTable;
}

- (UITableView *)searchTableView {
    
    if (!_searchTableView) {
        
        _searchTableView = [[UITableView alloc] initWithFrame:[FlexibleFrame frameWithiPhone5Frame:CGRectMake(0, 60, 320, 565 - 60)]];
        _searchTableView.backgroundColor = [UIColor orangeColor];
        _searchTableView.delegate = self;
        _searchTableView.dataSource = self;
    }
    return _searchTableView;
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
