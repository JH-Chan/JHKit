//
//  UIViewController+JHExtension.m
//  SGBProject
//
//  Created by 中钧科技 on 2021/8/12.
//  Copyright © 2021 dtx. All rights reserved.
//

#import "UIViewController+JHExtension.h"

@implementation UIViewController (JHExtension)
/**
 当前控制器
 */
+ (UIViewController *)jh_currentViewController
{
    //获得当前活动窗口的根视图
    UIViewController* vc = [UIApplication sharedApplication].keyWindow.rootViewController;
    while (1)
    {
        //根据不同的页面切换方式，逐步取得最上层的viewController
        if ([vc isKindOfClass:[UITabBarController class]]) {
            vc = ((UITabBarController*)vc).selectedViewController;
        }
        if ([vc isKindOfClass:[UINavigationController class]]) {
            vc = ((UINavigationController*)vc).visibleViewController;
        }
        if (vc.presentedViewController) {
            vc = vc.presentedViewController;
        }else{
            break;
        }
    }
    return vc;
}

@end
