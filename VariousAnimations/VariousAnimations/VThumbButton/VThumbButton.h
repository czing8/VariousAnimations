//
//  VThumbButton.h
//  VThumbUpButtonDemo
//
//  Created by Vols on 15/7/20.
//  Copyright (c) 2015年 Vols. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VThumbButton : UIControl

@property (nonatomic, assign) BOOL isPraise;

@property (nonatomic, copy) void (^clickHandler)(VThumbButton *thumbButton);


-(instancetype)initWithFrame:(CGRect)frame image:(UIImage *)image unPraiseImage:(UIImage *)unPraiseImage;

@end
