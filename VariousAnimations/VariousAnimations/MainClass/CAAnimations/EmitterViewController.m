//
//  EmitterViewController.m
//  VariousAnimations
//
//  Created by Vols on 16/3/31.
//  Copyright © 2016年 Vols. All rights reserved.
//

#import "EmitterViewController.h"

#import "VSnowView.h"
#import "VRainView.h"

@interface EmitterViewController ()

@end

@implementation EmitterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    [self setupEmitter];
}


- (void)setupEmitter{
    
    VSnowView * snowView = [[VSnowView alloc] initWithFrame:CGRectMake(0, kSCREEN_SIZE.height-160, 200, 200)];
    snowView.center = (CGPoint){self.view.center.x, self.view.center.y - 100};
    [self.view addSubview:snowView];
    [snowView show];
    
    VRainView * rainView = [[VRainView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    rainView.center = (CGPoint){self.view.center.x, self.view.center.y + 100};

    [self.view addSubview:rainView];
    [rainView show];
    
    NSLog(@"%@", NSStringFromCGRect(snowView.frame));
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
