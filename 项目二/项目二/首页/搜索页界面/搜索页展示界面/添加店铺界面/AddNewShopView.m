//
//  AddNewShopView.m
//  一点就评
//
//  Created by rimi on 15/6/30.
//  Copyright (c) 2015年 陈超,苏刁,杜燚项目. All rights reserved.
//

#import "AddNewShopView.h"
#import "CameraSessionView.h"
#import "SystemAdapt.h"
#import "AppDelegate.h"

@interface AddNewShopView ()<CACameraSessionDelegate> {
    
    CameraSessionView *_cameraView;
}

@property (weak, nonatomic) IBOutlet UIView *camera;
@property (weak, nonatomic) IBOutlet UIButton *shopPic;
@property (weak, nonatomic) IBOutlet UITextField *shopName;
@property (weak, nonatomic) IBOutlet UIView *onCameraView;
@property (nonatomic, strong) SystemAdapt *adapt;


/**
 *  屏幕区域截图
 *
 *  @param theView 需要截取的图层
 *  @param r       截图的位置
 *
 *  @return 截图
 */
- (UIImage *)imageFromView: (UIView *) theView   atFrame:(CGRect)r;
- (IBAction)shopPicButtonPress:(UIButton *)sender;
- (IBAction)buttonPressed:(UIButton *)sender;

- (void)initializeAppearance;

@end

@implementation AddNewShopView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self = [[[NSBundle mainBundle] loadNibNamed:@"AddNewShopView" owner:nil options:nil] firstObject];
        self.frame = frame;
        [self initializeAppearance];
    }
    return self;
}


- (void)initializeAppearance {
    _onCameraView.hidden = YES;
    
}

- (UIImage *)imageFromView: (UIView *) theView atFrame:(CGRect)r
{
    UIGraphicsBeginImageContext(theView.frame.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    UIRectClip(r);
    [theView.layer renderInContext:context];
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return  theImage;
}


#pragma mark - <CACameraSessionDelegate>

- (void)didCaptureImage:(UIImage *)image {
    
    CGRect shopPicRect = _shopPic.frame;
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.bounds];
    imageView.image = image;
    UIImage *backgroundImage = [self imageFromView:imageView atFrame:shopPicRect];
    
    _shopPic.selected = NO;
    _shopName.hidden = NO;
    _onCameraView.hidden = YES;
    [_shopPic setBackgroundImage:backgroundImage forState:UIControlStateNormal];
    
}

- (void)cameraSessionViewNotFindCamera {
    
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [self.adapt presentAlertViewControllerTitle:@"提示" content:@"居然没有摄像头，这是什么鬼！" cancellActionTitle:@"再试一次" otherActionTitle:@"不试了" action2:^{
        _shopPic.selected = NO;
        _shopName.hidden = NO;
        [_camera removeFromSuperview];

    } onViewController:delegate.window.rootViewController];
}

- (void)cameraSessionViewFailedToCaptureImage {
    
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [self.adapt presentAlertViewControllerTitle:@"提示" content:@"拍照失败" cancellActionTitle:@"再试一次" otherActionTitle:@"不试了" action2:^{
        _shopPic.selected = NO;
        _shopName.hidden = NO;
        [_camera removeFromSuperview];

    } onViewController:delegate.window.rootViewController];
}

#pragma mark - event
- (IBAction)shopPicButtonPress:(UIButton *)sender {
    
    CameraSessionView *cameraView = [[CameraSessionView alloc] initWithFrame:self.bounds];
    [cameraView hideDismissButton];
    [cameraView hideCameraToogleButton];
    cameraView.delegate = self;
    _camera = cameraView;
    
    _shopName.hidden = YES;
    sender.selected = YES;
    
    CGRect shopPicRect = _shopPic.frame;
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:shopPicRect];
    
    CAShapeLayer *mask = [CAShapeLayer layer];
    mask.frame = self.bounds;
    mask.fillColor = [UIColor clearColor].CGColor;
    mask.path = path.CGPath;
    _onCameraView.layer.mask = mask;
}

- (IBAction)buttonPressed:(UIButton *)sender {
    
    [UIView animateWithDuration:0.5 animations:^{
        self.center = CGPointMake(self.center.x, self.center.y * 1.5);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

@end
