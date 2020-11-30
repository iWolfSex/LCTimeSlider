//
//  RMCQStatusData.h
//  ViewClient
//
//  Created by 刘超 on 14-3-6.
//
//

#import <Foundation/Foundation.h>

@interface RMCQStatusData : NSObject{
	NSString*channel;
	NSString*startTime;
	NSString*endTime;
	NSString*statusType;
	NSString*year;
}
@property(nonatomic,retain)NSString*channel;
@property(nonatomic,retain)NSString*startTime;
@property(nonatomic,retain)NSString*endTime;
@property(nonatomic,retain)NSString*statusType;
@property(nonatomic,retain)NSString*year;
@end
