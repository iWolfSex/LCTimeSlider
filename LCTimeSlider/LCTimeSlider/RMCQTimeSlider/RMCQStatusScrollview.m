//
//  RMCQStatusScrollview.m
//  RMCQSliderDemo
//
//  Created by 刘超 on 14-2-26.
//  Copyright (c) 2014年 刘超. All rights reserved.
//

#import "RMCQStatusScrollview.h"

@implementation RMCQStatusScrollview
@synthesize delegate;

@synthesize statusView;
@synthesize time;
@synthesize isZoom;
- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code here.
        self.backgroundColor=[NSColor grayColor];
        self.autoresizingMask=(NSViewWidthSizable | NSViewHeightSizable | NSViewMaxXMargin | NSViewMinYMargin);
		statusView=[[RMCQStatusView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width,(self.contentView.frame.size.height/4)*32)];
		statusView.delgate=self;
		statusView.statusScrollViewheight=self.contentView.frame.size.height;
        self.hasHorizontalScroller=YES;
        self.hasVerticalScroller=YES;
        [self setDocumentView:statusView];
		[[self documentView] scrollPoint:NSMakePoint(self.frame.size.width,(self.contentView.frame.size.height/4)*32)];
		self.isZoom=NO;
    }
    return self;
}
-(void)updateTrackingAreas{
	NSArray *trackings = [self trackingAreas];
    for (NSTrackingArea *tracking in trackings)
    {
        [self removeTrackingArea:tracking];
    }
	
    //添加NSTrackingActiveAlways掩码可以使视图未处于激活或第一响应者时也能响应相应的方法
    NSTrackingArea *trackingArea = [[NSTrackingArea alloc] initWithRect:[self bounds] options:NSTrackingMouseEnteredAndExited|NSTrackingMouseMoved|NSTrackingActiveAlways owner:self userInfo:nil];
    [self addTrackingArea:trackingArea];
}
- (void)drawRect:(NSRect)dirtyRect
{
	[super drawRect:dirtyRect];
	statusView.frame=CGRectMake(0, 0, self.frame.size.width,(self.contentView.frame.size.height/4)*32);
	statusView.statusScrollViewheight=self.contentView.frame.size.height;
    // Drawing code here.
}
-(void)setFrame:(NSRect)frameRect
{
	[super setFrame:frameRect];
	NSLog(@"bbbbbbbb");
	NSArray*timeArray=[self.time componentsSeparatedByString:@" "];
	NSArray*array=[[timeArray objectAtIndex:1] componentsSeparatedByString:@":"];
	int hours=[[array objectAtIndex:0] intValue];
	int minute=[[array objectAtIndex:1] intValue];
	int second=[[array objectAtIndex:2] intValue];
	float totalSeconds=hours*60*60+minute*60+second;
	float sliderTotalSeconds=24*60*60;
	float timeCase=totalSeconds/sliderTotalSeconds;
	NSPoint point;
	point.x=15+(self.frame.size.width-30)*timeCase;
	if (delegate) {
		[delegate selectTimeForPoint:point];
	}
	
}
-(void)scrollPoint:(NSPoint)aPoint{
    
}
- (void)mouseDown:(NSEvent *)theEvent {
    NSPoint p=[self convertPoint:[theEvent locationInWindow] fromView:nil];
	if (delegate) {
		 [delegate clickOrSliderTheStatus];
		 [delegate captureTheStatusPoint:p];
	}
}
-(void)mouseDragged:(NSEvent *)theEvent{

   NSPoint p=[self convertPoint:[theEvent locationInWindow] fromView:nil];
	if (delegate) {
		[delegate clickOrSliderTheStatus];
		[delegate captureTheStatusPoint:p];
	}
}
- (void)touchesBeganWithEvent:(NSEvent *)event{
	NSPoint p=[self convertPoint:[event locationInWindow] fromView:nil];
	if (delegate) {
		[delegate clickOrSliderTheStatus];
		[delegate captureTheStatusPoint:p];
	}
    
}
- (void)scrollWheel:(NSEvent *)theEvent
{
    [[self nextResponder] scrollWheel:theEvent];
	
}
-(void)statusForDataDic:(NSMutableDictionary*)dataDic{
	[statusView drawStatusForDataDic:dataDic];
}
-(void)clearChannelStatusData{
	[statusView clearDrawChannelStatusData];
}
-(void)statusDrawCompleted:(int)channel{
	[delegate statusDrawCompleteds:channel];
}
@end
