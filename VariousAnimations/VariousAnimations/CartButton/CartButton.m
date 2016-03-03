//
//  CartButton.m
//  CartButton
//
//  Created by Vols on 16/3/2.
//  Copyright © 2016年 HaierSmart. All rights reserved.
//

#import "CartButton.h"

@implementation CartButton

- (id)initWithFrame:(CGRect)frame image:(NSString *)imageStr
{
    self = [super initWithFrame:frame];
    if (self) {
        self.image = [UIImage imageNamed:imageStr];
        self.backgroundColor = [UIColor clearColor];
        self.userInteractionEnabled = YES;
        [self addSubview:self.badgeView];
    }
    return self;
}

- (void)doPopAnimation{
    double dDuration = 0.05;
    
    [UIView animateWithDuration:dDuration animations:^(void) {
        self.transform = CGAffineTransformMakeScale(1.2, 1.2);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.05 animations:^(void) {
            self.transform = CGAffineTransformMakeScale(1.0, 1.0);
        }];
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if (self.cartButtonHandle) {
        self.cartButtonHandle();
    }
}

- (UIView *)badgeView{
    if (_badgeView == nil) {
        _badgeView = [[UIView alloc] initWithFrame:CGRectMake(self.bounds.size.width - 20, 15, 10, 10)];
        _badgeView.backgroundColor = [UIColor redColor];
        _badgeView.layer.cornerRadius = 4.0;
    }
    return _badgeView;
}

@end
