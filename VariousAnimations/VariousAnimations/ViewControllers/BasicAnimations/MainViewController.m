//
//  ViewController.m
//  VariousAnimations
//
//  Created by Vols on 16/3/2.
//  Copyright © 2016年 HaierSmart. All rights reserved.
//

#import "MainViewController.h"

#import "FrostedNavigationController.h"

#import "AddSubButton.h"
#import "CartButton.h"
#import "VThumbButton.h"
#import "VPulseLayer.h"
#import "VEffectsButton.h"

#define kMaxRadius 160

@interface MainViewController ()

@property (nonatomic, strong) CartButton * cartBtn;
@property (nonatomic, strong) UIImageView *beaconView;
@property (nonatomic, strong) VPulseLayer *pulse;
@property (nonatomic, strong) VEffectsButton *thumbupBtn;

@property (nonatomic, strong) UIButton *testBtn;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"动画";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"展开菜单"
                                                                             style:UIBarButtonItemStylePlain
                                                                            target:(FrostedNavigationController *)self.navigationController
                                                                            action:@selector(showMenu)];
    
    AddSubButton * btn = [[AddSubButton alloc] initWithFrame:CGRectMake(100, 80, 39, 39)];
    btn.goodsNum = ^(NSUInteger num){
        NSLog(@"%lu", (unsigned long)num);
    };
    [self.view addSubview:btn];


    _cartBtn = [[CartButton alloc] initWithFrame:CGRectMake(50, 200, 70, 70) image:@"btnInterest2"];
    _cartBtn.cartButtonHandle = ^(){
        NSLog(@"fdfse");
    };
    
    [self.view addSubview:_cartBtn];

    [self setupPulse];
    [self setupThumbBtn];
    
    [self.view addSubview:self.testBtn];
}


- (void)setupThumbBtn{
    _thumbupBtn = [[VEffectsButton alloc] initWithFrame:CGRectMake(0, 0, 60, 60) image:[UIImage imageNamed:@"like"]];
    _thumbupBtn.center = (CGPoint){self.view.center.x, self.view.center.y + 50};
//    [_thumbupBtn configureViewWithImage:[UIImage imageNamed:@"like"]];
    _thumbupBtn.imageColorOn = kRGB(253, 128, 35);
    _thumbupBtn.circleColor = kRGB(253, 128, 35);
    _thumbupBtn.clickHandle = ^(){
        NSLog(@"%s", __FUNCTION__);
    };
    [self.view addSubview:self.thumbupBtn];
    
    
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
}

- (void)setupPulse {
    
    [self.view addSubview:self.beaconView];
    self.pulse = [VPulseLayer layer];
    self.pulse.position = self.beaconView.center;
    [self.view.layer insertSublayer:self.pulse below:self.beaconView.layer];
    [self setupInitialValues];
}

#pragma mark - Private

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



- (IBAction)cartClick:(id)sender {
    [_cartBtn doPopAnimation];
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


- (UIButton *)testBtn {
    if (!_testBtn) {
        _testBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _testBtn.showsTouchWhenHighlighted = YES;
        _testBtn.frame = CGRectMake(0, 0, 80, 40);
        _testBtn.center = (CGPoint){self.view.center.x, 200};
        _testBtn.backgroundColor = [UIColor orangeColor];
        [_testBtn setTitle:@"测试" forState:UIControlStateNormal];
        _testBtn.titleLabel.font = [UIFont boldSystemFontOfSize:20];
        [_testBtn.layer setCornerRadius:5.0];
        [_testBtn addTarget:self action:@selector(clickTestBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _testBtn;
}


- (void)clickTestBtnAction:(UIButton *)btn {
    UIView * view = nil;
    /*
    if (btn.tag == kButtonTagThree) {
        view=btn.subviews[0];
    }else{
        view = (UIView *)btn;
    }
    */
    
    view = (UIView *)btn;

    [UIView animateWithDuration:0.1 animations:
     ^(void){
         
         view.transform = CGAffineTransformScale(CGAffineTransformIdentity,0.5, 0.5);
         
     } completion:^(BOOL finished){//do other thing
         [UIView animateWithDuration:0.2 animations:
          ^(void){
              
              view.transform = CGAffineTransformScale(CGAffineTransformIdentity,1.2, 1.2);
              
          } completion:^(BOOL finished){//do other thing
              [UIView animateWithDuration:0.1 animations:
               ^(void){
                   
                   view.transform = CGAffineTransformScale(CGAffineTransformIdentity,1,1);
                   
               } completion:^(BOOL finished){
                   //do other thing
               }];
          }];
     }];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end