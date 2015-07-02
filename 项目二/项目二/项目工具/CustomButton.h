//
//  CustomButtom.h
//  一点就评
//
//  Created by rimi on 15-6-26.
//  Copyright (c) 2015年 rimi. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CustomButton;

@protocol CustomButtonDelegate <NSObject>

- (void)customButtonPressed:(CustomButton *)sender;

@end

@interface CustomButton : UIView

- (instancetype)initWithFrame:(CGRect)frame image:(UIImage *)image highlightedImage:(UIImage *)highlightedImage;

@property (weak, nonatomic) id <CustomButtonDelegate> delegate;
@property (strong, nonatomic) UIImageView * buttonImageView;
@property (strong, nonatomic) UILabel *titleLabel;

@end
