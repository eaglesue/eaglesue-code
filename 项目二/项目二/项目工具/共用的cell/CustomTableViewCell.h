//
//  CustomTableViewCell.h
//  一点就评
//
//  Created by rimi on 15/6/26.
//  Copyright (c) 2015年 陈超,苏刁,杜燚项目. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableViewCell : UITableViewCell

@property (strong, nonatomic) UIImageView * shopPic;// 店铺图片
@property (strong, nonatomic) UILabel * shopName;// 店铺名称
@property (strong, nonatomic) UILabel * shopAddress;// 店铺地址
@property (strong, nonatomic) UILabel * theDistanceBetweenYouAddShop;// 距离店铺的距离
@property (strong, nonatomic) UILabel * theShopClass;// 店铺类型

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;
@end
