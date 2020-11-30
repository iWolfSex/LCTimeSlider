//
//  ViewController.h
//  LCTimeSlider
//
//  Created by 刘超 on 2020/11/30.
//  Copyright © 2020 刘超. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "RMCQTimeSlider.h"

@interface ViewController : NSViewController
@property (weak) IBOutlet RMCQTimeSlider *timeSlider;
@property(nonatomic,strong)NSMutableDictionary * statusDataDic;


@end

