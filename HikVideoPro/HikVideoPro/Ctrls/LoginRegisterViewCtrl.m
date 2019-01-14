//
//  LoginRegisterViewCtrl.m
//  HikVideoPro
//
//  Created by JSG on 2019/1/14.
//  Copyright © 2019 JSG. All rights reserved.
//

#import "LoginRegisterViewCtrl.h"
#import "MainViewController.h"
@interface LoginRegisterViewCtrl ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomLineLeft;
@property (weak, nonatomic) IBOutlet UITextField *loginAccount;
@property (weak, nonatomic) IBOutlet UITextField *loginPwd;
@property (weak, nonatomic) IBOutlet UITextField *registerAccount;
@property (weak, nonatomic) IBOutlet UITextField *registerPwd;
@property (weak, nonatomic) IBOutlet UITextField *registerAccountAgain;
@property (weak, nonatomic) IBOutlet UITextField *registerPwdAgain;
@property (weak, nonatomic) IBOutlet UIView *registerBackView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *backViewHeight;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UIButton *registerBtn;

@end

@implementation LoginRegisterViewCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *leftView1 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 10, 40)];
    self.loginAccount.leftViewMode = UITextFieldViewModeAlways;
    self.loginAccount.leftView = leftView1;
    
    UIView *leftView2 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 10, 40)];
    self.loginPwd.leftViewMode = UITextFieldViewModeAlways;
    self.loginPwd.leftView = leftView2;
    
    UIView *leftView3 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 10, 40)];
    self.registerAccount.leftViewMode = UITextFieldViewModeAlways;
    self.registerAccount.leftView = leftView3;
    
    UIView *leftView4 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 10, 40)];
    self.registerPwd.leftViewMode = UITextFieldViewModeAlways;
    self.registerPwd.leftView = leftView4;
    
    UIView *leftView5 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 10, 40)];
    self.registerAccountAgain.leftViewMode = UITextFieldViewModeAlways;
    self.registerAccountAgain.leftView = leftView5;
    
    UIView *leftView6 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 10, 40)];
    self.registerPwdAgain.leftViewMode = UITextFieldViewModeAlways;
    self.registerPwdAgain.leftView = leftView6;
    
}

- (IBAction)switchStatusAction:(UIButton *)sender {
    
    [self.loginBtn setTitleColor:[UIColor colorWithHex:0x333333] forState:UIControlStateNormal];
    [self.registerBtn setTitleColor:[UIColor colorWithHex:0x333333] forState:UIControlStateNormal];
    [sender setTitleColor:kMainColor forState:UIControlStateNormal];
    
    [UIView animateWithDuration:0.15 animations:^{
        self.bottomLineLeft.constant = sender.origin.x;
        
        if (sender == self.loginBtn) {
            self.backViewHeight.constant = 330;
            self.registerBackView.hidden = YES;
        }else {
            self.backViewHeight.constant = 450;
            self.registerBackView.hidden = NO;
        }
    }];
    
    
    
}

- (IBAction)loginAction:(id)sender {
    
    UIStoryboard *SB = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    MainViewController *mainVC = [SB instantiateViewControllerWithIdentifier:@"MainViewController"];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:mainVC];
    [UIApplication sharedApplication].keyWindow.rootViewController = nav;
    
}

- (IBAction)registerAction:(id)sender {
}
@end
