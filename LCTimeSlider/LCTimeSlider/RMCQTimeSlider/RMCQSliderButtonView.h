//
//  RMCQSliderButtonView.h
//  RMCQSliderDemo
//
//  Created by 刘超 on 14-3-27.
//  Copyright (c) 2014年 刘超. All rights reserved.
//

#import <Cocoa/Cocoa.h>
@protocol RMCQSliderButtonViewDelegate;
@interface RMCQSliderButtonView : NSView
@property(nonatomic,assign)id<RMCQSliderButtonViewDelegate>delegate;
@end
@protocol RMCQSliderButtonViewDelegate <NSObject>
-(void)captureTheSliderButtonSuperPoint:(NSPoint)point;
@end