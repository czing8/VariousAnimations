//
//  PerspectRotateViewController.m
//  Animations
//
//  Created by Vols on 15/7/28.
//  Copyright (c) 2015年 Vols. All rights reserved.
//

#import "PerspectRotateViewController.h"

#import <QuartzCore/QuartzCore.h>
#import "CATransform3DPerspect.h"

@interface PerspectRotateViewController ()
{
    NSTimer* _animTimer;
}
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation PerspectRotateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}



- (IBAction)buttonPressed:(id)sender
{
    UIButton* btn = (UIButton*)sender;
    switch (btn.tag-1000)
    {
        case 0:
            [self stopAnimation];
            _imageView.layer.transform = CATransform3DIdentity;
            break;
            
        case 1:
        {
            [self stopAnimation];
            
            CATransform3D rotate = CATransform3DMakeRotation(M_PI/6, 1, 0, 0);
            _imageView.layer.transform = CATransform3DPerspect(rotate, CGPointMake(0, 0), 200);
            break;
        }
            
        case 2:
        {
            [self stopAnimation];
            
            CATransform3D rotate = CATransform3DMakeRotation(M_PI/6, 0, 1, 0);
            _imageView.layer.transform = CATransform3DPerspect(rotate, CGPointMake(0, 0), 200);
            break;
        }
            
        case 3:
        {
            [self stopAnimation];
            
            CATransform3D rotate = CATransform3DMakeRotation(M_PI/6, 0, 0, 1);
            _imageView.layer.transform = CATransform3DPerspect(rotate, CGPointMake(0, 0), 200);
            break;
        }
            
        case 4:
        {
            if (_animTimer==nil)
            {
                _animTimer = [NSTimer scheduledTimerWithTimeInterval:0.03 target:self selector:@selector(update) userInfo:nil repeats:YES];
            }
        }
        default:
            break;
    }
}



- (void)update
{
    static float angle = 0;
    angle += 0.05f;
    
    CATransform3D transloate = CATransform3DMakeTranslation(0, 0, -200);
    CATransform3D rotate = CATransform3DMakeRotation(angle, 0, 1, 0);
    CATransform3D mat = CATransform3DConcat(rotate, transloate);
    _imageView.layer.transform = CATransform3DPerspect(mat, CGPointMake(0, 0), 500);
}

- (void)stopAnimation
{
    [_animTimer invalidate];
    _animTimer = nil;
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
