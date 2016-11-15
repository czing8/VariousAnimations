//
//  CartButton.h
//  CartButton
//
//  Created by Vols on 16/3/2.
//  Copyright © 2016年 HaierSmart. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM( NSUInteger, VZoomAnimationType) {
    VZoomAnimationType1,
    VZoomAnimationType2,
    VZoomAnimationType3
};

typedef void(^ClickerHandleBlock)();

@interface VZoomButton : UIImageView

@property (nonatomic, copy)   ClickerHandleBlock clickHandle;
@property (nonatomic, assign) VZoomAnimationType animationType;

- (id)initWithFrame:(CGRect)frame image:(NSString *)imageStr;

@end
