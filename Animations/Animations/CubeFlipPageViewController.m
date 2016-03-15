//
//  CubeFlipPageViewController.m
//  Animations
//
//  Created by Vols on 15/7/28.
//  Copyright (c) 2015年 Vols. All rights reserved.
//

#import "CubeFlipPageViewController.h"

#import <QuartzCore/QuartzCore.h>
#import "CATransform3DPerspect.h"

#define FLIPANGLE 60




@interface CubeFlipPageViewController ()

{
    NSTimer* _timer;
    int _step;
    bool _go;
}

- (void)update;
- (void)setFlipAngle:(float)angle;


@property (strong, nonatomic) IBOutlet UIView *view0;
@property (strong, nonatomic) IBOutlet UIView *view1;

@end

@implementation CubeFlipPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (IBAction)buttonPressed:(UIButton *)sender
{
    if (_timer == nil)
    {
        _go = sender.tag == 0;
        _timer = [NSTimer scheduledTimerWithTimeInterval:0.016 target:self selector:@selector(update) userInfo:nil repeats:YES];
    }
}

- (void)update
{
    float angle = _step / (float)FLIPANGLE * M_PI / 3.0f;
    if (!_go)
    {
        angle = M_PI/3.0f-angle;
    }
    
    [self setFlipAngle:angle];
    
    _step ++;
    if (_step > FLIPANGLE)
    {
        [_timer invalidate];
        _timer = nil;
        _step = 0;
    }
}

- (void)setFlipAngle:(float)angle
{
    float dis = 160 * 1.732f;
    CATransform3D move = CATransform3DMakeTranslation(0, 0, dis);
    CATransform3D back = CATransform3DMakeTranslation(0, 0, -dis);
    
    CATransform3D rotate0 = CATransform3DMakeRotation(-angle, 0, 1, 0);
    CATransform3D rotate1 = CATransform3DMakeRotation(-angle + M_PI/3.0f, 0, 1, 0);
    
    CATransform3D mat0 = CATransform3DConcat(CATransform3DConcat(move, rotate0), back);
    CATransform3D mat1 = CATransform3DConcat(CATransform3DConcat(move, rotate1), back);
    
    _view0.layer.transform = CATransform3DPerspect(mat0, CGPointZero, 500);
    _view1.layer.transform = CATransform3DPerspect(mat1, CGPointZero, 500);
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
