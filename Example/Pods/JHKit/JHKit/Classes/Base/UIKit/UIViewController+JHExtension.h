//
//  UIViewController+JHExtension.h
//  SGBProject
//
//  Created by 中钧科技 on 2021/8/12.
//  Copyright © 2021 dtx. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (JHExtension)
/**
 当前控制器
 */
+ (UIViewController *)jh_currentViewController;
@end

NS_ASSUME_NONNULL_END
