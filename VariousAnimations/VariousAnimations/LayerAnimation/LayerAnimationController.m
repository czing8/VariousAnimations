//
//  LayerAnimationController.m
//  VariousAnimations
//
//  Created by Vols on 16/3/14.
//  Copyright © 2016年 HaierSmart. All rights reserved.
//

#import "LayerAnimationController.h"
#import "CAPartBViewController.h"
#import "CAPartAViewController.h"
#import "CAShapeViewController.h"

@interface LayerAnimationController ()

@property (nonatomic, strong) UIButton *testBtn;

@end

@implementation LayerAnimationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"层动画";
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.testBtn];

}


- (UIButton *)testBtn{
    if (!_testBtn) {
        _testBtn= [UIButton buttonWithType:UIButtonTypeCustom];
        _testBtn.frame = CGRectMake(0, 0, 80, 40);
        _testBtn.center = self.view.center;
        _testBtn.backgroundColor = [UIColor orangeColor];
        [_testBtn setTitle:@"测试" forState:UIControlStateNormal];
        _testBtn.titleLabel.font = [UIFont boldSystemFontOfSize:20];
        _testBtn.titleLabel.textColor = [UIColor whiteColor];
        _testBtn.layer.cornerRadius = 5.0;
        [_testBtn setTitleColor:[UIColor brownColor] forState:UIControlStateHighlighted];
        [_testBtn addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _testBtn;
}

- (void)clickAction:(UIButton *)button{
    [self.navigationController pushViewController:[[CAShapeViewController alloc] init] animated:YES];
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
