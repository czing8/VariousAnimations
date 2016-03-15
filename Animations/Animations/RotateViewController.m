//
//  RotateViewController.m
//  Animations
//
//  Created by Vols on 15/7/28.
//  Copyright (c) 2015年 Vols. All rights reserved.
//

#import "RotateViewController.h"
#import <QuartzCore/QuartzCore.h>


@interface RotateViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation RotateViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}



- (IBAction)buttonPressed:(id)sender
{
    UIButton* btn = (UIButton*)sender;
    switch (btn.tag-1000)
    {
        case 0:
            _imageView.layer.transform = CATransform3DIdentity;
            break;
            
        case 1:
            _imageView.layer.transform = CATransform3DMakeRotation(M_PI/6, 1, 0, 0);
            break;
            
        case 2:
            _imageView.layer.transform = CATransform3DMakeRotation(M_PI/6, 0, 1, 0);
            break;
            
        case 3:
            _imageView.layer.transform = CATransform3DMakeRotation(M_PI/6, 0, 0, 1);
            break;
            
        default:
            break;
    }
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
