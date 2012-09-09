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
    NSNotification *notification;
    CGFloat pauseTime;
}

@property NSTimer *timer;
@property CGFloat clock;
@property CGFloat countdownTime;
@property NSString *timerNoticefication;
@property BOOL notifyEachRound;

+ (CountdownTimer *)sharedInstance;

//- (void)setTimer:(CGFloat)_countdownTime clock:(CGFloat)_clock;
//- (void)start;

- (void)start:(CGFloat)_countdownTime clock:(CGFloat)_clock;
- (void)start:(CGFloat)_countdownTime;
- (void)restart;
- (NSTimeInterval)stop;
- (NSTimeInterval)pause;

@end
