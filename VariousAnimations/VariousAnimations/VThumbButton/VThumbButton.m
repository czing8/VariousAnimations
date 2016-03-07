//
//  VThumbButton.m
//  VThumbUpButtonDemo
//
//  Created by Vols on 15/7/20.
//  Copyright (c) 2015年 Vols. All rights reserved.
//

#import "VThumbButton.h"
#import <QuartzCore/QuartzCore.h>


@implementation VThumbButton{
    UIImageView *_imageView;
    CAEmitterLayer *_effectLayer;
    CAEmitterCell *_effectCell;
    UIImage *_praiseImage;
    UIImage *_unpraiseImage;
}



-(instancetype)initWithFrame:(CGRect)frame image:(UIImage *)image unPraiseImage:(UIImage *)unPraiseImage{
    self=[super initWithFrame:frame];
    if (self) {
        _praiseImage = image;
        _unpraiseImage = unPraiseImage;
        
        [self initBaseLayout];
    }
    return self;
}


/**
 *  Init base layout
 */
-(void)initBaseLayout{
    _isPraise = NO;
    
    _effectLayer=[CAEmitterLayer layer];
    [_effectLayer setFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame))];
    [self.layer addSublayer:_effectLayer];
    [_effectLayer setEmitterShape:kCAEmitterLayerCircle];
    [_effectLayer setEmitterMode:kCAEmitterLayerOutline];
    [_effectLayer setEmitterPosition:CGPointMake(CGRectGetWidth(self.frame)/2, CGRectGetHeight(self.frame)/2)];
    [_effectLayer setEmitterSize:CGSizeMake(CGRectGetWidth(self.frame), CGRectGetHeight(self.frame))];
    
    _effectCell=[CAEmitterCell emitterCell];
    [_effectCell setName:@"praiseShape"];
    [_effectCell setContents:(__bridge id)[UIImage imageNamed:@"EffectImage"].CGImage];
    [_effectCell setAlphaSpeed:-1.0f];
    [_effectCell setLifetime:1.0f];
    [_effectCell setBirthRate:0];
    [_effectCell setVelocity:50];
    [_effectCell setVelocityRange:50];
    
    [_effectLayer setEmitterCells:@[_effectCell]];
    
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame))];
    [_imageView setImage:_unpraiseImage];
    [_imageView setUserInteractionEnabled:YES];
    [self addSubview:_imageView];
    
    UITapGestureRecognizer *tapImageViewGesture=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(praiseAnimationPlay)];
    [_imageView addGestureRecognizer:tapImageViewGesture];
}


/**
 *  An animation for praise action
 */
-(void)praiseAnimationPlay{
    [self setIsPraise:!self.isPraise];
    if (self.clickHandler!=nil) {
        self.clickHandler(self);
    }
    [UIView animateWithDuration:0.2f delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        [_imageView setBounds:CGRectMake(0, 0, CGRectGetWidth(self.frame)*1.5, CGRectGetHeight(self.frame)*1.5)];
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.3f delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
            [_imageView setBounds:CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame))];
        } completion:^(BOOL finished) {
            if (self.isPraise) {
                CABasicAnimation *effectLayerAnimation=[CABasicAnimation animationWithKeyPath:@"emitterCells.praiseShape.birthRate"];
                [effectLayerAnimation setFromValue:[NSNumber numberWithFloat:100]];
                [effectLayerAnimation setToValue:[NSNumber numberWithFloat:0]];
                [effectLayerAnimation setDuration:0.0f];
                [effectLayerAnimation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
                [_effectLayer addAnimation:effectLayerAnimation forKey:@"PraiseCount"];
            }
        }];
    }];
}

#pragma mark - Property method
- (void)setIsPraise:(BOOL)isPraise
{
    _isPraise = isPraise;
    if (isPraise) {
        [_imageView setImage:_praiseImage];
    }else{
        [_imageView setImage:_unpraiseImage];
    }
}

@end
