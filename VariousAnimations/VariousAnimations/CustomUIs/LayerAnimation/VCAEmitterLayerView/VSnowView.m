//
//  VSnowView.m
//  CAEmitterLayerDemo
//
//  Created by Vols on 15/7/24.
//  Copyright (c) 2015年 Vols. All rights reserved.
//

#import "VSnowView.h"

@implementation VSnowView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self configureView];
    }
    return self;
}


- (void)configureView{

    self.emitterLaeyr.masksToBounds = YES;
    self.emitterLaeyr.emitterShape  = kCAEmitterLayerLine;
    self.emitterLaeyr.emitterMode   = kCAEmitterLayerSurface;
    self.emitterLaeyr.emitterSize   = self.frame.size;
    self.emitterLaeyr.emitterPosition = CGPointMake(self.bounds.size.width/2.0, -20);
}

- (void)show{
    CAEmitterCell * snowFlake   = [CAEmitterCell emitterCell];
    snowFlake.birthRate         = 1.0;
    snowFlake.speed             = 10.0;
    snowFlake.lifetime          = 60.0;
    snowFlake.velocity          = 2.0;           //速度值
    snowFlake.velocityRange     = 10.0;         //速度值的微调值
    snowFlake.yAcceleration     = 10.0;
    snowFlake.emissionRange     = 0.5*M_PI;     //发射角度
    snowFlake.spinRange         = 0.25*M_PI;
    snowFlake.color             = [UIColor redColor].CGColor;
    snowFlake.contents          = (__bridge id)([UIImage imageNamed:@"snow"].CGImage);
    snowFlake.scale             = 0.5;
    
    self.emitterLaeyr.emitterCells = @[snowFlake];
}

@end
