//
//  AddSubButton.h
//  AddSubButton
//
//  Created by Vols on 16/3/2.
//  Copyright © 2016年 HaierSmart. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^GoodsNumBlock)(NSUInteger num);


@interface AddSubButton : UIView


@property (nonatomic, copy) GoodsNumBlock goodsNum;


@end
