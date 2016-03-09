//
//  VPulseLayer.h
//  PulseView
//
//  Created by Vols on 15/6/18.
//  Copyright (c) 2015年 Vols. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface VPulseLayer : CALayer

@property (nonatomic, assign) CGFloat radius;                   // default:60pt
@property (nonatomic, assign) NSTimeInterval animationDuration; // default:3s
@property (nonatomic, assign) NSTimeInterval pulseInterval;     // default is 0s

@end
