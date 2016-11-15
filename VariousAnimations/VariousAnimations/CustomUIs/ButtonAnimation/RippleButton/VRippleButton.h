//
//  VRippleButton.h
//  RippleButton
//
//  Created by Vols on 14-9-17.
//  Copyright (c) 2014年 Vols. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^completion)(BOOL success);

@interface VRippleButton : UIView

@property (nonatomic, copy) completion block;

-(instancetype)initWithImage:(UIImage *)image frame:(CGRect)frame target:(SEL)action parent:(id)parent;

-(instancetype)initWithImage:(UIImage *)image andFrame:(CGRect)frame onCompletion:(completion)completionBlock;

-(void)setRippleEffectWithColor:(UIColor *)color;
-(void)setRippeEffectEnabled:(BOOL)setRippeEffectEnabled;

@end
