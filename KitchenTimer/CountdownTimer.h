//
//  CountdownTimer.h
//  KitchenTimer
//
//  Created by Kojo Sugita on 12/09/04.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CountdownTimer : NSObject {
    NSDate *startDate;    
    NSTimer *timer;
    
    NSNotification *notification;
}

@property CGFloat clock;
@property CGFloat countdownTime;
@property NSString *timerNoticefication;
@property BOOL notifyEachRound;

+ (CountdownTimer *)sharedInstance;

- (void)start:(CGFloat)_countdownTime clock:(CGFloat)_clock;
- (void)start:(CGFloat)_countdownTime;
- (NSTimeInterval)stop;
- (void)pause;

@end
