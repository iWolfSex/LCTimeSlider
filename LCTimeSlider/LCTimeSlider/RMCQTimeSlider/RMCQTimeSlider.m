//
//  RMCQTimeSlider.m
//  RMCQSliderDemo
//
//  Created by 刘超 on 14-2-24.
//  Copyright (c) 2014年 刘超. All rights reserved.
//

#import "RMCQTimeSlider.h"


@implementation RMCQTimeSlider

-(instancetype)initWithCoder:(NSCoder *)coder{
    self = [super initWithCoder:coder];
    if (self) {
        [self setUpView];
    }
    return self;
}
- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpView];
    }
    return self;
}

-(void)setUpView{
    [self addSubview:self.sliderScrollView];
    [self addSubview:self.statusScrollview];
    [self addSubview:self.sliderButtonView];
    [self addSubview:self.textField];
    self.isZoom=YES;
    [self.sliderScrollView setFrame:CGRectMake(self.frame.size.width*1/13*1/2, self.frame.size.height*7/9, self.frame.size.width*12/13, self.frame.size.height*2/9)];
    [self.statusScrollview setFrame:CGRectMake(self.frame.size.width*1/13*1/2, 0, self.frame.size.width*12/13, self.frame.size.height*7/9)];
    if (self.sliderButtonView.frame.origin.x<self.frame.size.width*1/13*1/2+7.5) {
        [self.sliderButtonView setFrame:CGRectMake(self.frame.size.width*1/13*1/2+7.5, 15,15, self.frame.size.height)];
        [self.textField setFrame:CGRectMake(self.frame.size.width*1/13*1/2,self.frame.size.height*7/9+27, 120, self.frame.size.height*2/9-27)];
    }
    if (self.isZoom) {
        self.isZoom=NO;
        if (self.pointX<15||self.pointX>self.sliderScrollView.frame.size.width-15) {
            return;
        }
        if (self.pointX>=15&&self.pointX<=self.sliderScrollView.frame.size.width-15) {
            [self.sliderButtonView setFrame:CGRectMake(self.frame.size.width*1/13*1/2+(self.pointX-self.sliderButtonView.frame.size.width/2), 15, self.sliderButtonView.frame.size.width, self.sliderButtonView.frame.size.height)];
        }
        if (self.pointX>=self.textField.frame.size.width/2&&self.pointX<=self.sliderScrollView.frame.size.width-self.textField.frame.size.width/2) {
            [self.textField setFrame:CGRectMake(self.frame.size.width*1/13*1/2+(self.pointX-self.textField.frame.size.width/2), self.frame.size.height*7/9+27, self.textField.frame.size.width, self.textField.frame.size.height)];
        }else{
            if (self.pointX<self.textField.frame.size.width/2) {
                [self.textField setFrame:CGRectMake(self.frame.size.width*1/13*1/2,self.frame.size.height*7/9+27, 120, self.textField.frame.size.height)];
            }else{
                [self.textField setFrame:CGRectMake(self.sliderScrollView.frame.size.width-self.textField.frame.size.width+self.frame.size.width*1/13*1/2,self.frame.size.height*7/9+27, 120, self.textField.frame.size.height)];
            }
        }
    }
    
}
-(void)drawHandle:(CGContextRef)ctx{
    
}
-(void)drawLabels:(CGContextRef)ctx{
    
}
-(void)scrollPoint:(NSPoint)aPoint{
    
}
#pragma  mark_NSControl
- (void)mouseDown:(NSEvent *)theEvent {

    
}
-(void)rightMouseDown:(NSEvent *)theEvent{
    
}
-(void)otherMouseDown:(NSEvent *)theEvent{
    
}

- (void)scrollWheel:(NSEvent *)theEvent
{
    [[self nextResponder] scrollWheel:theEvent];
}



-(void)mouseDragged:(NSEvent *)theEvent{

}
-(void)rightMouseDragged:(NSEvent *)theEvent{
    
}
-(void)otherMouseDragged:(NSEvent *)theEvent{
    
}


- (void)mouseUp:(NSEvent *)theEvent {

}
-(void)rightMouseUp:(NSEvent *)theEvent{
    
}
-(void)otherMouseUp:(NSEvent *)theEvent{
    
}
-(void)setAnimations:(NSDictionary *)animations{
}

