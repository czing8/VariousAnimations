//
//  ViewController.m
//  demo
//
//  Created by Vols on 16/4/28.
//  Copyright © 2016年 Vols. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSLog(@"%d", solution(@"09:42", @"11:42"));
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

int solutions(NSMutableArray *A) {
    
    int fee = 0;
    NSMutableArray * tmpArray = [[NSMutableArray alloc] init];
    
    if (A.count >= 23) { // 23 = 3 * 7 + 1*2;
        fee = 25;
    }else if(A.count <= 3){
        fee = 6;
    }else{
    
        for (int i = 0; i < A.count-1; i ++) {
            [tmpArray addObject:@((int)A[i+1] - (int)A[i])];
        }
        
        for (int i = 0; i < A.count-1; i ++) {
            
            for (int j = i+1; j < A.count; j ++) {
                
                if ([A[i] intValue] + 6 >= [A[j] intValue]) {
                    
                    if (j - i >= 4) {
                        fee += 7;
                    }
                }
                

            }
            
        }
        
    }
    
    
    
    return fee;
}




int solution(NSString *E, NSString *L) {

    int fee = 2;
    int interval = 0;
    
    NSArray * startTimes = [E componentsSeparatedByString:@":"];
    NSArray * endTimes = [L componentsSeparatedByString:@":"];

    int startHour = [startTimes[0] intValue];
    int startMin = [startTimes[1] intValue];
    
    int endHour = [endTimes[0] intValue];
    int endMin = [endTimes[1] intValue];
    
    if (startHour <= endHour) {
        
        interval = endHour - startHour;
        
        if (startMin < endMin) {
            interval++;
        }
    }
    
    if (interval <= 1) {
        
        fee += 3;
    } else{
        
        fee = fee + 4 * interval - 1;
    }
    
    return fee;
}

@end
