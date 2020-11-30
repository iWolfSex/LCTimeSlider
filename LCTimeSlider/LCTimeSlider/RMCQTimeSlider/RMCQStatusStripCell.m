//
//  RMCQStatusStripCell.m
//  ViewClient
//
//  Created by 刘超 on 14-3-5.
//
//

#import "RMCQStatusStripCell.h"

@implementation RMCQStatusStripCell

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code here.
    }
    return self;
}

- (void)drawRect:(NSRect)dirtyRect
{
	[super drawRect:dirtyRect];
	NSRect bounds=[self bounds];
    [[NSColor whiteColor] set];
	[NSBezierPath fillRect:bounds];
	
    // Drawing code here.
}

@end
