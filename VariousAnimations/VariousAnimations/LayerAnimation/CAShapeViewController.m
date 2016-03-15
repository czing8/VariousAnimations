//
//  CAShapeViewController.m
//  VariousAnimations
//
//  Created by Vols on 16/3/15.
//  Copyright © 2016年 HaierSmart. All rights reserved.
//

#import "CAShapeViewController.h"
#import "ShapeLayerController.h"

@interface CAShapeViewController ()

@property (nonatomic, strong) UIImageView * imageView;

@property (nonatomic, strong) UIButton * resetBtn;
@property (nonatomic, strong) UIButton * startBtn;
@property (nonatomic, strong) UIButton * customBtn;

@property (nonatomic, retain) CAShapeLayer *animationLayer;
@property (nonatomic, retain) UIBezierPath *pathA;
@property (nonatomic, retain) UIBezierPath *pathB;
@property (nonatomic, retain) UIBezierPath *pathC;

@end

@implementation CAShapeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"CA Shape Animation";
    self.view.backgroundColor = [UIColor whiteColor];

    [self.view addSubview:self.imageView];
    
    [self.view addSubview:self.resetBtn];
    [self.view addSubview:self.startBtn];
    [self.view addSubview:self.customBtn];
    
    [self setupAnimationLayer];
}


- (void)setupAnimationLayer
{
    [self.imageView removeFromSuperview]; self.imageView = nil;
    
    CGPoint bottomLeft 	= CGPointMake(35.f, 400.f);
    CGPoint topLeft		= CGPointMake(35.f, 200.f);
    CGPoint bottomRight = CGPointMake(285.f, 400.f);
    CGPoint topRight	= CGPointMake(285.f, 200.f);
    CGPoint roofTip		= CGPointMake(160.f, 300.f);
    
    CGPoint leftTemp    = CGPointMake(80.f, 150.f);
    CGPoint rightTemp   = CGPointMake(240.f, 150.f);
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:bottomLeft];
    [path addLineToPoint:topLeft];
    [path addQuadCurveToPoint:topRight controlPoint:roofTip];
    [path addLineToPoint:bottomRight];
    [path addLineToPoint:bottomLeft];
    [self setPathA:path];
    
    UIBezierPath *pathB = [UIBezierPath bezierPath];
    [pathB moveToPoint:bottomLeft];
    [pathB addLineToPoint:topLeft];
    [pathB addCurveToPoint:topRight controlPoint1:leftTemp controlPoint2:rightTemp];
    [pathB addLineToPoint:bottomRight];
    [pathB addLineToPoint:bottomLeft];
    [self setPathB:pathB];
    
    UIBezierPath *pathC = [UIBezierPath bezierPath];
    [pathC moveToPoint:bottomLeft];
    [pathC addLineToPoint:topLeft];
    [pathC addLineToPoint:topRight];
    [pathC addLineToPoint:bottomRight];
    [pathC addLineToPoint:bottomLeft];
    [self setPathC:pathC];
    
    CAShapeLayer *pathLayer = [CAShapeLayer layer];
    pathLayer.path = path.CGPath;
    pathLayer.strokeColor = nil;
    pathLayer.fillColor = [UIColor greenColor].CGColor;
    pathLayer.lineJoin = kCALineJoinBevel;
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    [imageView setImage:[UIImage imageNamed:@"test.jpg"]];
    imageView.layer.mask = pathLayer;
    [imageView setContentMode:UIViewContentModeScaleAspectFit];
    [self.view addSubview:imageView];
    [self setImageView:imageView];
    
    [self setAnimationLayer:pathLayer];
}

- (void)startAnimation
{
    [self.animationLayer removeAllAnimations];
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"path";
    animation.values = @[ (id)self.pathA.CGPath, (id)self.pathB.CGPath, (id)self.pathC.CGPath ];
    animation.keyTimes = @[ @0, @(4 / 6.0), @1 ];
    animation.duration = .6f;
    [self.animationLayer addAnimation:animation forKey:@"Shape"];
    self.animationLayer.path = self.pathC.CGPath;
}


- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
        _imageView.frame = CGRectMake(0, 0, kSCREEN_SIZE.width, kSCREEN_SIZE.width);
        _imageView.image = [UIImage imageNamed:@"test.jpg"];
        _imageView.backgroundColor = [UIColor orangeColor];
        _imageView.center =  (CGPoint){self.view.center.x, self.view.center.y-100};
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _imageView;
}



- (UIButton *)resetBtn{
    if (!_resetBtn) {
        _resetBtn= [UIButton buttonWithType:UIButtonTypeCustom];
        _resetBtn.frame = CGRectMake(0, 0, 80, 40);
        _resetBtn.center = (CGPoint){self.view.center.x - 120, self.view.center.y+200};
        _resetBtn.backgroundColor = [UIColor orangeColor];
        [_resetBtn setTitle:@"reset" forState:UIControlStateNormal];
        _resetBtn.titleLabel.font = [UIFont boldSystemFontOfSize:20];
        _resetBtn.titleLabel.textColor = [UIColor whiteColor];
        _resetBtn.layer.cornerRadius = 5.0;
        [_resetBtn setTitleColor:[UIColor brownColor] forState:UIControlStateHighlighted];
        [_resetBtn addTarget:self action:@selector(resetAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _resetBtn;
}

- (UIButton *)startBtn{
    if (!_startBtn) {
        _startBtn= [UIButton buttonWithType:UIButtonTypeCustom];
        _startBtn.frame = CGRectMake(0, 0, 80, 40);
        _startBtn.center = (CGPoint){self.view.center.x+20, self.view.center.y+200};
        _startBtn.backgroundColor = [UIColor orangeColor];
        [_startBtn setTitle:@"start" forState:UIControlStateNormal];
        _startBtn.titleLabel.font = [UIFont boldSystemFontOfSize:20];
        _startBtn.titleLabel.textColor = [UIColor whiteColor];
        _startBtn.layer.cornerRadius = 5.0;
        [_startBtn setTitleColor:[UIColor brownColor] forState:UIControlStateHighlighted];
        [_startBtn addTarget:self action:@selector(startAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _startBtn;
}


- (UIButton *)customBtn{
    if (!_customBtn) {
        _customBtn= [UIButton buttonWithType:UIButtonTypeCustom];
        _customBtn.frame = CGRectMake(0, 0, 80, 40);
        _customBtn.center = (CGPoint){self.view.center.x + 120, self.view.center.y+200};
        _customBtn.backgroundColor = [UIColor orangeColor];
        [_customBtn setTitle:@"custom layer" forState:UIControlStateNormal];
        _customBtn.titleLabel.font = [UIFont boldSystemFontOfSize:20];
        _customBtn.titleLabel.textColor = [UIColor whiteColor];
        _customBtn.layer.cornerRadius = 5.0;
        [_customBtn setTitleColor:[UIColor brownColor] forState:UIControlStateHighlighted];
        [_customBtn addTarget:self action:@selector(customAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _customBtn;
}

#pragma mark - Actions

- (void)resetAction:(id)sender
{
    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    pathAnimation.duration = .25f;
    pathAnimation.fromValue = (id)self.pathC.CGPath;
    pathAnimation.toValue = (id)self.pathA.CGPath;
    [self.animationLayer addAnimation:pathAnimation forKey:@"path-reset"];
    self.animationLayer.path = self.pathA.CGPath;
}


- (void)startAction:(UIButton *)btn
{
    [self startAnimation];
}

- (void)customAction:(UIButton *)btn
{
    ShapeLayerController *layVC = [[ShapeLayerController alloc] init];
    [self presentViewController:layVC animated:YES completion:nil];
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
