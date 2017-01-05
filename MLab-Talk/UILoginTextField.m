//
//  UILoginTextField.m
//  MLab-Talk
//
//  Created by apple on 15/12/5.
//  Copyright © 2015年 wangxiaofa. All rights reserved.
//

#import "UILoginTextField.h"

@implementation UILoginTextField
- (CGRect)placeholderRectForBounds:(CGRect)bounds;
{
    CGRect placeholder = [super placeholderRectForBounds:bounds];
    placeholder = CGRectMake(30, 5, 150, 20);
    return placeholder;
}

- (CGRect)editingRectForBounds:(CGRect)bounds;
{
    CGRect editBounds = [super editingRectForBounds:bounds];
    editBounds = CGRectMake(30, 5, bounds.size.width, bounds.size.height-10);
    return editBounds;
}

- (CGRect)textRectForBounds:(CGRect)bounds;
{
    CGRect editBounds = [super editingRectForBounds:bounds];
    editBounds = CGRectMake(30, 5, bounds.size.width, bounds.size.height-10);
    return editBounds;

}

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.borderWidth = 1;
        self.font = [UIFont systemFontOfSize:14.0];
        self.textColor = [UIColor blackColor];
        self.layer.cornerRadius = 15;
    }
    
    return self;
}

@end
