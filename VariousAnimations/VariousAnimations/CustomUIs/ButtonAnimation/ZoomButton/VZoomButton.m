//
//  CartButton.m
//  CartButton
//
//  Created by Vols on 16/3/2.
//  Copyright © 2016年 HaierSmart. All rights reserved.
//

#import "VZoomButton.h"

@implementation VZoomButton

- (id)initWithFrame:(CGRect)frame image:(NSString *)imageStr {
    self = [super initWithFrame:frame];
    if (self) {
        self.image = [UIImage imageNamed:imageStr];
        self.backgroundColor = [UIColor clearColor];
        self.userInteractionEnabled = YES;
    }
    return self;
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if (_animationType == VZoomAnimationType1) {
        [self startAnimation1];
    }
    else if (_animationType == VZoomAnimationType2) {
        [self startAnimation2];
    }
    
    if (self.clickHandle) {
        self.clickHandle();
    }
}


#pragma mark - Animations

- (void)startAnimation1 {
    [UIView animateWithDuration:0.1 animations: ^(void){
        self.transform = CGAffineTransformScale(CGAffineTransformIdentity,0.5, 0.5);
    } completion:^(BOOL finished){
        
        [UIView animateWithDuration:0.2 animations: ^(void){
            self.transform = CGAffineTransformScale(CGAffineTransformIdentity,1.2, 1.2);
        } completion:^(BOOL finished){
            
            [UIView animateWithDuration:0.1 animations: ^(void){
                self.transform = CGAffineTransformScale(CGAffineTransformIdentity,1.0, 1.0);
            } completion:^(BOOL finished){
                
            }];
        }];
    }];
}

- (void)startAnimation2 {
    double dDuration = 0.1;
    
    [UIView animateWithDuration:dDuration animations:^(void) {
        self.transform = CGAffineTransformMakeScale(1.3, 1.3);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:dDuration animations:^(void) {
            self.transform = CGAffineTransformMakeScale(1.0, 1.0);
        }];
    }];
}





@end
