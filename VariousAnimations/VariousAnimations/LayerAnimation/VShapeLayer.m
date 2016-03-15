//
//  VShapeLayer.m
//  VariousAnimations
//
//  Created by Vols on 16/3/15.
//  Copyright © 2016年 HaierSmart. All rights reserved.
//

#import "VShapeLayer.h"

@implementation VShapeLayer

- (id)init
{
    if ((self = [super init]))
    {
        self.bounds = CGRectMake(0, 0, 200, 200);
        [self setNeedsDisplay];
    }
    return self;
}

+ (BOOL)needsDisplayForKey:(NSString *)key
{
    if ([@"path" isEqualToString:key])
    {
        return YES;
    }
    return [super needsDisplayForKey:key];
}

- (id<CAAction>)actionForKey:(NSString *)key
{
    if ([key isEqualToString:@"path"])
    {
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:key];
        animation.duration = 0.6; //[CATransaction animationDuration];
        animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
        animation.fromValue = (id)[[self presentationLayer] path];
        return animation;
    }
    return [super actionForKey:key];
}

- (void)display
{
    NSLog(@"path: %@", [self.presentationLayer path]);
}

@end
