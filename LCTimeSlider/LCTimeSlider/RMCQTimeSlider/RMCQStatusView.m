//
//  RMCQStatusView.m
//  RMCQSliderDemo
//
//  Created by 刘超 on 14-2-26.
//  Copyright (c) 2014年 刘超. All rights reserved.
//

#import "RMCQStatusView.h"
#import "RMCQStatusStripCell.h"
#import "RMCQStatusData.h"
#import "RMCQStatusData.h"
@implementation RMCQStatusView
@synthesize statusScrollViewheight;
@synthesize cellheigh;
@synthesize labelFontWidth;
@synthesize laelFontHeight;
@synthesize labelColor;
@synthesize myContext;
@synthesize delgate;
- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code here.
		self.labelFontWidth=[NSFont systemFontOfSize:10.0f];
        self.laelFontHeight=[NSFont systemFontOfSize:15.0f];
        self.labelColor= [NSColor whiteColor];
    }
    return self;
}
-(id)initWithFrame:(NSRect)frame statusForDataDic:(NSMutableDictionary *)dataDic{
	self = [super initWithFrame:frame];
    if (self) {
        // Initialization code here.
		self.labelFontWidth=[NSFont systemFontOfSize:10.0f];
        self.laelFontHeight=[NSFont systemFontOfSize:15.0f];
        self.labelColor= [NSColor whiteColor];
		self.channesDataDic=dataDic;
    }
    return self;
}
- (void)drawRect:(NSRect)dirtyRect
{
	[super drawRect:dirtyRect];
	cellheigh=statusScrollViewheight/4;
	if (myContext) {
		CGContextSetTextMatrix(myContext, CGAffineTransformIdentity);
		
	}
	myContext = [[NSGraphicsContext  currentContext] graphicsPort]; //1
	if ([[self.channesDataDic allKeys] count]>0) {
		for (int i=0; i<=32; i++) {
			
			CGRect rect=CGRectMake(15, cellheigh*(31-i), self.frame.size.width-30, cellheigh-2);
			
			CGContextSetRGBFillColor (myContext, 0.2, 0.2, 0.2, 1);
			CGContextFillRect (myContext,rect);
			NSString*title;
			if (i<9) {
				title=[NSString stringWithFormat:@"0%d",i+1];
			}else{
				title=[NSString stringWithFormat:@"%d",i+1];
			}
			NSPoint point;
			point.x=0;
			point.y=cellheigh*(31-i);
			[self drawSliderLablesStartpoint:point LableWidth:15 LableTitle:title];
			CGContextClearRect(myContext,rect);
			
		}
		NSMutableArray*numberKeyArray=[[NSMutableArray alloc]init];
		for (int i=0; i<[[self.channesDataDic allKeys] count]; i++) {
			NSString*key=[[self.channesDataDic allKeys] objectAtIndex:i];
			NSArray*KeyArray=[key componentsSeparatedByString:@"通"];
			NSLog(@"=============%@",[KeyArray objectAtIndex:0]);
			int numberKey=[[KeyArray objectAtIndex:0] intValue];
			[numberKeyArray addObject:[NSNumber numberWithInt:numberKey]];
			
		}
		int max=[[numberKeyArray valueForKeyPath:@"@max.intValue"] intValue];
		NSLog(@"%d",max);
		for (int i=0; i<max+1; i++) {
			NSString*key=[NSString stringWithFormat:@"%d通道",i];
			NSMutableArray*array=[self.channesDataDic objectForKey:key];
			[self drawChannelStatusForData:array addChannel:i];
			NSString*title;
			if (i<9) {
				title=[NSString stringWithFormat:@"0%d",i+1];
			}else{
				title=[NSString stringWithFormat:@"%d",i+1];
			}
			NSPoint point;
			point.x=0;
			point.y=cellheigh*(31-i);
			[self drawSliderLablesStartpoint:point LableWidth:15 LableTitle:title];
		}
		if (delgate) {
			[delgate statusDrawCompleted:max];
		}
	}else{
		for (int i=0; i<=31; i++) {
			CGRect rect=CGRectMake(15, cellheigh*(31-i), self.frame.size.width-30, cellheigh-2);
			CGContextSetRGBFillColor (myContext, 0.2, 0.2, 0.2, 1);
			CGContextFillRect (myContext,rect);
			NSString*title;
			if (i<9) {
				title=[NSString stringWithFormat:@"0%d",i+1];
			}else{
				title=[NSString stringWithFormat:@"%d",i+1];
			}
			NSPoint point;
			point.x=0;
			point.y=cellheigh*(31-i);
			[self drawSliderLablesStartpoint:point LableWidth:15 LableTitle:title];
			CGContextClearRect(myContext,rect);
		}
	}
}
-(void)clearDrawChannelStatusData{
	self.channesDataDic=nil;
	[self setNeedsDisplay:YES];
	
}
-(void)drawStatusForDataDic:(NSMutableDictionary *)dataDic{
	self.channesDataDic=dataDic;
	[self setNeedsDisplay:YES];
}
-(void)drawChannelStatusForData:(NSMutableArray*)array  addChannel:(NSInteger)channel{
	float statusLength=self.frame.size.width-30;
	NSInteger statusTotalSeconds=24*60*60;
	for (int i=0; i<[array count]; i++) {
		RMCQStatusData*data=[array objectAtIndex:i];
		NSString*starTime=data.startTime;
		NSArray*starTimeArray=[starTime componentsSeparatedByString:@":"];
		NSInteger starTimeHour=[[starTimeArray objectAtIndex:0]integerValue];
		NSInteger starTimeMinute=[[starTimeArray objectAtIndex:1]integerValue];
		float starTimeSecond=[[starTimeArray objectAtIndex:2]integerValue];
		float starTotalSeconds=starTimeHour*60*60+starTimeMinute*60+starTimeSecond;
		float starRatio=starTotalSeconds/statusTotalSeconds;
		float starTimeX=15+statusLength*starRatio;
		NSPoint pointS;
		pointS.x=starTimeX;
		NSString*endTime=data.endTime;
		NSArray*endTimeArray=[endTime componentsSeparatedByString:@":"];
		NSInteger endTimeHour=[[endTimeArray objectAtIndex:0]integerValue];
		NSInteger endTimeMinute=[[endTimeArray objectAtIndex:1]integerValue];
		NSInteger endTimeSecond=[[endTimeArray objectAtIndex:2]integerValue];
		float endTotalSeconds=endTimeHour*60*60+endTimeMinute*60+endTimeSecond;
		float endRatio=(endTotalSeconds/statusTotalSeconds);
		float statusL=statusLength*endRatio;
		float endTimeX=15+statusL;
		NSPoint pointE;
		pointE.x=endTimeX;
		NSRect rect;
		rect=CGRectMake(starTimeX,cellheigh*(31-channel), endTimeX-starTimeX, cellheigh-2);
		CGContextSetRGBFillColor (myContext, 85/255.0, 184/255.0, 145./255.0 , 1.0);
		CGContextFillRect (myContext,rect);
	}
	
}
-(void)drawSliderLablesStartpoint:(NSPoint)point LableWidth:(float)scaleWidth LableTitle:(NSString*)title{
    
    NSDictionary*attributes=@{NSFontAttributeName:self.labelFontWidth,NSForegroundColorAttributeName:self.labelColor};
    CGRect labelLocation=CGRectMake(point.x, point.y, [self widthOfString:title withFont:self.labelFontWidth], [self widthOfString:title withFont:self.laelFontHeight]);
    [title drawInRect:labelLocation withAttributes:attributes];
}
- (CGFloat) widthOfString:(NSString *)string withFont:(NSFont*)font {
    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName, nil];
    return [[[NSAttributedString alloc] initWithString:string attributes:attributes] size].width;
}
@end
