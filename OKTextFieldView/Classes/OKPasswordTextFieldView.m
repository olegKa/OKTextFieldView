//
//  OKPasswordTextFieldView.m
//  Lottery
//
//  Created by OLEG KALININ on 18.11.16.
//  Copyright © 2016 Moleculus. All rights reserved.
//

#import "OKPasswordTextFieldView.h"

@implementation OKPasswordTextFieldView

- (void)configure {
    [super configure];
    self.secureTextEntry = YES;
    self.keyboardType = UIKeyboardTypeASCIICapable;
    self.spellCheckingType = UITextSpellCheckingTypeNo;
    self.leftImage  = [UIImage imageNamed:@"icon_lock"];
    self.rightImage = [UIImage imageNamed:@"icon_pass_hidden"];
    
}

- (void)setHidden:(BOOL)hidden {
    self.secureTextEntry = hidden;
    self.rightImage = [UIImage imageNamed:hidden? @"icon_pass_hidden":@"icon_pass_open"] ;
}

- (BOOL)hidden {
    return self.secureTextEntry;
}

- (BOOL)isFulfilled {
    return self.text.length >= self.minLength;
}

- (void)buttonRight {
    self.hidden = !self.hidden;
    NSString *text = self.text;
    self.secureTextEntry = self.hidden;
    self.text = text;
}



@end
