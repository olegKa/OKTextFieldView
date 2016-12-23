//
//  OKTextFieldView.h
//  Lottery
//
//  Created by OLEG KALININ on 18.11.16.
//  Copyright © 2016 Moleculus. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface OKTextFieldView : UITextField

@property (nonatomic, copy) IBInspectable UIImage *rightImage;
@property (nonatomic, copy) IBInspectable UIImage *leftImage;
@property (nonatomic, copy) IBInspectable UIColor *placeholderColor;

@property (nonatomic, readonly) BOOL isFulfilled;

- (void)configure;
- (void)buttonRight;

@end

