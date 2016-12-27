//
//  OKTextFieldView.m
//
//  Created by OLEG KALININ on 18.11.16.
//

#import "OKTextFieldView.h"
#import <QuartzCore/QuartzCore.h>


@interface OKTextFieldView ()

{
    
    UIButton *buttonRight;
    UIImageView *iconLeft;
}

@end

@implementation OKTextFieldView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self configure];
    }
    
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self configure];
    }
    return self;
}


- (void)configure {
    self.text = nil;
    self.backgroundColor = [UIColor clearColor];
    
    CGRect rightRect = CGRectMake(self.bounds.size.width - self.bounds.size.height, 0, self.bounds.size.height, self.bounds.size.height);
    
    buttonRight = [[UIButton alloc] initWithFrame:rightRect];
    [buttonRight addTarget:self action:@selector(buttonRight:) forControlEvents:UIControlEventTouchUpInside];
    self.rightView = buttonRight;
    self.rightViewMode = UITextFieldViewModeNever;
    
    CGRect leftRect = CGRectMake(0, 0, self.bounds.size.height, self.bounds.size.height);
    UIView *leftView = [[UIView alloc] initWithFrame:leftRect];
    
    iconLeft = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, leftRect.size.width - 10, leftRect.size.height)];
    iconLeft.clipsToBounds = YES;
    iconLeft.contentMode = UIViewContentModeCenter;
    
    [leftView addSubview:iconLeft];
    self.leftView = leftView;
    self.leftViewMode = UITextFieldViewModeAlways;

    [self addTarget:self action:@selector(textFieldDidChangeEditing:) forControlEvents:UIControlEventEditingDidBegin | UIControlEventEditingDidEnd];
}

- (void)textFieldDidChangeEditing:(id)sender {
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGColorRef colorRef = self.editing? self.tintColor.CGColor : self.placeholderColor.CGColor;
    
    CGContextSetStrokeColorWithColor(context, colorRef);
    CGContextSetLineWidth(context, self.editing? 1:0.5f);
    CGContextSetAlpha(context, self.editing? 1:0.5f);
    
    // start a new Path
    CGContextBeginPath(context);
    
    CGContextMoveToPoint(context, self.bounds.origin.x, self.bounds.size.height);
    CGContextAddLineToPoint(context, self.bounds.size.width, self.bounds.size.height);
    CGContextClosePath(context);
    CGContextStrokePath(context);
    
    if (self.placeholder.length && self.placeholderColor) {
        self.attributedPlaceholder = [[NSAttributedString alloc] initWithString:self.placeholder
                                                                     attributes:@{NSForegroundColorAttributeName:self.placeholderColor}];
    }
    
    [buttonRight setImage:self.rightImage? :[self.rightImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    buttonRight.enabled = self.rightImage != nil;
    self.rightViewMode = self.rightImage? UITextFieldViewModeAlways : UITextFieldViewModeNever;

    iconLeft.image = self.leftImage;
    iconLeft.alpha = self.editing? 0.6f:0.2f;
    //self.leftView = iconLeft;
}



- (void)setRightImage:(UIImage *)rightImage {
    _rightImage = rightImage;
    [self setNeedsDisplay];
}

- (void)setLeftImage:(UIImage *)leftImage {
    _leftImage = leftImage;
    [self setNeedsDisplay];
}

- (void)setPlaceholderColor:(UIColor *)placeholderColor {
    _placeholderColor = placeholderColor;
    [self setNeedsDisplay];
}

- (BOOL)isFulfilled {
    return self.text.length > 0;
}

- (IBAction)buttonRight:(id)sender {
    [self buttonRight];
}

- (void)buttonRight {
    NSLog(@"press button");
}



@end


