//
//  JHViewController.m
//  JHKit
//
//  Created by 274180213@qq.com on 08/13/2021.
//  Copyright (c) 2021 274180213@qq.com. All rights reserved.
//

#import "JHViewController.h"
#import <JHKit/JHKit.h>
@interface JHViewController ()<UITextFieldDelegate>

@end

@implementation JHViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    UITextField * textField = [[UITextField alloc]init];
    textField.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    return [textField jh_textField:textField
     shouldChangeCharactersInRange:range
                 replacementString:string
                   keepDecimailNum:2
                        integerNum:10];
}
@end
