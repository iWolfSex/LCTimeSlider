//
//  RMCQSliderView.m
//  RMCQSliderDemo
//
//  Created by 刘超 on 14-2-26.
//  Copyright (c) 2014年 刘超. All rights reserved.
//

#import "RMCQSliderView.h"

@implementation RMCQSliderView
@synthesize labelFontWidth;
@synthesize laelFontHeight;
@synthesize labelColor;
- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code here.
        self.labelFontWidth=[NSFont systemFontOfSize:12.0f];
        self.laelFontHeight=[NSFont systemFontOfSize:6.0f];
        self.labelColor= [NSColor whiteColor];
    }
    return self;
}

- (void)drawRect:(NSRect)dirtyRect
{
	[super drawRect:dirtyRect];
    CGContextRef myContext=[[NSGraphicsContext currentContext]graphicsPort];
    CGContextSetFillColorWithColor(myContext, [[NSColor grayColor] CGColor]);
    CGContextFillRect(myContext,CGRectMake(0, 0, self.frame.size.width, self.frame.size.height));
    NSInteger startpointX=15;//刻度尺的起点横坐标
    NSInteger second=60*60*2;//一个单位的大刻度尺表示有多少秒
    float scaleWidth=((self.frame.size.width-startpointX*2)/(24*60*60/second));//刻度尺的长度
    [self drawRectSliderStartpointAbscissa:startpointX ScaleWidth:scaleWidth addScaleCount:1 addSliderScalevalue:second];
}
-(void)drawRectSliderStartpointAbscissa:(float)abscissa ScaleWidth:(float)width addScaleCount:(NSInteger)n addSliderScalevalue:(float)scalevalue{
    NSInteger scaleCount=24*60*60/scalevalue;
    float sliderWidth=width*scaleCount;
    float sliderY=self.frame.size.height*2/10;
    CGContextRef context=[[NSGraphicsContext currentContext]graphicsPort];//获取画布
    CGContextSetStrokeColorWithColor(context, [NSColor whiteColor].CGColor);//线条颜色
    CGContextSetShouldAntialias(context,NO);//设置线条平滑，不需要两边像素宽
    CGContextSetLineWidth(context,2.0f);//设置线条宽度
    CGContextMoveToPoint(context,0+abscissa,sliderY); //线条起始点
    CGContextAddLineToPoint(context,sliderWidth+abscissa,sliderY);//线条结束点
    CGContextStrokePath(context);//结束，也就是开始画
    for (int i=0; i<scaleCount+1; i++) {
        NSPoint pointA;
        pointA.x=width*i+abscissa;
        pointA.y=sliderY;
        NSPoint pointB;
        pointB.x=width*i+abscissa;
        pointB.y=sliderY+8;
        CGContextMoveToPoint(context,pointA.x,pointA.y); //线条起始点
        CGContextAddLineToPoint(context,pointB.x,pointB.y);//线条结束点
        CGContextStrokePath(context);//结束，也就是开始画
        NSString*title;
        if (i<5) {
            title=[NSString stringWithFormat:@"0%d:00",i*2];
        }else{
            title=[NSString stringWithFormat:@"%d:00",i*2];
        }
        [self drawSliderLablesStartpoint:pointB LableWidth:abscissa*2 LableTitle:title];
        if (i!=scaleCount) {
            for (int j=0; j<n; j++) {
                NSInteger minScaleWidth=width/(n+1);
                NSPoint pointC;
                pointC.x=width*i+minScaleWidth*(j+1)+abscissa;
                pointC.y=sliderY;
                NSPoint pointD;
                pointD.x=width*i+minScaleWidth*(j+1)+abscissa;
                pointD.y=sliderY+4;
                CGContextMoveToPoint(context,pointC.x,pointC.y); //线条起始点
                CGContextAddLineToPoint(context,pointD.x,pointD.y);//线条结束点
                CGContextStrokePath(context);//结束，也就是开始画
            }
        }
    }
}

-(void)drawSliderLablesStartpoint:(NSPoint)point LableWidth:(float)scaleWidth LableTitle:(NSString*)title{
    NSDictionary*attributes=@{NSFontAttributeName:self.labelFontWidth,NSForegroundColorAttributeName:self.labelColor};
    CGRect labelLocation=CGRectMake(point.x-15, point.y-3, [self widthOfString:title withFont:self.labelFontWidth], [self widthOfString:title withFont:self.laelFontHeight]);
    [title drawInRect:labelLocation withAttributes:attributes];
}
- (CGFloat)widthOfString:(NSString *)string withFont:(NSFont*)font {
    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName, nil];
    return [[[NSAttributedString alloc] initWithString:string attributes:attributes] size].width;
}
-(void)scrollPoint:(NSPoint)aPoint{
    
}
-(void)otherMouseUp:(NSEvent *)theEvent{
    
}
@end
