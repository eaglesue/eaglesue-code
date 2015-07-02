//
//  CustomButtom.m
//  一点就评
//
//  Created by rimi on 15-6-26.
//  Copyright (c) 2015年 rimi. All rights reserved.
//

#import "CustomButton.h"

@interface CustomButton () {

    CGRect _frame;
    UILabel * textLable;
}

- (CGFloat)getTwoPointDistance:(CGPoint)firstPoint secondPoint:(CGPoint)secondPoint;

@end

@implementation CustomButton

- (instancetype)initWithFrame:(CGRect)frame image:(UIImage *)image highlightedImage:(UIImage *)highlightedImage
{
    self = [super initWithFrame:frame];
    if (self) {
        
        _buttonImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        _buttonImageView.image = image;
        _buttonImageView.highlightedImage = highlightedImage;
        [self addSubview:_buttonImageView];
        _buttonImageView.userInteractionEnabled = YES;
        _buttonImageView.layer.cornerRadius = frame.size.width / 2;
        _frame = frame;
        
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.center = _buttonImageView.center;
        _titleLabel.bounds = [FlexibleFrame frameWithiPhone5Frame:_buttonImageView.bounds];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        [_buttonImageView addSubview:_titleLabel];
    }
    return self;
}



//两点间距离
- (CGFloat)getTwoPointDistance:(CGPoint)firstPoint secondPoint:(CGPoint)secondPoint {

    return sqrt(pow((firstPoint.x - secondPoint.x), 2) + pow((firstPoint.y - secondPoint.y), 2));
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {

    _buttonImageView.highlighted = NO;
    for (UITouch *touch in touches) {
        
        CGPoint location = [touch locationInView:self];
        if ([self getTwoPointDistance:CGPointMake(location.x , location.y) secondPoint:_buttonImageView.center] < _frame.size.width / 2) {
            
            
            if (_delegate && [_delegate respondsToSelector:@selector(customButtonPressed:)]) {
                
                [_delegate customButtonPressed:self];
            }
            
        }
    }
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {

    for (UITouch *touch in touches) {
        
        CGPoint location = [touch locationInView:self];
        if ([self getTwoPointDistance:CGPointMake(location.x , location.y) secondPoint:_buttonImageView.center] < _frame.size.width / 2) {
            
            _buttonImageView.highlighted = YES;
            
        }
    }

}
@end
