//
//  ViewController.m
//  VariousAnimations
//
//  Created by Vols on 16/3/2.
//  Copyright © 2016年 HaierSmart. All rights reserved.
//

#import "MainViewController.h"
#import "FrostedNavigationController.h"
#import "UIViewController+VTransAnimation.h"

#import "VPulseLayer.h"

#define kMaxRadius 160

@interface MainViewController ()

@property (nonatomic, strong) UIImageView       * beaconView;
@property (nonatomic, strong) VPulseLayer       * pulse;


@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titleLabel.text = @"动画素材库";

    
    [self initData];
    [self displayUIs];
}


- (void)initData {
    
}

- (void)displayUIs {
    [self addShowMenuButton];
    
    [self setupPulse];
    
    [self startTransitionAnimationWithDuration:1 backgroundColor:[UIColor purpleColor] completion:nil];
}


- (void)setupInitialValues {
    /*
     self.radiusSlider.value = 0.5;
     [self radiusChanged:nil];
     
     self.rSlider.value = 0;
     self.gSlider.value = 0.487;
     self.bSlider.value = 1.0;
     [self colorChanged:nil];
     */
}



- (void)setupPulse {
    
    [self.view addSubview:self.beaconView];
    self.pulse = [VPulseLayer layer];
    self.pulse.position = self.beaconView.center;
    [self.view.layer insertSublayer:self.pulse below:self.beaconView.layer];
    [self setupInitialValues];
}



- (UIImageView *)beaconView {
    if (!_beaconView) {
        _beaconView = [[UIImageView alloc] init];
        _beaconView.frame = CGRectMake(5, 205, 20, 20);
        _beaconView.image = [UIImage imageNamed:@"IPhone_5s"];
        _beaconView.backgroundColor = [UIColor orangeColor];
        _beaconView.center = (CGPoint){self.view.center.x, 130};
        _beaconView.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _beaconView;
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
