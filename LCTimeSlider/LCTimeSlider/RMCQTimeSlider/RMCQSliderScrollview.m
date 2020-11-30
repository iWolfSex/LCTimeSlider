//
//  RMCQSliderScrollview.m
//  RMCQSliderDemo
//
//  Created by 刘超 on 14-2-26.
//  Copyright (c) 2014年 刘超. All rights reserved.
//

#import "RMCQSliderScrollview.h"
#import "RMCQSliderView.h"
@implementation RMCQSliderScrollview
@synthesize sliderview;
@synthesize delegate;
- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor=[NSColor grayColor];
        self.autoresizingMask=(NSViewWidthSizable | NSViewHeightSizable | NSViewMaxXMargin | NSViewMinYMargin);
        sliderview=[[RMCQSliderView alloc]initWithFrame:self.bounds];
        [self setDocumentView:sliderview];
        
        [self setBorderType:NSBezelBorder];
        self.autohidesScrollers=YES;
        self.hasHorizontalScroller=NO;
        self.hasVerticalScroller=NO;
        [self setScrollsDynamically:NO];
        
       
        // Initialization code here.
    }
    return self;
}
- (void)drawRect:(NSRect)dirtyRect
{
	[super drawRect:dirtyRect];
    [sliderview setFrame:self.bounds];
   
	
    // Drawing code here.
}
- (void)scrollWheel:(NSEvent *)theEvent
{
    [[self nextResponder] scrollWheel:theEvent];
}

- (void)mouseDown:(NSEvent *)theEvent {
    NSPoint p=[self convertPoint:[theEvent locationInWindow] fromView:nil];
	if (delegate) {
		[delegate clickOrSliderTheSlider];
		[delegate captureTheSlidingPoint:p];
	}
    
    
}
-(void)mouseDragged:(NSEvent *)theEvent{
    NSPoint p=[self convertPoint:[theEvent locationInWindow] fromView:nil];
	if (delegate) {
		[delegate clickOrSliderTheSlider];
		[delegate captureTheSlidingPoint:p];
	}
    
}

@end
