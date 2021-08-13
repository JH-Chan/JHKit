//
//  UIAlertController+JHExtension.m
//  SGBProject
//
//  Created by 中钧科技 on 2021/8/12.
//  Copyright © 2021 dtx. All rights reserved.
//

#import "UIAlertController+JHExtension.h"
#import "JHAlertController.h"
#import "UIViewController+JHExtension.h"
@implementation UIAlertController (JHExtension)
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
                        completion:(void (^ __nullable)(void))completion
{
    JHAlertController * alertVc = [JHAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    alertVc.jh_titleFont = titleFont ? titleFont : [UIFont boldSystemFontOfSize:15];
    alertVc.jh_titleColor = titleColor ? titleColor : [UIColor colorWithRed:51/255.0f
                                                                      green:51/255.0f
                                                                       blue:51/255.0f
                                                                      alpha:1];
    alertVc.jh_messageFont = messageFont ? messageFont : [UIFont systemFontOfSize:14];
    alertVc.jh_messageColor = messageColor ? messageColor : [UIColor colorWithRed:51/255.0f
                                                                        green:51/255.0f
                                                                         blue:51/255.0f
                                                                        alpha:1];
    if (buttonTitles.count > 0) {
        [buttonTitles enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            JHAlertAction * jhAlertAction = [JHAlertAction actionWithTitle:obj style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                if (actionBlock) {
                    actionBlock(idx,obj);
                }
            }];
            jhAlertAction.jh_textColor = buttonTextColors.count > idx ? buttonTextColors[idx] : [UIColor blueColor];
            [alertVc addAction:jhAlertAction];
        }];
    }

     alertVc.modalPresentationStyle = UIModalPresentationFullScreen;
    [[UIViewController jh_currentViewController] presentViewController:alertVc
                                                              animated:flag
                                                            completion:completion];
}
@end
