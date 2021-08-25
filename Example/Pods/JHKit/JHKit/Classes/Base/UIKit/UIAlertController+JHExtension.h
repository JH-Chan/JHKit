//
//  UIAlertController+JHExtension.h
//  SGBProject
//
//  Created by 中钧科技 on 2021/8/12.
//  Copyright © 2021 dtx. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIAlertController (JHExtension)
+(void)jh_alertControllerWithTitle:(nullable NSString*)title
                           message:(nullable NSString*)message
                         titleFont:(nullable UIFont*)titleFont
                         titleColor:(nullable UIColor*)titleColor
                           messageFont:(nullable UIFont*)messageFont
                       messageColor:(nullable UIColor*)messageColor
                      buttonTitles:(nullable NSArray*)buttonTitles
                  buttonTextColors:(nullable NSArray<UIColor*>*)buttonTextColors
                          animated: (BOOL)flag
                      buttonAction:(void(^__nullable)(NSInteger index,NSString * title))actionBlock
                        completion:(void (^ __nullable)(void))completion;
@end

NS_ASSUME_NONNULL_END
