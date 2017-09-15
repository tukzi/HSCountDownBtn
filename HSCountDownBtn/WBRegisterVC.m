//
//  WBRegisterVC.m
//  HSCountDownBtn
//
//  Created by song.he on 2017/9/15.
//  Copyright © 2017年 webank. All rights reserved.
//

#import "WBRegisterVC.h"
#import "UIView+Custom.h"
#import "HSCountDownBtn.h"
#import "UIImage+Custom.h"

@interface WBRegisterVC ()

@property (nonatomic, strong) HSCountDownBtn *countDownButton;

@end

@implementation WBRegisterVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"注册";
    self.view.backgroundColor = UIColorFromRGB(0xf3f3f3);
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 55;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 200;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 200)];
    return view;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    
    UILabel *la = [[UILabel alloc]initWithFrame:CGRectMake(15, 55/2-15/2, 80, 15)];
    la.text = @"手机号码";
    la.font = [UIFont systemFontOfSize:15];
    la.textColor = UIColorFromRGB(0x333333);
    [cell.contentView addSubview:la];
    
    UITextField *regTF = [[UITextField alloc]initWithFrame:CGRectMake(la.right+8, 0, SCREEN_WIDTH-30-80-100-16, 55)];
    regTF.returnKeyType = UIReturnKeyDone;
    regTF.keyboardType = UIKeyboardTypePhonePad;
    regTF.textColor = UIColorFromRGB(0x333333);
    regTF.placeholder = @"请输入手机号码";
    [cell.contentView addSubview:regTF];
    
    
    //倒计时btn的用法
    __weak __typeof__(self) weakSelf = self;
    
    self.countDownButton = [[HSCountDownBtn alloc] initWithFrame:CGRectMake(regTF.right+8, 55/2-30/2, 100, 30) duration:10 buttonClicked:^{
        // 请求数据
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            int a = arc4random() % 2;   //模拟请求 50%
//            if (a == 0) {
                // 获取成功
                NSLog(@"请求验证码成功");
                [weakSelf.countDownButton startCountDown];
//            } else {
//      
//                NSLog(@"请求验证码失败");
//                weakSelf.countDownButton.enabled = YES;
//            }
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
    
    //设置常用属性
    [self.countDownButton setTitle:@"获取验证码" forState:UIControlStateNormal];
    [self.countDownButton setBackgroundImage:[UIImage imageWithColor:UIColorFromRGB(0x4572cf)] forState:UIControlStateNormal];
    [self.countDownButton setBackgroundImage:[UIImage imageWithColor:UIColorFromRGB(0x89a3df)] forState:UIControlStateDisabled];
    [self.countDownButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.countDownButton setTitleColor:[UIColor whiteColor] forState:UIControlStateDisabled];
    self.countDownButton.titleLabel.font = [UIFont systemFontOfSize:13];
    self.countDownButton.layer.cornerRadius = 3;
    self.countDownButton.layer.masksToBounds = YES;
    

    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

@end
