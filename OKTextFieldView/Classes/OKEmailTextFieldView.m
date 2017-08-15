//
//  OKEmailTextFieldView.m
//  Pods
//
//  Created by OLEG KALININ on 18.11.16.
//  Copyright © 2016 Moleculus. All rights reserved.
//

#import "OKEmailTextFieldView.h"

@implementation OKEmailTextFieldView

- (void)configure {
    [super configure];
    self.secureTextEntry = NO;
    self.keyboardType = UIKeyboardTypeEmailAddress;
    self.spellCheckingType = UITextSpellCheckingTypeNo;
    self.leftImage = [UIImage imageNamed:@"icon_mail"];
    self.rightImage = nil;
}

- (BOOL)isEmail{
    NSString *emailRegex = @"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}$";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    BOOL isValid = [emailTest evaluateWithObject:self.text];
    return isValid;
}

- (BOOL)isFulfilled {
    return [self isEmail];
}

@end
