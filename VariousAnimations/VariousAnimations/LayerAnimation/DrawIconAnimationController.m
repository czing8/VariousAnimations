//
//  DrawIconAnimationController.m
//  VariousAnimations
//
//  Created by Vols on 16/3/31.
//  Copyright © 2016年 Vols. All rights reserved.
//

#import "DrawIconAnimationController.h"

@interface DrawIconAnimationController ()

@property (nonatomic, assign) NSUInteger count;
@property (nonatomic, strong) UIView * contentView;
@property (nonatomic, strong) UIButton * btn;


@end

@implementation DrawIconAnimationController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];

    if (_contentView != nil) {
        [_contentView removeFromSuperview];
        _contentView = nil;
    }
    
    [self.view addSubview:self.contentView];

    [self drawError];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    [self setupIconLayer];
}


- (void)setupIconLayer{
    _count = 0;
    [self.view addSubview:self.btn];
    self.btn.backgroundColor = [UIColor orangeColor];
    //    [self drawError];
}


#pragma mark -  method

- (void)drawError {
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(100/2, 100/2) radius:100/2 startAngle:0 endAngle:M_PI*2 clockwise:YES];
    
    CGPoint p1 =  CGPointMake(100/4, 100/4);
    [path moveToPoint:p1];
    
    CGPoint p2 =  CGPointMake(100/4*3, 100/4*3);
    [path addLineToPoint:p2];
    
    CGPoint p3 =  CGPointMake(100/4*3, 100/4);
    [path moveToPoint:p3];
    
    CGPoint p4 =  CGPointMake(100/4, 100/4*3);
    [path addLineToPoint:p4];
    
    
    CAShapeLayer *layer = [[CAShapeLayer alloc] init];
    layer.lineWidth = 5;
    layer.path = path.CGPath;
    layer.fillColor = [UIColor clearColor].CGColor;
    layer.strokeColor = [UIColor redColor].CGColor;
    
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:NSStringFromSelector(@selector(strokeEnd))];
    animation.fromValue = @0;
    animation.toValue = @1;
    animation.duration = 0.5;
    [layer addAnimation:animation forKey:NSStringFromSelector(@selector(strokeEnd))];
    
    [self.contentView.layer addSublayer:layer];
}


- (void)drawTick {
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(100/2, 100/2) radius:100/2 startAngle:0 endAngle:M_PI*2 clockwise:YES];
    
    path.lineCapStyle = kCGLineCapRound;
    path.lineJoinStyle = kCGLineCapRound;
    
    [path moveToPoint:CGPointMake(100/4, 100/2)];
    CGPoint p1 = CGPointMake(100/4+10, 100/2+10);
    [path addLineToPoint:p1];
    
    
    CGPoint p2 = CGPointMake(100/4*3, 100/4);
    [path addLineToPoint:p2];
    
    CAShapeLayer *layer = [[CAShapeLayer alloc] init];
    layer.fillColor = [UIColor clearColor].CGColor;
    layer.strokeColor = [UIColor greenColor].CGColor;
    layer.lineWidth = 5;
    layer.path = path.CGPath;
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:NSStringFromSelector(@selector(strokeEnd))];
    animation.fromValue = @0;
    animation.toValue = @1;
    animation.duration = 0.5;
    [layer addAnimation:animation forKey:NSStringFromSelector(@selector(strokeEnd))];
    
    [self.contentView.layer addSublayer:layer];
}


- (void)drawWraning {
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(100/2, 100/2) radius:100/2 startAngle:0 endAngle:M_PI*2 clockwise:YES];
    path.lineCapStyle = kCGLineCapRound;
    path.lineJoinStyle = kCGLineCapRound;
    
    [path moveToPoint:CGPointMake(100/2, 100/6)];
    CGPoint p1 = CGPointMake(100/2, 100/6*3.8);
    [path addLineToPoint:p1];
    
    [path moveToPoint:CGPointMake(100/2, 100/6*4.5)];
    [path addArcWithCenter:CGPointMake(100/2, 100/6*4.5) radius:2 startAngle:0 endAngle:M_PI*2 clockwise:YES];
    
    CAShapeLayer *layer = [[CAShapeLayer alloc] init];
    layer.fillColor = [UIColor clearColor].CGColor;
    layer.strokeColor = [UIColor orangeColor].CGColor;
    layer.lineWidth = 5;
    layer.path = path.CGPath;
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:NSStringFromSelector(@selector(strokeEnd))];
    animation.fromValue = @0;
    animation.toValue = @1;
    animation.duration = 0.5;
    [layer addAnimation:animation forKey:NSStringFromSelector(@selector(strokeEnd))];
    
    [self.contentView.layer addSublayer:layer];
}


- (void)clickAction:(UIButton *)btn{
    
    if (_contentView != nil) {
        [_contentView removeFromSuperview];
        _contentView = nil;
    }
    
    [self.view addSubview:self.contentView];
    
    _count ++;
    
    if (_count%3 == 0) {
        [self drawTick];
    }else if (_count%3 == 1) {
        [self drawWraning];
    }else{
        [self drawError];
    }
}

- (UIView *)contentView{
    if (!_contentView) {
        _contentView = [[UIView alloc] initWithFrame:CGRectMake(kSCREEN_SIZE.width/2, 20, 100, 100)];
        _contentView.center = CGPointMake(self.view.center.x, 260);
    }
    return _contentView;
}

- (UIButton *)btn{
    if (!_btn) {
        _btn = [UIButton buttonWithType:UIButtonTypeCustom];
        _btn.frame = CGRectMake(20, 80, 80, 40);
        _btn.center = CGPointMake(self.view.center.x, 400);

        [_btn setTitle:@"Click" forState:UIControlStateNormal];
        [_btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        [_btn addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btn;
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
