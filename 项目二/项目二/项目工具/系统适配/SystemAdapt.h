//
//  SystemAdapt.h
//  项目二
//
//  Created by 苏刁 on 15/7/2.
//  Copyright (c) 2015年 苏刁. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^Block)();

@interface SystemAdapt : NSObject

- (void)presentAlertViewControllerTitle:(NSString *)title content:(NSString *)content cancellActionTitle:(NSString *)action1Title otherActionTitle:(NSString *)action2Title action2:(Block)action2 onViewController:(UIViewController *)VC;

@end
