//
//  RMCQTimeSliderDelegate.h
//  ViewClient
//
//  Created by 刘超 on 14-3-6.
//
//

#import <Foundation/Foundation.h>

@protocol RMCQTimeSliderDelegate <NSObject>
-(void)channelStatusDrawCompleted:(int)channelCount;
-(void)timeSliderTitle:(NSString*)time;
@end
