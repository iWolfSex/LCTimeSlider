//
//  RMCQSliderScrollview.h
//  RMCQSliderDemo
//
//  Created by 刘超 on 14-2-26.
//  Copyright (c) 2014年 刘超. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "RMCQSliderView.h"
@protocol RMCQSliderScrollviewDelegate;
@interface RMCQSliderScrollview : NSScrollView{
    RMCQSliderView*sliderview;
    
}
@property(nonatomic,retain)RMCQSliderView*sliderview;
@property(nonatomic,assign)id<RMCQSliderScrollviewDelegate>delegate;
@end
@protocol RMCQSliderScrollviewDelegate
-(void)captureTheSlidingPoint:(NSPoint)point;
-(void)clickOrSliderTheSlider;
@end