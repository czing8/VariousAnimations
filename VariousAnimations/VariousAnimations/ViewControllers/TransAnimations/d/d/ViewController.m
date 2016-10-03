//
//  ViewController.m
//  d
//
//  Created by Vols on 16/8/2.
//  Copyright © 2016年 Vols. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (copy)NSArray * array;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _array = [@[@"2",@"3"] mutableCopy];

    NSLog(@"1");
    
    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"2");
    });
    
    NSLog(@"3");NSLog(@"3");NSLog(@"3");NSLog(@"3");NSLog(@"3");NSLog(@"3");NSLog(@"3");NSLog(@"3");NSLog(@"3");NSLog(@"3");NSLog(@"3");NSLog(@"3");NSLog(@"3");NSLog(@"3");NSLog(@"3");NSLog(@"3");NSLog(@"3");NSLog(@"3");NSLog(@"3");NSLog(@"3");NSLog(@"3");NSLog(@"3");NSLog(@"3");

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
