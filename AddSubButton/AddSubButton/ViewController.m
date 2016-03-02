//
//  ViewController.m
//  AddSubButton
//
//  Created by Vols on 16/3/2.
//  Copyright © 2016年 HaierSmart. All rights reserved.
//

#import "ViewController.h"
#import "AddSubButton.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    AddSubButton * btn = [[AddSubButton alloc] initWithFrame:CGRectMake(100, 100, 39, 39)];
    btn.goodsNum = ^(NSUInteger num){
        NSLog(@"%lu", (unsigned long)num);
    };
    [self.view addSubview:btn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