-(void)mouseMoved:(NSEvent *)theEvent{
    [super mouseMoved:theEvent];
//    NSLog(@"mouse moved !!!");
}
-(void)captureTheSlidingPoint:(NSPoint)point{
	if (point.x<15||point.x>self.sliderScrollView.frame.size.width-15) {
		return;
	}
    if (point.x>=15 && point.x<=self.sliderScrollView.frame.size.width-15) {
        [self.sliderButtonView setFrame:CGRectMake(self.frame.size.width*1/13*1/2+(point.x-self.sliderButtonView.frame.size.width/2), 15, self.sliderButtonView.frame.size.width, self.sliderButtonView.frame.size.height)];
    }
    if (point.x>=self.textField.frame.size.width/2&&point.x<=self.sliderScrollView.frame.size.width-self.textField.frame.size.width/2) {
        [self.textField setFrame:CGRectMake(self.frame.size.width*1/13*1/2+(point.x-self.textField.frame.size.width/2), self.frame.size.height*7/9+27, self.textField.frame.size.width, self.textField.frame.size.height)];
    }else{
        if (point.x<self.textField.frame.size.width/2) {
            [self.textField setFrame:CGRectMake(self.frame.size.width*1/13*1/2,self.frame.size.height*7/9+27, 120, self.textField.frame.size.height)];
        }else{
            [self.textField setFrame:CGRectMake(self.sliderScrollView.frame.size.width-self.textField.frame.size.width+self.frame.size.width*1/13*1/2,self.frame.size.height*7/9+27, 120, self.textField.frame.size.height)];
        }
    }
    [self convertedIntoStandardTimeForPoint:point];
}
-(void)captureTheStatusPoint:(NSPoint)point{
    if (point.x<15||point.x>self.sliderScrollView.frame.size.width-15) {
		return;
	}
    if (point.x>=15&&point.x<=self.sliderScrollView.frame.size.width-15) {
        [self.sliderButtonView setFrame:CGRectMake(self.frame.size.width*1/13*1/2+(point.x-self.sliderButtonView.frame.size.width/2), 15, self.sliderButtonView.frame.size.width, self.sliderButtonView.frame.size.height)];
    }
    if (point.x>=self.textField.frame.size.width/2&&point.x<=self.sliderScrollView.frame.size.width-self.textField.frame.size.width/2) {
	
        [self.textField setFrame:CGRectMake(self.frame.size.width*1/13*1/2+(point.x-self.textField.frame.size.width/2), self.frame.size.height*7/9+27, self.textField.frame.size.width, self.textField.frame.size.height)];
    }else{
        if (point.x<self.textField.frame.size.width/2) {
			
            [self.textField setFrame:CGRectMake(self.frame.size.width*1/13*1/2,self.frame.size.height*7/9+27, 120,  self.textField.frame.size.height)];
        }else{
			
            [self.textField setFrame:CGRectMake(self.sliderScrollView.frame.size.width-self.textField.frame.size.width+self.frame.size.width*1/13*1/2,self.frame.size.height*7/9+27, 120, self.textField.frame.size.height)];
        }
        
    }
    [self convertedIntoStandardTimeForPoint:point];
}
-(void)selectTimeForPoint:(NSPoint)point{
	self.isZoom=YES;
	self.pointX=point.x;
}
-(void)captureTheSliderButtonSuperPoint:(NSPoint)point{
	NSPoint bPoint;
	bPoint.y=point.y;
	bPoint.x=point.x-self.frame.size.width*1/13*1/2;
	self.isSlider=YES;
	[self captureTheSlidingPoint:bPoint];
}
-(void)clickOrSliderTheStatus{
	self.isSlider=YES;
}
-(void)clickOrSliderTheSlider{
	self.isSlider=YES;
	
}
-(void)videoPlaybackScheduleTime:(NSString*)time{
	NSArray*timeArray=[time componentsSeparatedByString:@" "];
	self.todayTime=[timeArray objectAtIndex:0];
	NSArray*array=[[timeArray objectAtIndex:1] componentsSeparatedByString:@":"];
	int hours=[[array objectAtIndex:0] intValue];
	int minute=[[array objectAtIndex:1] intValue];
	int second=[[array objectAtIndex:2] intValue];
	float totalSeconds=hours*60*60+minute*60+second;
	float sliderTotalSeconds=24*60*60;
	float timeCase=totalSeconds/sliderTotalSeconds;
	NSPoint point;
	point.x=15+(self.sliderScrollView.frame.size.width-30)*timeCase;
	[self captureTheSlidingPoint:point];
}
-(void)convertedIntoStandardTimeForPoint:(NSPoint)point{
    NSPoint p=point;
    float sliderTotalLength=self.sliderScrollView.frame.size.width-30;
    float slidingDistance=p.x-15;
    NSInteger totaSecond=60*60*24;//
    NSInteger slidingSecond=totaSecond*((slidingDistance)/sliderTotalLength);
    NSInteger hour=slidingSecond/(1*60*60);
    NSInteger minute=(slidingSecond%(1*60*60))/60*1;
    NSInteger second=(slidingSecond%(1*60*60))%60;
    NSString*hours;
    NSString*minutes;
    NSString*seconds;
    if (hour<10) {
       hours=[NSString stringWithFormat:@"0%ld",hour];
    }else{
        hours=[NSString stringWithFormat:@"%ld",hour];
    }
    if (minute<10) {
        minutes=[NSString stringWithFormat:@"0%ld",minute];
    }else{
        minutes=[NSString stringWithFormat:@"%ld",minute];
    }
    if (second<10) {
        seconds=[NSString stringWithFormat:@"0%ld",second];
    }else{
        seconds=[NSString stringWithFormat:@"%ld",second];
    }
    NSString*time=[NSString stringWithFormat:@"%@ %@:%@:%@",self.todayTime,hours,minutes,seconds];
	[self videoPlayBackTime:time];
//    NSFont*font=[NSFont fontWithName:@"Arial" size:11.0];
//    [self.textField setFont:font];
//    NSSize size = [self.textField frame].size;
//	size.height = ceil([font ascender]) - floor([font descender]) + 5;
//    [self.textField setFrameSize:size];
    [self.textField setStringValue:time];
	if (self.delegate && self.isSlider) {
		[self.delegate timeSliderTitle:time];
		self.isSlider=NO;
	}
}
-(void)videoPlayBackTime:(NSString*)time{
	if (self.statusScrollview) {
		[self.statusScrollview getPlayBackeTime:time];
	}
}
-(void)statusForData:(NSMutableDictionary *)dataDic OfSelectDay:(NSString*)time{
	[self.statusScrollview statusForDataDic:dataDic];
	if (self.textField) {
//		NSFont*font=[NSFont fontWithName:@"Arial" size:11.0];
//		[self.textField setFont:font];
//		NSSize size = [self.textField frame].size;
//		size.height = ceil([font ascender]) - floor([font descender]) + 5;
//		[self.textField setFrameSize:size];
		[self.textField setStringValue:time];
	}
}
-(void)clearChannelStatus{
	[self.statusScrollview clearChannelStatusData];
}
-(void)statusDrawCompleteds:(int)channel{
	[self.delegate channelStatusDrawCompleted:channel];
}


