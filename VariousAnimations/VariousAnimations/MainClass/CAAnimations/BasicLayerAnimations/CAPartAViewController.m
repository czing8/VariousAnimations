//
//  CAPartAViewController.m
//  VariousAnimations
//
//  Created by Vols on 16/3/15.
//  Copyright © 2016年 HaierSmart. All rights reserved.
//

#import "CAPartAViewController.h"

@interface CAPartAViewController ()

@property (nonatomic, strong) UIImageView *trackerImgView;
@property (nonatomic, strong) UIImageView *circleImgView;

@property (nonatomic, strong) UIButton *shakeBtn;
@property (nonatomic, strong) UIButton *trackBtn;

@end

@implementation CAPartAViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.circleImgView];
    [self.view addSubview:self.trackerImgView];
    [self.view addSubview:self.shakeBtn];
    [self.view addSubview:self.trackBtn];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (UIImageView *)circleImgView {
    if (!_circleImgView) {
        _circleImgView = [[UIImageView alloc] init];
        _circleImgView.frame = CGRectMake(5, 5, 124, 124);
        //        _trackerImgView.image = _image;
//        _circleImgView.backgroundColor = [UIColor clearColor];
        _circleImgView.center = self.view.center;
        _circleImgView.contentMode = UIViewContentModeScaleAspectFill;
        _circleImgView.image = [UIImage imageNamed:@"circle"];
    }
    return _circleImgView;
}


- (UIImageView *)trackerImgView {
    if (!_trackerImgView) {
        _trackerImgView = [[UIImageView alloc] init];
        _trackerImgView.frame = CGRectMake(5, 5, 24, 24);
        //        _trackerImgView.image = _image;
//        _trackerImgView.backgroundColor = [UIColor orangeColor];
        _trackerImgView.center = (CGPoint){self.view.center.x, self.view.center.y+90};
        _trackerImgView.contentMode = UIViewContentModeScaleAspectFill;
        _trackerImgView.image = [UIImage imageNamed:@"tracker"];
    }
    return _trackerImgView;
}


- (UIButton *)shakeBtn{
    if (!_shakeBtn) {
        _shakeBtn= [UIButton buttonWithType:UIButtonTypeCustom];
        _shakeBtn.frame = CGRectMake(0, 0, 80, 40);
        _shakeBtn.center = (CGPoint){self.view.center.x - 50, self.view.center.y+200};
        _shakeBtn.backgroundColor = [UIColor orangeColor];
        [_shakeBtn setTitle:@"Shake" forState:UIControlStateNormal];
        _shakeBtn.titleLabel.font = [UIFont boldSystemFontOfSize:20];
        _shakeBtn.titleLabel.textColor = [UIColor whiteColor];
        _shakeBtn.layer.cornerRadius = 5.0;
        [_shakeBtn setTitleColor:[UIColor brownColor] forState:UIControlStateHighlighted];
        [_shakeBtn addTarget:self action:@selector(shakeAnimation:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _shakeBtn;
}


- (UIButton *)trackBtn{
    if (!_trackBtn) {
        _trackBtn= [UIButton buttonWithType:UIButtonTypeCustom];
        _trackBtn.frame = CGRectMake(0, 0, 80, 40);
        _trackBtn.center = (CGPoint){self.view.center.x + 50, self.view.center.y+200};
        _trackBtn.backgroundColor = [UIColor orangeColor];
        [_trackBtn setTitle:@"Start" forState:UIControlStateNormal];
        _trackBtn.titleLabel.font = [UIFont boldSystemFontOfSize:20];
        _trackBtn.titleLabel.textColor = [UIColor whiteColor];
        _trackBtn.layer.cornerRadius = 5.0;
        [_trackBtn setTitleColor:[UIColor brownColor] forState:UIControlStateHighlighted];
        [_trackBtn addTarget:self action:@selector(trackAnimation:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _trackBtn;
}


#pragma mark - Actions

- (void)shakeAnimation:(id)sender
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"position.x";
    animation.values = @[ @0, @10, @-10, @10, @0 ];
    animation.keyTimes = @[ @0, @(1 / 6.0), @(3 / 6.0), @(5 / 6.0), @1 ];
    animation.duration = 0.4;
    
    animation.additive = YES;
    
    [self.trackerImgView.layer addAnimation:animation forKey:@"shake"];
}

- (void)trackAnimation:(id)sender
{
    CGRect boundingRect = CGRectMake(-100, -185, 200, 200);
    
    CAKeyframeAnimation *orbit = [CAKeyframeAnimation animation];
    orbit.keyPath = @"position";
    orbit.path = CFAutorelease(CGPathCreateWithEllipseInRect(boundingRect, NULL));
    orbit.duration = 4;
    orbit.additive = YES;
    orbit.repeatCount = HUGE_VALF;
    orbit.calculationMode = kCAAnimationPaced;
    orbit.rotationMode = /*kCAAnimationRotateAuto*/ nil;
    
    [self.trackerImgView.layer addAnimation:orbit forKey:@"ani-track"];
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
