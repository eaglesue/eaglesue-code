//
//  ClassfiyButtonView.m
//  一点就评
//
//  Created by rimi on 15/6/29.
//  Copyright (c) 2015年 陈超,苏刁,杜燚项目. All rights reserved.
//

#import "ClassfiyButtonViewController.h"
#import "ClassInfoView.h"
#import <BmobSDK/Bmob.h>

@interface ClassfiyButtonViewController ()<CustomButtonDelegate>
{
    CustomButton * _customButton;
}

- (void)initializeAppearance;
@end

@implementation ClassfiyButtonViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self initializeAppearance];
}

- (void)initializeAppearance {
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    imageView.image = [UIImage imageNamed:@"3.jpg"];
    self.view.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin |UIViewAutoresizingFlexibleWidth;
    [self.view addSubview:imageView];

    NSArray * buttonName = @[@"餐饮", @"娱乐", @"电影", @"KTV", @"网吧", @"台球"];
    NSInteger index = 0;
    for (NSInteger i = 0; i < 2; i ++) {
        
        for (NSInteger j = 0; j < 3; j ++) {
            
            _customButton = [[CustomButton alloc] initWithFrame:[FlexibleFrame frameWithiPhone5Frame:CGRectMake(30 + 90 * j, 80 + 90 * i, 80, 80)] image:[UIImage imageNamed:@"fenlei"]highlightedImage:nil];
            _customButton.titleLabel.text = buttonName[index];
            _customButton.titleLabel.textColor = [UIColor redColor];
            _customButton.backgroundColor = [UIColor clearColor];
            _customButton.delegate = self;
            
            [self.view addSubview:_customButton];
            index ++;
        }
        
    }
    
    CustomButton * backButton = [[CustomButton alloc] initWithFrame:[FlexibleFrame frameWithiPhone5Frame:CGRectMake(30, 300, 80, 80)] image:[UIImage imageNamed:@"fenlei"] highlightedImage:nil];
    backButton.titleLabel.text = @"返回";
    backButton.titleLabel.textColor = [UIColor redColor];
    backButton.backgroundColor = [UIColor clearColor];
    backButton.tag = 100;
    backButton.delegate = self;
    
    [self.view addSubview:backButton];
    
}

- (void)customButtonPressed:(CustomButton *)sender {
    
    if ([sender.titleLabel.text isEqualToString:@"餐饮"]) {
        
        NSLog(@"进入餐饮数据页");
        ClassInfoView * classInfoView = [[ClassInfoView alloc] initWithiPhoneFrame:CGRectMake(0, 0, 320, 565)];
        [self.view addSubview:classInfoView];
        
    }else if ([sender.titleLabel.text isEqualToString:@"娱乐"])
    {
        NSLog(@"进入娱乐页面");
        BmobQuery * query = [BmobQuery queryWithClassName:@"data"];
        
        [query findObjectsInBackgroundWithBlock:^(NSArray *array, NSError *error) {
           
            for (BmobObject * obj in array) {
                
                NSLog(@"店铺名字 = %@", [obj objectForKey:@"shopName"]);
            }
        }];
        
        
    }else if ([sender.titleLabel.text isEqualToString:@"电影"])
    {
        NSLog(@"进入电影页面");
    }//.......
    if (sender.tag == 100) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"startAnimaton" object:nil];
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}





@end
