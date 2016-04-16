//
//  TransAnimationController.m
//  VariousAnimations
//
//  Created by Vols on 16/3/14.
//  Copyright © 2016年 HaierSmart. All rights reserved.
//

#import "TransAnimationController.h"

#import "FrostedNavigationController.h"
#import "UIViewController+VTransAnimation.h"
#import "ShowTransViewController.h"

@interface TransAnimationController ()

@property (weak, nonatomic) IBOutlet UIView *animationView;

@end

@implementation TransAnimationController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBarHidden = NO;
}

- (void)viewWillDisappear:(BOOL)animated{
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
  
    self.title = @"转场动画";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Menu"
                                                                             style:UIBarButtonItemStylePlain
                                                                            target:(FrostedNavigationController *)self.navigationController
                                                                            action:@selector(showMenu)];

    self.view.backgroundColor = [UIColor whiteColor];
    
    [self startTransitionAnimationWithDuration:1 backgroundColor:[UIColor grayColor] completion:nil];
}


- (IBAction)exchangeAction:(id)sender {
    CATransition * transition = [CATransition animation];
    transition.duration = 1;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = @"pageCurl";
    transition.subtype = kCATransitionFromRight;
    
    [_animationView exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
        [_animationView.layer addAnimation:transition forKey:@"animtion"];
}


- (IBAction)pushAction:(id)sender {
    
    CATransition * transition = [CATransition animation];
    transition.duration = 1;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = @"cube";
    transition.subtype = kCATransitionFromRight;

    [self.navigationController.view.layer addAnimation:transition forKey:@"animtion"];
    
    ShowTransViewController * showVC = [[ShowTransViewController alloc]init];
    
    [self.navigationController pushViewController:showVC animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