-(RMCQSliderScrollview *)sliderScrollView{
    if (_sliderScrollView == nil) {
        _sliderScrollView=[[RMCQSliderScrollview alloc]initWithFrame:CGRectMake(self.frame.size.width*1/13*1/2, self.frame.size.height*7/9, self.frame.size.width*12/13, self.frame.size.height*2/9)];
        [_sliderScrollView setVerticalLineScroll:0.0];
        [_sliderScrollView setVerticalPageScroll:0.0];
        _sliderScrollView.delegate=self;
        
    }
    return _sliderScrollView;
}

-(RMCQStatusScrollview *)statusScrollview{
    if (_statusScrollview == nil) {
        _statusScrollview=[[RMCQStatusScrollview alloc]initWithFrame:CGRectMake(self.frame.size.width*1/13*1/2, 0, self.frame.size.width*12/13, self.frame.size.height*7/9)];
        _statusScrollview.delegate=self;
    }
    return _statusScrollview;
}

-(RMCQSliderButtonView *)sliderButtonView{
    if (_sliderButtonView == nil) {
        _sliderButtonView =[[RMCQSliderButtonView alloc]initWithFrame:CGRectMake(self.frame.size.width*1/13*1/2+7.5, 15,15, self.frame.size.height)];
        _sliderButtonView.delegate=self;
    }
    return _sliderButtonView;
}

-(RMCQtextView *)textField{
    if (_textField == nil) {
        _textField =[[RMCQtextView alloc]initWithFrame:CGRectMake(self.frame.size.width*1/13*1/2,self.frame.size.height*7/9+27, 120, self.frame.size.height*2/9-27)];
        NSDate* date = [NSDate date];

        NSDateFormatter* formatter = [[NSDateFormatter alloc] init];

        [formatter setDateFormat:@"yyyy-MM-dd"];

        _todayTime = [formatter stringFromDate:date];
        NSString*initTime=[NSString stringWithFormat:@"%@ %@",_todayTime,@"00:00:00"];
        [_textField setStringValue:initTime];
    }
    return _textField;
}

@end
