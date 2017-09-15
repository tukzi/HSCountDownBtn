//
//  UIView+Custom.h
//  HSCountDownBtn
//
//  Created by song.he on 2017/9/15.
//  Copyright © 2017年 webank. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Custom)

@property (readonly) CGPoint bottomLeft;
@property (readonly) CGPoint bottomRight;
@property (readonly) CGPoint topRight;

@property CGFloat height;
@property CGFloat width;

@property CGFloat top;
@property CGFloat left;

@property CGFloat bottom;
@property CGFloat right;

@end
