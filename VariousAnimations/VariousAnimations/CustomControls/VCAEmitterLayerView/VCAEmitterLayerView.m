//
//  VCAEmitterLayerView.m
//  CAEmitterLayerDemo
//
//  Created by Vols on 15/7/24.
//  Copyright (c) 2015年 Vols. All rights reserved.
//

#import "VCAEmitterLayerView.h"

@implementation VCAEmitterLayerView

+ (Class)layerClass{
    return [CAEmitterLayer class];
}


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _emitterLaeyr = (CAEmitterLayer *)self.layer;
        
    }
    return self;
}


- (void)show{

}


- (void)hide{

}

@end
