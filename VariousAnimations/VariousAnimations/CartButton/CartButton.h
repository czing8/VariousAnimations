//
//  CartButton.h
//  CartButton
//
//  Created by Vols on 16/3/2.
//  Copyright © 2016年 HaierSmart. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^CartButtonHandleBlock)();


@interface CartButton : UIImageView

@property (nonatomic, copy) CartButtonHandleBlock cartButtonHandle;
@property (nonatomic, strong) UIView  *badgeView;

- (id)initWithFrame:(CGRect)frame image:(NSString *)imageStr;

- (void)doPopAnimation;

@end
