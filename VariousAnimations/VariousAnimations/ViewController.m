//
//  ViewController.m
//  VariousAnimations
//
//  Created by Vols on 16/3/2.
//  Copyright © 2016年 HaierSmart. All rights reserved.
//

#import "ViewController.h"
#import "AddSubButton.h"
#import "CartButton.h"

#import "VThumbButton.h"

#import "VPulseLayer.h"

#import "VEffectsButton.h"

#define kMaxRadius 160
#define kRGB(r, g, b)        [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]


@interface ViewController ()

@property (nonatomic, strong) CartButton * cartBtn;



@property (nonatomic, strong) UIImageView *beaconView;
@property (nonatomic, strong) VPulseLayer *pulse;


@property (nonatomic, strong) VEffectsButton *thumbupBtn;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    AddSubButton * btn = [[AddSubButton alloc] initWithFrame:CGRectMake(100, 30, 39, 39)];
    btn.goodsNum = ^(NSUInteger num){
        NSLog(@"%lu", (unsigned long)num);
    };
    [self.view addSubview:btn];


    
    _cartBtn = [[CartButton alloc] initWithFrame:CGRectMake(50, 100, 70, 70) image:@"btnInterest2"];
    _cartBtn.cartButtonHandle = ^(){
        NSLog(@"fdfse");
    };
    
    [self.view addSubview:_cartBtn];
    
    
    VThumbButton *zanBtn=[[VThumbButton alloc] initWithFrame:CGRectMake(100, 0, 50, 50) image:[UIImage imageNamed:@"Zan"] unPraiseImage:[UIImage imageNamed:@"UnZan"]];
    [zanBtn setCenter:self.view.center];
    [self.view addSubview:zanBtn];
    
    [zanBtn setClickHandler:^(VThumbButton *zanButton) {
        if (zanButton.isPraise) {
            NSLog(@"Zan!");
        }else{
            NSLog(@"Cancel zan!");
        }
    }];


    [self setupPulse];
    [self setupThumbBtn];
}


- (void)setupThumbBtn{
    _thumbupBtn = [[VEffectsButton alloc] initWithFrame:CGRectMake(0, 0, 60, 60) image:[UIImage imageNamed:@"like"]];
    _thumbupBtn.center = (CGPoint){self.view.center.x, self.view.center.y + 50};
//    [_thumbupBtn configureViewWithImage:[UIImage imageNamed:@"like"]];
    _thumbupBtn.imageColorOn = kRGB(253, 128, 35);
    _thumbupBtn.circleColor = kRGB(253, 128, 35);
    _thumbupBtn.clickHandle = ^(){
        NSLog(@"thumbupBtn!");
    };
    [self.view addSubview:self.thumbupBtn];
}

- (void)setupPulse{
    
    [self.view addSubview:self.beaconView];
    self.pulse = [VPulseLayer layer];
    self.pulse.position = self.beaconView.center;
    [self.view.layer insertSublayer:self.pulse below:self.beaconView.layer];
    [self setupInitialValues];
}

#pragma mark - Private

- (void)setupInitialValues {
    
    //    self.radiusSlider.value = 0.5;
    //    [self radiusChanged:nil];
    
    //    self.rSlider.value = 0;
    //    self.gSlider.value = 0.487;
    //    self.bSlider.value = 1.0;
    //    [self colorChanged:nil];
}



- (IBAction)cartClick:(id)sender {
    [_cartBtn doPopAnimation];

}


- (UIImageView *)beaconView {
    if (!_beaconView) {
        _beaconView = [[UIImageView alloc] init];
        _beaconView.frame = CGRectMake(5, 205, 20, 20);
        _beaconView.image = [UIImage imageNamed:@"IPhone_5s"];
        _beaconView.backgroundColor = [UIColor orangeColor];
        _beaconView.center = (CGPoint){self.view.center.x, 100};
        _beaconView.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _beaconView;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
