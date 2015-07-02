//
//  SystemAdapt.m
//  项目二
//
//  Created by 苏刁 on 15/7/2.
//  Copyright (c) 2015年 苏刁. All rights reserved.
//

#import "SystemAdapt.h"

#define iOS8Later [[UIDevice currentDevice].systemVersion floatValue] >= 8.0

@interface SystemAdapt () <UIAlertViewDelegate>

@property (nonatomic, copy) Block action2;

@end

@implementation SystemAdapt

- (void)presentAlertViewControllerTitle:(NSString *)title content:(NSString *)content cancellActionTitle:(NSString *)action1Title otherActionTitle:(NSString *)action2Title action2:(Block)action2 onViewController:(UIViewController *)VC{
    
    _action2 = action2;
    if (iOS8Later) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:content preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancell = [UIAlertAction actionWithTitle:action1Title style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
            [alert.presentingViewController dismissViewControllerAnimated:YES completion:nil];
        }];
        UIAlertAction *otherAction = [UIAlertAction actionWithTitle:action2Title style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            action2();
        }];
        [alert addAction:cancell];
        [alert addAction:otherAction];
        [VC presentViewController:alert animated:YES completion:nil];
    }
    if (!iOS8Later) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:content delegate:self cancelButtonTitle:action1Title otherButtonTitles:action2Title, nil];
        alert.alertViewStyle = UIAlertViewStyleDefault;
        [alert dismissWithClickedButtonIndex:0 animated:YES];
        [alert show];
    }
    
}

#pragma mark - <UIAlertViewDelegate>

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    if (buttonIndex == 1) {
        _action2();
    }
}


@end

