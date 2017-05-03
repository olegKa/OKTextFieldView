//
//  OKPhoneTextFieldView.m
//  Pods
//
//  Created by OLEG KALININ on 03.05.17.
//
//

#import "OKPhoneTextFieldView.h"

@implementation OKPhoneTextFieldView

- (void)configure
{
    [super configure];
    self.secureTextEntry = NO;
    self.keyboardType = UIKeyboardTypePhonePad;
    self.spellCheckingType = UITextSpellCheckingTypeNo;
    self.leftImage = nil;
    self.rightImage = nil;
    
}

- (void)setMask:(NSString *)mask
{
    _mask = mask;
    self.numericFormatter = [AKNumericFormatter formatterWithMask:mask placeholderCharacter:'#'];
}

- (BOOL)isFulfilled
{
    return [self.numericFormatter isFormatFulfilled:self.text];
}

- (NSString *)unfixedDigits
{
    return [self.numericFormatter unfixedDigits:self.text];
}


@end
