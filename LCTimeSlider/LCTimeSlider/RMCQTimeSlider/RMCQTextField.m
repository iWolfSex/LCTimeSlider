//
//  RMCQTextField.m
//  RMCQSliderDemo
//
//  Created by 刘超 on 14-3-3.
//  Copyright (c) 2014年 刘超. All rights reserved.
//

#import "RMCQTextField.h"

@implementation RMCQTextField

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code here.
        [self setEditable:NO];
        [self setAlphaValue:0.3];
    }
    return self;
}

- (void)drawRect:(NSRect)dirtyRect
{
	[super drawRect:dirtyRect];
	NSRect bounds=[self bounds];
    [[NSColor clearColor] set];
    [NSBezierPath fillRect:bounds];
    
    // Drawing code here.
}
@end
