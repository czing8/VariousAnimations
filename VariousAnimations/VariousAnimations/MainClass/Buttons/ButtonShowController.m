//
//  ButtonDisplayController.m
//  VariousAnimations
//
//  Created by Vols on 2015/11/9.
//  Copyright © 2015年 Vols. All rights reserved.
//

#import "ButtonShowController.h"
#import "FrostedNavigationController.h"

#import "ButtonUIHeader.h"

@interface ButtonShowController ()

@property (nonatomic, strong) VZoomButton       * zoomBtn;
@property (nonatomic, strong) VEffectsButton    * thumbupBtn;
@property (nonatomic, strong) VThumbButton      * zanBtn;


@property (nonatomic, strong) VRippleButton      * rippleBtn;

@end

@implementation ButtonShowController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initData];
    [self displayUIs];
}


- (void)initData {
    
}

- (void)displayUIs {
    self.titleLabel.text = @"按钮动画素材";
    [self addShowMenuButton];
    
    
    AddSubButton * btn = [[AddSubButton alloc] initWithFrame:CGRectMake(100, 80, 39, 39)];
    btn.goodsNum = ^(NSUInteger num){
        NSLog(@"%lu", (unsigned long)num);
    };
    [self.view addSubview:btn];
    
    [self.view addSubview:self.zoomBtn];
    _zoomBtn.clickHandle = ^(){  };
    
    [self setupThumbBtn];
    
    [self.view addSubview:self.rippleBtn];
    _rippleBtn.backgroundColor = [UIColor purpleColor];
}


- (void)setupThumbBtn{

    [self.view addSubview:self.thumbupBtn];
    _thumbupBtn.clickHandle = ^(){
        NSLog(@"%s", __FUNCTION__);
    };
    
    [self.view addSubview:self.zanBtn];
    [_zanBtn setClickHandler:^(VThumbButton *zanButton) {
        if (zanButton.isPraise) {
            NSLog(@"Zan!");
        }else{
            NSLog(@"Cancel zan!");
        }
    }];
}



- (void)setupRippleButton {
    
}


#pragma mark - Actions

-(void)rippleAction:(id)sender {
    NSLog(@"Button Tapped");
}



#pragma mark - Properties

- (VZoomButton *)zoomBtn {
    if (!_zoomBtn) {
        _zoomBtn = [[VZoomButton alloc] initWithFrame:CGRectMake(50, 200, 70, 70) image:@"btnInterest2"];
        _zoomBtn.animationType = VZoomAnimationType1;
    }
    return _zoomBtn;
}

- (VEffectsButton *) thumbupBtn {
    if (!_thumbupBtn) {
        _thumbupBtn = [[VEffectsButton alloc] initWithFrame:CGRectMake(0, 0, 60, 60) image:[UIImage imageNamed:@"like"]];
        _thumbupBtn.center = (CGPoint){self.view.center.x, self.view.center.y + 50};
        //    [_thumbupBtn configureViewWithImage:[UIImage imageNamed:@"like"]];
        _thumbupBtn.imageColorOn = kRGB(253, 128, 35);
        _thumbupBtn.circleColor = kRGB(253, 128, 35);
    }
    return _thumbupBtn;
}

- (VThumbButton *) zanBtn {
    if (!_zanBtn) {
        _zanBtn=[[VThumbButton alloc] initWithFrame:CGRectMake(100, 0, 50, 50) image:[UIImage imageNamed:@"Zan"] unPraiseImage:[UIImage imageNamed:@"UnZan"]];
        [_zanBtn setCenter:self.view.center];
    }
    return _zanBtn;
}

- (VRippleButton *)rippleBtn {
    if (!_rippleBtn) {
        _rippleBtn = [[VRippleButton alloc] initWithImage:[UIImage imageNamed:@"IPhone_5s"] frame:CGRectMake(150, 150, 80, 80) target:@selector(rippleAction:) parent:self];
        [_rippleBtn setRippeEffectEnabled:YES];
        [_rippleBtn setRippleEffectWithColor:[UIColor colorWithRed:240/255.f green:159/255.f blue:10/255.f alpha:1]];
    }
    return _rippleBtn;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
