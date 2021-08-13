//
//  JHAlertController.m
//  SGBProject
//
//  Created by 中钧科技 on 2021/8/12.
//  Copyright © 2021 dtx. All rights reserved.
//

#import "JHAlertController.h"
#import <objc/runtime.h>
@interface JHAlertController ()

@end

@implementation JHAlertController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initController];
}
-(void)initController
{
    unsigned int count = 0;
        Ivar *ivars = class_copyIvarList([UIAlertController class], &count);
        for(int i = 0;i < count;i ++){
            
            Ivar ivar = ivars[i];
            NSString *ivarName = [NSString stringWithCString:ivar_getName(ivar) encoding:NSUTF8StringEncoding];
            
            //标题颜色
            if ([ivarName isEqualToString:@"_attributedTitle"] && self.title && self.jh_titleColor) {
                NSMutableAttributedString *attr = [[NSMutableAttributedString alloc]initWithString:self.title attributes:@{NSForegroundColorAttributeName:self.jh_titleColor,NSFontAttributeName:self.jh_titleFont != nil ? self.jh_titleFont : [UIFont systemFontOfSize:14]}];
                [self setValue:attr forKey:@"attributedTitle"];
            }
            //描述颜色
            if ([ivarName isEqualToString:@"_attributedMessage"] && self.message && self.jh_messageColor) {
                
                NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:self.message attributes:@{NSForegroundColorAttributeName:self.jh_messageColor,NSFontAttributeName:self.jh_messageFont != nil ? self.jh_messageFont : [UIFont systemFontOfSize:14]}];
                [self setValue:attr forKey:@"attributedMessage"];
            }
        }
        
        //按钮统一颜色
        if (self.jh_tintColor) {
            for (JHAlertAction *action in self.actions) {
                if (!action.jh_textColor) {
                    action.jh_textColor = self.jh_tintColor;
                }
            }
        }
        free(ivars);
}
@end
@implementation JHAlertAction
-(void)setJh_textColor:(UIColor *)jh_textColor
{
    _jh_textColor = jh_textColor;
    if (_jh_textColor) {
        unsigned int count = 0;
        Ivar *ivars = class_copyIvarList([UIAlertAction class], &count);
        for(int i =0;i < count;i ++){
            
            Ivar ivar = ivars[i];
            NSString *ivarName = [NSString stringWithCString:ivar_getName(ivar) encoding:NSUTF8StringEncoding];
            
            if ([ivarName isEqualToString:@"_titleTextColor"]) {
                
                [self setValue:_jh_textColor forKey:@"titleTextColor"];
            }
        }
    }
}
@end
