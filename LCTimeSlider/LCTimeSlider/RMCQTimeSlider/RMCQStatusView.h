//
//  RMCQStatusView.h
//  RMCQSliderDemo
//
//  Created by 刘超 on 14-2-26.
//  Copyright (c) 2014年 刘超. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import"RMCQStatusStripCell.h"
@protocol RMCQStatusViewDelegate;
@interface RMCQStatusView : NSView{
	float statusScrollViewheight;
	NSMutableArray*statusData;
	float cellheigh;
	NSMutableArray*aChannelDataArray;
	NSMutableDictionary*channesDataDic;
	
	CGContextRef myContext;
}
@property(nonatomic,assign)float statusScrollViewheight;
@property(nonatomic,retain)NSMutableArray*statusData;
@property(nonatomic,assign)float cellheigh;
@property(nonatomic,retain)NSMutableArray*aChannelDataArray;
@property(nonatomic,retain)NSMutableDictionary*channesDataDic;
@property(nonatomic,assign)CGContextRef myContext;
@property (nonatomic, strong) NSFont* labelFontWidth;
@property(nonatomic,strong)NSFont*laelFontHeight;
@property (nonatomic, strong) NSColor* labelColor;
@property(nonatomic,assign)id<RMCQStatusViewDelegate>delgate;
-(id)initWithFrame:(NSRect)frame statusForDataDic:(NSMutableDictionary *)dataDic;
-(void)drawStatusForDataDic:(NSMutableDictionary*)dataDic;
-(void)clearDrawChannelStatusData;
@end
@protocol RMCQStatusViewDelegate <NSObject>
-(void)statusDrawCompleted:(int)channel;
@end