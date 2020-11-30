//
//  RMCQSliderButtonView.m
//  RMCQSliderDemo
//
//  Created by 刘超 on 14-3-27.
//  Copyright (c) 2014年 刘超. All rights reserved.
//

#import "RMCQSliderButtonView.h"
#import <math.h>
@implementation RMCQSliderButtonView
@synthesize delegate;
- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setAlphaValue:0.5];
        // Initialization code here.
      
    }
    return self;
}

- (void)drawRect:(NSRect)dirtyRect
{
	[super drawRect:dirtyRect];
    NSRect bounds=[self bounds];
    [[NSColor clearColor] set];
    
    [NSBezierPath fillRect:bounds];
    CGContextRef context=[[NSGraphicsContext currentContext]graphicsPort];//获取画布
    CGContextSetStrokeColorWithColor(context, [NSColor blueColor].CGColor);//线条颜色
    CGContextSetShouldAntialias(context,NO);//设置线条平滑，不需要两边像素宽
	CGContextSetLineWidth(context, 1.0);
    CGPoint spoints[3];
    spoints[0]=CGPointMake(self.frame.size.width/2, self.frame.size.height*7/9+(self.frame.size.height*2/9)*2/10-15);
    spoints[1]=CGPointMake(self.frame.size.width/2-5, self.frame.size.height*7/9+(self.frame.size.height*2/9)*2/10+5-15);
    spoints[2]=CGPointMake(self.frame.size.width/2+5, self.frame.size.height*7/9+(self.frame.size.height*2/9)*2/10+5-15);
    CGContextAddLines(context, spoints, 3);
    CGContextClosePath(context);
    CGContextDrawPath(context, kCGPathStroke);
    CGContextMoveToPoint(context,self.frame.size.width/2,0); //线条起始点
    CGContextAddLineToPoint(context,self.frame.size.width/2,self.frame.size.height*7/9+(self.frame.size.height*2/9)*2/10-15);//线条结束点
    CGContextStrokePath(context);//结束，也就是开始画
    // Drawing code here.
}
- (void)mouseDown:(NSEvent *)theEvent {
    NSPoint p=[self.superview convertPoint:[theEvent locationInWindow] fromView:nil];
	
	[delegate captureTheSliderButtonSuperPoint:p];
    NSLog(@"a%f",p.x);
	
}
-(void)mouseDragged:(NSEvent *)theEvent{
	
	NSPoint p=[self.superview convertPoint:[theEvent locationInWindow] fromView:nil];
	//    [delegate captureTheStatusPoint:p];
	[delegate captureTheSliderButtonSuperPoint:p];
	NSLog(@"b%f",p.x);
	
}
@end
