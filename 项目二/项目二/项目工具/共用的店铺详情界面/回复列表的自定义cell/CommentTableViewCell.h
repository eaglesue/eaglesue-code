//
//  CommentTableViewCell.h
//  一点就评
//
//  Created by rimi on 15/6/26.
//  Copyright (c) 2015年 陈超,苏刁,杜燚项目. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommentTableViewCell : UITableViewCell

@property (strong, nonatomic) UIImageView * userPic;// 用户头像
@property (strong, nonatomic) UILabel * userName;// 用户名称
@property (strong, nonatomic) UILabel * commentTime;// 评论时间
@property (strong, nonatomic) UILabel * commentInfo;// 评论内容

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;
@end
