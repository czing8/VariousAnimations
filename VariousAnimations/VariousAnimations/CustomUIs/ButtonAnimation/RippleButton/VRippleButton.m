//
//  VRippleButton.m
//  RippleButton
//
//  Created by Vols on 14-9-17.
//  Copyright (c) 2014年 Vols. All rights reserved.
//

#import "VRippleButton.h"


@interface VRippleButton (){
    float _edgeWidth;
    SEL _methodName;
    id _superSender;
    UIColor *_rippleColor;
//    NSArray *rippleColors;
    BOOL _isRippleOn;
}

@property (nonatomic, strong) UIImageView * imageView;
@property (nonatomic, strong) UIImage * image;

@end

@implementation VRippleButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
-(instancetype)initWithImage:(UIImage *)image frame:(CGRect)frame target:(SEL)action parent:(id)parent{
    self = [super initWithFrame:frame];
    
    if(self){
        self.image = image;
        
        _methodName = action;
        _superSender = parent;

        [self displayUI];
    }
    
    return self;
}

-(instancetype)initWithImage:(UIImage *)image andFrame:(CGRect)frame onCompletion:(completion)completionBlock {
    self = [super initWithFrame:frame];
    
    if(self){
        self.image = image;
        self.block = completionBlock;

        [self displayUI];
    }
    
    return self;
}

- (void)displayUI{
    [self addSubview:self.imageView];
    
    self.layer.cornerRadius = self.frame.size.height/2;
    self.layer.borderWidth = _edgeWidth;
    self.layer.borderColor = [UIColor colorWithWhite:0.8 alpha:0.9].CGColor;
    
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleTap:)];
    [self addGestureRecognizer:gesture];
}

-(void)setRippleEffectWithColor:(UIColor *)color {
    _rippleColor = color;
}

-(void)setRippeEffectEnabled:(BOOL)enabled {
    _isRippleOn = enabled;
}

- (UIImageView *)imageView{
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
        _imageView.frame = CGRectMake(0, 0, self.frame.size.width-5, self.frame.size.height-5);
        _imageView.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
        _imageView.image = _image;
        _imageView.contentMode = UIViewContentModeScaleAspectFit;   
        _imageView.layer.borderColor = [UIColor clearColor].CGColor;
        _imageView.layer.borderWidth = 2;
        _imageView.clipsToBounds = YES;
        _imageView.layer.cornerRadius = _imageView.frame.size.height/2;
        
    }
    return _imageView;
}



-(void)handleTap:(id)sender {
    
    if (_isRippleOn) {
        UIColor *stroke = _rippleColor ? _rippleColor : [UIColor colorWithWhite:0.8 alpha:0.8];
        
        CGRect pathFrame = CGRectMake(-CGRectGetMidX(self.bounds), -CGRectGetMidY(self.bounds), self.bounds.size.width, self.bounds.size.height);
        UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:pathFrame cornerRadius:self.layer.cornerRadius];
        
        CGPoint shapePosition = [self convertPoint:self.center fromView:nil];

        CAShapeLayer *circleShape = [CAShapeLayer layer];
        circleShape.path = path.CGPath;
        circleShape.position = shapePosition;
        circleShape.fillColor = [UIColor clearColor].CGColor;
        circleShape.opacity = 0;
        circleShape.strokeColor = stroke.CGColor;
        circleShape.lineWidth = 3;
        
        [self.layer addSublayer:circleShape];
        
        CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        scaleAnimation.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
        scaleAnimation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(2.5, 2.5, 1)];
        
        CABasicAnimation *alphaAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
        alphaAnimation.fromValue = @1;
        alphaAnimation.toValue = @0;
        
        CAAnimationGroup *animation = [CAAnimationGroup animation];
        animation.animations = @[scaleAnimation, alphaAnimation];
        animation.duration = 0.5f;
        animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
        [circleShape addAnimation:animation forKey:nil];
    }
    
    [UIView animateWithDuration:0.1 animations:^{
        _imageView.alpha = 0.4;
        self.layer.borderColor = [UIColor colorWithWhite:1 alpha:0.9].CGColor;
    }completion:^(BOOL finished) {
        [UIView animateWithDuration:0.2 animations:^{
            _imageView.alpha = 1;
            self.layer.borderColor = [UIColor colorWithWhite:0.8 alpha:0.9].CGColor;
        }completion:^(BOOL finished) {
            if([_superSender respondsToSelector:_methodName]){
                [_superSender performSelectorOnMainThread:_methodName withObject:nil waitUntilDone:NO];
            }
            
            if(_block) {
                BOOL success= YES;
                _block(success);
            }
        }];
        
    }];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
