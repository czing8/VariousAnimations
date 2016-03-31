//
//  VRainView.m
//  CAEmitterLayerDemo
//
//  Created by Vols on 15/7/24.
//  Copyright (c) 2015年 Vols. All rights reserved.
//

#import "VRainView.h"

@implementation VRainView

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
    CAEmitterCell * rainflake   = [CAEmitterCell emitterCell];
    rainflake.birthRate         = 25.0;
    rainflake.lifetime          = 7.0;
    rainflake.speed             = 10.0;
    rainflake.velocity          = 30.0;           //速度值
    rainflake.velocityRange     = 10.0;         //速度值的微调值
    rainflake.yAcceleration     = 1000.0;
    rainflake.emissionRange     = 0.5*M_PI;     //发射角度
    rainflake.spinRange         = 0.25*M_PI;
    rainflake.scale             = 0.2;
    rainflake.scaleRange        = 0.0;
    
    rainflake.color             = [UIColor blackColor].CGColor;
    rainflake.contents          = (__bridge id)([UIImage imageNamed:@"raindrop"].CGImage);

    
    self.emitterLaeyr.emitterCells = @[rainflake];
}

@end
