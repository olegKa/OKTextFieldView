//
//  OKPhoneTextFieldView.h
//  Pods
//
//  Created by OLEG KALININ on 03.05.17.
//
//

#import "OKTextFieldView.h"
#import <AKNumericFormatter/AKNumericFormatter.h>
#import <AKNumericFormatter/UITextField+AKNumericFormatter.h>

@interface OKPhoneTextFieldView : OKTextFieldView


/**
 phone number mask like +7(###)###-##-##
 */
@property (nonatomic, strong) IBInspectable NSString *mask;

@property (nonatomic, readonly) NSString *unfixedDigits;

@end
