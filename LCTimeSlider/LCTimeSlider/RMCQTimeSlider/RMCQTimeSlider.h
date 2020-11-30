//
//  RMCQTimeSlider.h
//  RMCQSliderDemo
//
//  Created by 刘超 on 14-2-24.
//  Copyright (c) 2014年 刘超. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "RMCQSliderScrollview.h"
#import "RMCQStatusScrollview.h"
#import "RMCQSliderButtonView.h"
#import "RMCQTextField.h"
#import "RMCQTimeSliderDelegate.h"
#import "RMCQtextView.h"
@interface RMCQTimeSlider : NSControl<RMCQStatusScrollviewDelegate,RMCQSliderScrollviewDelegate,RMCQStatusViewDelegate,RMCQSliderButtonViewDelegate>

@property(nonatomic,weak)id<RMCQTimeSliderDelegate>delegate;
@property(nonatomic,strong) RMCQSliderScrollview*sliderScrollView;
@property(nonatomic,strong) RMCQStatusScrollview*statusScrollview;
@property(nonatomic,strong) RMCQSliderButtonView*sliderButtonView;
@property(nonatomic,strong) RMCQtextView*textField;
@property(nonatomic,strong) NSString*todayTime;
@property(nonatomic,assign) float pointX;
@property(nonatomic,assign) BOOL isSlider;
@property(nonatomic,assign) BOOL isZoom;
@property(nonatomic,strong) NSString*titleTime;
-(void)videoPlaybackScheduleTime:(NSString*)time;
-(void)statusForData:(NSMutableDictionary*)dataDic OfSelectDay:(NSString*)time;
-(void)clearChannelStatus;
@end
