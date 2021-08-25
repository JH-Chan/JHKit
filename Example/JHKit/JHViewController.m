//
//  JHViewController.m
//  JHKit
//
//  Created by 274180213@qq.com on 08/13/2021.
//  Copyright (c) 2021 274180213@qq.com. All rights reserved.
//

#import "JHViewController.h"
#import <JHKit/JHKit.h>
@interface JHViewController ()

@end

@implementation JHViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    UITextField * textField = [[UITextField alloc]init];
    [textField jh_checkInputTextKeepDecimailNum:10 integerNum:2];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
