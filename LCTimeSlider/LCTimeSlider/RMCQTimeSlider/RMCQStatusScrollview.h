//
//  RMCQStatusScrollview.h
//  RMCQSliderDemo
//
//  Created by 刘超 on 14-2-26.
//  Copyright (c) 2014年 刘超. All rights reserved.
//

#import <Cocoa/Cocoa.h>

#import "RMCQStatusView.h"
@protocol RMCQStatusScrollviewDelegate;
@interface RMCQStatusScrollview : NSScrollView<RMCQStatusViewDelegate>{


}
@property(nonatomic,assign)id<RMCQStatusScrollviewDelegate>delegate;
@property(nonatomic,retain)NSString*time;
@property(nonatomic,retain)RMCQStatusView*statusView;
@property(nonatomic,assign)BOOL isZoom;
-(void)statusForDataDic:(NSMutableDictionary*)dataDic;
-(void)clearChannelStatusData;
-(void)getPlayBackeTime:(NSString*)aTime;
@end
@protocol RMCQStatusScrollviewDelegate <NSObject>

-(void)captureTheStatusPoint:(NSPoint)aPoint;
-(void)selectTimeForPoint:(NSPoint)point;
-(void)statusDrawCompleteds:(int)channel;
-(void)clickOrSliderTheStatus;
@end