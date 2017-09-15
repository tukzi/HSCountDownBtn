//
//  HSCountDownBtn.h
//  HSCountDownBtn
//
//  Created by song.he on 2017/9/15.
//  Copyright © 2017年 webank. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HSCountDownBtn : UIButton

/**
 @param frame frame
 @param duration 倒计时时间
 @param buttonClicked 按钮点击事件的回调
 @param countDownStart 倒计时开始时的回调
 @param countDownUnderway 倒计时进行中的回调（每秒一次）
 @param countDownCompletion 倒计时完成时的回调
 @return 倒计时button
 */

- (instancetype)initWithFrame:(CGRect)frame
                     duration:(NSInteger)duration
                buttonClicked:(void(^)())buttonClicked
               countDownStart:(void(^)())countDownStart
            countDownUnderway:(void(^)(NSInteger restCountDownNum))countDownUnderway
          countDownCompletion:(void(^)())countDownCompletion;


/** 开始倒计时 */
- (void)startCountDown;

@end
