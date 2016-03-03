//
//  AddSubButton.m
//  AddSubButton
//
//  Created by Vols on 16/3/2.
//  Copyright © 2016年 HaierSmart. All rights reserved.
//

#import "AddSubButton.h"

#define kMargin 3

@interface AddSubButton ()

@property (nonatomic, strong) UIButton * addButton;
@property (nonatomic, strong) UIButton * subButton;
@property (nonatomic, strong) UILabel * numLabel;

@property (nonatomic, assign) NSUInteger curNum;

@end


@implementation AddSubButton

static void init(AddSubButton *self) {
    self.backgroundColor = [UIColor clearColor];
    self.curNum = 0;
    [self setupViews];
}

- (id)init {
    self = [super init];
    if (self) {
        init(self);
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        init(self);
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    self.backgroundColor = [UIColor clearColor];
    if(self) {
        init(self);
    }
    return self;
}


- (void)setupViews{
    
    [self addSubview:self.addButton];
    [self addSubview:self.subButton];
    [self addSubview:self.numLabel];
    
    [self bringSubviewToFront:_addButton];
}


- (void)clickAction:(UIButton *)button{

    self.curNum ++;
    _numLabel.text = [NSString stringWithFormat:@"%lu", (unsigned long)_curNum];
    
    [self openAnimation];
}


- (void)subAction:(UIButton *)button{

    self.curNum --;
    _numLabel.text = [NSString stringWithFormat:@"%lu", (unsigned long)_curNum];

    if (_curNum == 0) {
        [self animationWithBtn:_subButton rotate:YES];
        [self animationWithBtn:_numLabel rotate:NO];
    }
}


#pragma mark - animation

- (void)openAnimation{
    
    //弹簧效果
    [UIView animateWithDuration:0.6 delay:0.1 usingSpringWithDamping:0.5 initialSpringVelocity:0 options:UIViewAnimationOptionCurveLinear animations:^{
        _subButton.transform = CGAffineTransformMakeTranslation(-80, 0);
        _numLabel.transform = CGAffineTransformMakeTranslation(-40, 0);
        
    } completion:nil];
}


#pragma mark - properities

- (void)setCurNum:(NSUInteger)curNum{
    _curNum = curNum;
    
    if (self.goodsNum) {
        self.goodsNum(curNum);
    }
}

- (UIButton *)addButton{
    if (!_addButton) {
        _addButton= [UIButton buttonWithType:UIButtonTypeCustom];
        _addButton.frame = CGRectMake(kMargin, kMargin, self.bounds.size.width - kMargin*2, self.bounds.size.height - kMargin*2);
        _addButton.backgroundColor = [UIColor orangeColor];
        [_addButton setTitle:@"+" forState:UIControlStateNormal];
        _addButton.titleLabel.font = [UIFont boldSystemFontOfSize:20];
        _addButton.titleLabel.textColor = [UIColor whiteColor];
        _addButton.layer.cornerRadius = 5.0;
        [_addButton setTitleColor:[UIColor brownColor] forState:UIControlStateHighlighted];
        [_addButton addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _addButton;
}


- (UIButton *)subButton{
    if (!_subButton) {
        _subButton= [UIButton buttonWithType:UIButtonTypeCustom];
        _subButton.frame = CGRectMake(kMargin, kMargin, self.bounds.size.width - kMargin*2, self.bounds.size.height - kMargin*2);
        _subButton.backgroundColor = [UIColor orangeColor];
        [_subButton setTitle:@"-" forState:UIControlStateNormal];
        _subButton.titleLabel.font = [UIFont boldSystemFontOfSize:20];
        _subButton.titleLabel.textColor = [UIColor whiteColor];
        _subButton.layer.cornerRadius = 5.0;
        [_subButton setTitleColor:[UIColor brownColor] forState:UIControlStateHighlighted];
        [_subButton addTarget:self action:@selector(subAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _subButton;
}


- (UILabel *)numLabel{
    if (!_numLabel) {
        _numLabel = [[UILabel alloc] init];
        _numLabel.frame = CGRectMake(kMargin, kMargin, self.bounds.size.width - kMargin*2, self.bounds.size.height - kMargin*2);
        _numLabel.textAlignment = NSTextAlignmentCenter;
        _numLabel.textColor = [UIColor blackColor];
    }
    return _numLabel;
}


//响应按钮点击
-(BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event{
 
    if (CGRectContainsPoint(_subButton.frame, point)) {
        return YES;
    }
    return [super pointInside:point withEvent:event];
    
}

-(void)animationWithBtn:(UIView*)view rotate:(BOOL)rotate{
    
    CABasicAnimation *rotation = [CABasicAnimation new];
    rotation.keyPath = @"transform.rotation";
    rotation.toValue = @(3 * M_PI);
    
    CABasicAnimation *trans = [CABasicAnimation new];
    trans.keyPath = @"transform";
    trans.toValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
    trans.beginTime = 0.2;
    trans.duration = 0.2;
    
    CAAnimationGroup *group = [CAAnimationGroup new];
    group.animations = rotate ? @[rotation,trans] : @[trans];
    group.duration = 0.4;
    group.removedOnCompletion = NO;
    group.fillMode = @"forwards";
    
    [view.layer addAnimation:group forKey:nil];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(group.duration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        view.transform = CGAffineTransformIdentity;
        [view.layer removeAllAnimations];
        
    });
}

@end
