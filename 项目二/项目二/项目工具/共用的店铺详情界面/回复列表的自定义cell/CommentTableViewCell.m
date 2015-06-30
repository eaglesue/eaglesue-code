//
//  CommentTableViewCell.m
//  一点就评
//
//  Created by rimi on 15/6/26.
//  Copyright (c) 2015年 陈超,苏刁,杜燚项目. All rights reserved.
//

#import "CommentTableViewCell.h"

@interface CommentTableViewCell ()

@property (strong, nonatomic) UIView * backView;
@end

@implementation CommentTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self addSubview:self.backView];
        [self.backView addSubview:self.userPic];
        [self.backView addSubview:self.userName];
        [self.backView addSubview:self.commentTime];
        [self.backView addSubview:self.commentInfo];
        
    }
    return self;
}

#pragma mark - 控件初始化
- (UIView *)backView {
    
    if (!_backView) {
        
        _backView = [[UIView alloc] initWithiPhoneFrame:CGRectMake(10, 0, 300, 70)];
        _backView.layer.cornerRadius = 10;
        _backView.backgroundColor = [UIColor colorWithRed:235/255.0 green:235/255.0 blue:235/255.0 alpha:1];
        _backView.layer.masksToBounds = YES;
    }
    return _backView;
}

// 用户头像
- (UIImageView *)userPic {
    
    if (!_userPic) {
        
        _userPic = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 30, 30)];
        _userPic.backgroundColor = [UIColor cyanColor];
    }
    return _userPic;
}

// 用户名
- (UILabel *)userName {
    
    if (!_userName) {
        
        _userName = [[UILabel alloc] initWithFrame:CGRectMake(50, 10, 60, 10)];
        _userName.text = @"用户姓名";
        _userName.textAlignment = NSTextAlignmentLeft;
        _userName.textColor = [UIColor orangeColor];
        _userName.font = [UIFont systemFontOfSize:13];
    }
    return _userName;
}

// 用户发表评论的时间
- (UILabel *)commentTime {
    
    if (!_commentTime) {
        
        _commentTime = [[UILabel alloc] initWithFrame:CGRectMake(50, 30, 60, 10)];
        _commentTime.text = @"评论时间";
        _commentTime.textAlignment = NSTextAlignmentLeft;
        _commentTime.textColor = [UIColor orangeColor];
        _commentTime.font = [UIFont systemFontOfSize:13];
    }
    return _commentTime;
}

// 评论内容
- (UILabel *)commentInfo {
    
    if (!_commentInfo) {
        
        _commentInfo = [[UILabel alloc] initWithiPhoneFrame:CGRectMake(130, 10, 180, 50)];
        _commentInfo.text = @"wefewfhjewhfhewihfuyreybgfyregfyrehvurehvruvn";
        _commentInfo.textAlignment = NSTextAlignmentLeft;
        _commentInfo.textColor = [UIColor orangeColor];
        _commentInfo.font = [UIFont systemFontOfSize:13];
    }
    return _commentInfo;
}

@end
