//
//  ViewController.m
//  VariousAnimations
//
//  Created by Vols on 16/3/2.
//  Copyright © 2016年 HaierSmart. All rights reserved.
//

#import "ViewController.h"
#import "AddSubButton.h"
#import "CartButton.h"

#import "VThumbButton.h"

@interface ViewController ()

@property (nonatomic, strong) CartButton * cartBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    AddSubButton * btn = [[AddSubButton alloc] initWithFrame:CGRectMake(100, 30, 39, 39)];
    btn.goodsNum = ^(NSUInteger num){
        NSLog(@"%lu", (unsigned long)num);
    };
    [self.view addSubview:btn];


    
    _cartBtn = [[CartButton alloc] initWithFrame:CGRectMake(50, 100, 70, 70) image:@"btnInterest2"];
    _cartBtn.cartButtonHandle = ^(){
        NSLog(@"fdfse");
    };
    
    [self.view addSubview:_cartBtn];
    
    
    VThumbButton *zanBtn=[[VThumbButton alloc] initWithFrame:CGRectMake(100, 0, 50, 50) image:[UIImage imageNamed:@"Zan"] unPraiseImage:[UIImage imageNamed:@"UnZan"]];
    [zanBtn setCenter:self.view.center];
    [self.view addSubview:zanBtn];
    
    [zanBtn setClickHandler:^(VThumbButton *zanButton) {
        if (zanButton.isPraise) {
            NSLog(@"Zan!");
        }else{
            NSLog(@"Cancel zan!");
        }
    }];


}


- (IBAction)cartClick:(id)sender {
    [_cartBtn doPopAnimation];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
