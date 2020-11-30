//
//  RMCQStatusData.m
//  ViewClient
//
//  Created by 刘超 on 14-3-6.
//
//

#import "RMCQStatusData.h"

@implementation RMCQStatusData
@synthesize channel;
@synthesize startTime;
@synthesize endTime;
@synthesize statusType;
-(id)init{
	self=[super init];
	if (self) {
		self.channel=nil;
		self.startTime=nil;
		self.endTime=nil;
		self.statusType=nil;
		self.year=nil;
		}
	return self;
}
@end
