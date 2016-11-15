//
//  CAPartBViewController.m
//  VariousAnimations
//
//  Created by Vols on 16/3/15.
//  Copyright © 2016年 HaierSmart. All rights reserved.
//

#import "CAPartBViewController.h"

@interface CAPartBViewController ()

@property (nonatomic, strong) CAShapeLayer *animationLayer;
@property (nonatomic, strong) UIButton *testBtn;

@end

@implementation CAPartBViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.testBtn];
}



- (void)setupAnimationLayer
{
    [self.animationLayer removeFromSuperlayer]; self.animationLayer = nil;
    
    CGPoint bottomLeft 	= CGPointMake(35.f, 400.f);
    CGPoint topLeft		= CGPointMake(35.f, 200.f);
    CGPoint bottomRight = CGPointMake(285.f, 400.f);
    CGPoint topRight	= CGPointMake(285.f, 200.f);
    CGPoint roofTip		= CGPointMake(160.f, 100.f);
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:bottomLeft];
    [path addLineToPoint:topLeft];
    [path addLineToPoint:roofTip];
    [path addLineToPoint:topRight];
    [path addLineToPoint:topLeft];
    [path addLineToPoint:bottomRight];
    [path addLineToPoint:topRight];
    [path addLineToPoint:bottomLeft];
    [path addLineToPoint:bottomRight];
    
    CAShapeLayer *pathLayer = [CAShapeLayer layer];
    pathLayer.frame = CGRectMake(35, 100, 250, 200);
    pathLayer.bounds = CGRectMake(35, 100, 250, 200);
    pathLayer.path = path.CGPath;
    pathLayer.strokeColor = [[UIColor blackColor] CGColor];
    pathLayer.fillColor = nil;
    pathLayer.lineWidth = 6.f;
    pathLayer.lineJoin = kCALineJoinRound;
    
    [self.view.layer addSublayer:pathLayer];
    [self setAnimationLayer:pathLayer];
}


- (UIButton *)testBtn{
    if (!_testBtn) {
        _testBtn= [UIButton buttonWithType:UIButtonTypeCustom];
        _testBtn.frame = CGRectMake(0, 0, 80, 40);
        _testBtn.center = (CGPoint){self.view.center.x, self.view.center.y+100};
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
    [self setupAnimationLayer];
    
    [self.animationLayer removeAllAnimations];
    
    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnimation.duration = 10.0;
    pathAnimation.fromValue = @(0);
    pathAnimation.toValue = @(1);
    [self.animationLayer addAnimation:pathAnimation forKey:@"strokeEnd"];
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
