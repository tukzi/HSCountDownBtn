HSCountDownBtn
==============

HSCountDownBtn

继承UIButton实现iOS倒计时按钮

常常用于注册等发送验证码的时候进行倒计时操作

HSCountDownBtn, subclassing UIButton implementation iOS countdown button, register with sending the verification code and countdown

演示项目
==============
查看并运行 `HSCountDownBtn.xcodeproj`

![效果图](https://github.com/tukzi/HSCountDownBtn/blob/master/demo.gif)


如何使用
==============
//倒计时btn的用法
    __weak __typeof__(self) weakSelf = self;
    
    self.countDownButton = [[HSCountDownBtn alloc] initWithFrame:CGRectMake(regTF.right+8, 55/2-30/2, 100, 30) duration:10 buttonClicked:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
           int a = arc4random() % 2;   //模拟请求 50%
            if (a == 0) {
                // 获取成功
                NSLog(@"请求验证码成功");
                [weakSelf.countDownButton startCountDown];
            } else {
      
               NSLog(@"请求验证码失败");
                weakSelf.countDownButton.enabled = YES;
           }
        });
    } countDownStart:^{
        //------- 倒计时开始 -------//
        NSLog(@"倒计时开始");
    } countDownUnderway:^(NSInteger restCountDownNum) {
        //------- 倒计时进行中 -------//
        [weakSelf.countDownButton setTitle:[NSString stringWithFormat:@"%ld秒", restCountDownNum] forState:UIControlStateNormal];
    } countDownCompletion:^{
        //------- 倒计时结束 -------//
        [weakSelf.countDownButton setTitle:@"点击获取验证码" forState:UIControlStateNormal];
        NSLog(@"倒计时结束");
    }];
    
    [cell.contentView addSubview:self.countDownButton];



 
==============-->



