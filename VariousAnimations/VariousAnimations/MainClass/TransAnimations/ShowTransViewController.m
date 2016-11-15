//
//  ShowTransViewController.m
//  VariousAnimations
//
//  Created by Vols on 16/4/16.
//  Copyright © 2016年 Vols. All rights reserved.
//

#import "ShowTransViewController.h"

@interface ShowTransViewController ()

@property (nonatomic, strong) UIButton * backBtn;

@end

@implementation ShowTransViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:self.backBtn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];


    
}

- (void)goBack {
    [self.navigationController popViewControllerAnimated:YES];
}

- (UIButton *)backBtn {
    if (!_backBtn) {
        _backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_backBtn setTitle:@"返回" forState:UIControlStateNormal];
        _backBtn.frame = CGRectMake(0, 0, 100, 40);
        _backBtn.center = self.view.center;
        [_backBtn addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backBtn;
}

@end
