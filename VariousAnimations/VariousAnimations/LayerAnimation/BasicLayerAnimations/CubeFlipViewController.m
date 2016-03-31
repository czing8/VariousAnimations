//
//  CubeFlipViewController.m
//  Animations
//
//  Created by Vols on 15/7/28.
//  Copyright (c) 2015年 Vols. All rights reserved.
//

#import "CubeFlipViewController.h"

#import <QuartzCore/QuartzCore.h>
#import "CATransform3DPerspect.h"

@interface CubeFlipViewController ()

{
    NSTimer* _timer;
}



@property (retain, nonatomic) IBOutlet UIImageView *image0;
@property (retain, nonatomic) IBOutlet UIImageView *image1;
@property (retain, nonatomic) IBOutlet UIImageView *image2;
@property (retain, nonatomic) IBOutlet UIImageView *image3;

- (void)setCubeFlipAngle:(float)angle;


@end

@implementation CubeFlipViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _timer = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(update) userInfo:nil repeats:YES];

}


- (void)setCubeFlipAngle:(float)angle
{
    CATransform3D move = CATransform3DMakeTranslation(0, 0, 160);
    CATransform3D back = CATransform3DMakeTranslation(0, 0, -160);
    
    CATransform3D rotate0 = CATransform3DMakeRotation(-angle, 0, 1, 0);
    CATransform3D rotate1 = CATransform3DMakeRotation(M_PI_2-angle, 0, 1, 0);
    CATransform3D rotate2 = CATransform3DMakeRotation(M_PI_2*2-angle, 0, 1, 0);
    CATransform3D rotate3 = CATransform3DMakeRotation(M_PI_2*3-angle, 0, 1, 0);
    
    CATransform3D mat0 = CATransform3DConcat(CATransform3DConcat(move, rotate0), back);
    CATransform3D mat1 = CATransform3DConcat(CATransform3DConcat(move, rotate1), back);
    CATransform3D mat2 = CATransform3DConcat(CATransform3DConcat(move, rotate2), back);
    CATransform3D mat3 = CATransform3DConcat(CATransform3DConcat(move, rotate3), back);
    
    _image0.layer.transform = CATransform3DPerspect(mat0, CGPointZero, 500);
    _image1.layer.transform = CATransform3DPerspect(mat1, CGPointZero, 500);
    _image2.layer.transform = CATransform3DPerspect(mat2, CGPointZero, 500);
    _image3.layer.transform = CATransform3DPerspect(mat3, CGPointZero, 500);
}

- (void)update
{
    static float angle = 0;
    angle += 0.05;
    [self setCubeFlipAngle:angle];
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
