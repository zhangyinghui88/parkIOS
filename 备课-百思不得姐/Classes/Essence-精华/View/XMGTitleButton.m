//
//  XMGTitleButton.m
//  3期-百思不得姐
//
//  Created by xiaomage on 15/9/13.
//  Copyright (c) 2015年 xiaomage. All rights reserved.
//

#import "XMGTitleButton.h"

@implementation XMGTitleButton

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        self.titleLabel.font = [UIFont systemFontOfSize:14];
    }
    return self;
}

- (void)setHighlighted:(BOOL)highlighted { }

@end
