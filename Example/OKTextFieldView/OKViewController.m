//
//  OKViewController.m
//  OKTextFieldView
//
//  Created by olegKa on 12/10/2016.
//  Copyright (c) 2016 olegKa. All rights reserved.
//

#import "OKViewController.h"

#import "OKTextField.h"
#import <OKActiveButton/OKActiveButton.h>

#define default_bottom_size 205

@interface OKViewController () <UITextFieldDelegate>
{
    
    __weak IBOutlet OKActiveButton          *buttonSignIn;
    __weak IBOutlet OKEmailTextFieldView    *emailField;
    __weak IBOutlet OKPasswordTextFieldView *passwordField;
    __weak IBOutlet UIButton                *buttonForgetPassword;
}


@property (nonatomic, weak) IBOutlet NSLayoutConstraint *bottomSize;

@end

@implementation OKViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShowNotification:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHideNotification:) name:UIKeyboardWillHideNotification object:nil];
    
    passwordField.minLength = 4;
    buttonSignIn.shadowHidden = NO;
    buttonSignIn.enabled = self.isFulfilled;
    
    [emailField becomeFirstResponder];
}

#pragma mark - Notifications
- (void)keyboardWillShowNotification:(NSNotification *)notification {
    NSDictionary *info = notification.userInfo;
    self.bottomSize.constant = MAX([info[UIKeyboardFrameEndUserInfoKey] CGRectValue].size.height, self.view.bounds.size.height / 2.5);
    
    [UIView performWithoutAnimation:^{
        [self.view layoutIfNeeded];
    }];
   
}

- (void)keyboardWillHideNotification:(NSNotification *)notification {
    self.bottomSize.constant = default_bottom_size;
    [UIView performWithoutAnimation:^{
        [self.view layoutIfNeeded];
    }];
}

#pragma mark - Properties
- (BOOL)isFulfilled {
    return emailField.isFulfilled && passwordField.isFulfilled;
}

#pragma mark - Private
- (void)signIn {
    if (self.isFulfilled) {
        
        buttonSignIn.isActivity = YES;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            buttonSignIn.isActivity = NO;
            NSLog(@"login with email:<%@> and password:<%@>", emailField.text, passwordField.text);
        });
    }
}

#pragma mark - User Interactions
- (IBAction)buttonForgetPassword:(id)sender {
    
}

- (IBAction)buttonSignIn:(id)sender {
    [self signIn];
}

#pragma mark - UITextFieldDelegate
- (IBAction)textFieldDidChanged:(id)sender {
    buttonSignIn.enabled = self.isFulfilled;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == emailField) {
        [passwordField becomeFirstResponder];
    } else {
        if (textField == passwordField) {
            [textField resignFirstResponder];
            [self signIn];
        }
    }
    
    return YES;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
