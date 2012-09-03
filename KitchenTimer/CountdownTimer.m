//
//  CountdownTimer.m
//  KitchenTimer
//
//  Created by Kojo Sugita on 12/09/04.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "CountdownTimer.h"

@implementation CountdownTimer

@synthesize clock;
@synthesize countdownTime;
@synthesize timerNoticefication;
@synthesize notifyEachRound;

// 本クラスのインスタンス
static CountdownTimer *myInstance;

/**
 * シングルトン
 * @return 取得したインスタンス
 */
+ (CountdownTimer *)sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        myInstance = [[CountdownTimer alloc]init];
    });
    return myInstance;    
}

/**
 * イニシャライザ
 */
- (id)init
{
    if (self = [super init]) {
        [self setNoticeName];
        clock = 0.0f;
    }
    return self;
}

/**
 * 通知を設定する
 */
- (void)setNoticeName
{
    timerNoticefication = @"TimerNoticefication";
}

- (void)setNotification:(CGFloat)noticeTime
{
    // 通知の受取側に送る値を作成する
    NSNumber *noticeTimeNumber = [NSNumber numberWithFloat:noticeTime];
    NSDictionary *sendData = [NSDictionary dictionaryWithObject:noticeTimeNumber forKey:@"noticeTime"];
    
    // 通知を作成する
    notification = [NSNotification notificationWithName:timerNoticefication object:self userInfo:sendData];
}

/**
 * 時間計測開始（終了時間に達したときに通知）
 * @param _countdownTime 終了時間
 * @param _clock 時間計測のクロック
 */
- (void)start:(CGFloat)_countdownTime clock:(CGFloat)_clock
{
    self.countdownTime = _countdownTime;
    self.clock = _clock;
    
    [self start];
}

/**
 * 時間計測開始（終了時間に通知）
 * @param _countdownTime 終了時間
 */
- (void)start:(CGFloat)_countdownTime
{
    self.countdownTime = _countdownTime;
    
    [self start];
}

/**
 * 時間計測開始
 */
- (void)start
{
    // 現在日付を取得
    startDate = [NSDate date];
    
    // 通知をセットする
    [self setNotification:self.countdownTime];
    
    if (self.clock == 0.0f) {
        self.clock = 0.25f;
    }
    
    // タイマーセット
    timer = [NSTimer scheduledTimerWithTimeInterval:clock 
                                             target:self 
                                           selector:@selector(doTimer:) 
                                           userInfo:nil 
                                            repeats:YES];
}

/**
 * 時間計測終了
 * @return 経過時間
 */
- (NSTimeInterval)stop
{
    [timer invalidate];
    timer = nil;
    return [[NSDate date] timeIntervalSinceDate:startDate];
}

/**
 * 時間計測一時停止
 */
- (void)pause
{
}

/**
 * タイマーのイベントハンドラ
 */
- (void)doTimer:(NSTimer *)timer
{
    NSTimeInterval interval = [[NSDate date] timeIntervalSinceDate:startDate];

    if (interval >= self.countdownTime) {
        [self setNotification:0.0f];
        [[NSNotificationCenter defaultCenter] postNotification:notification];
        
        [self stop];
        
    } else {
        if (notifyEachRound) {
            [self setNotification:self.countdownTime - interval];
            [[NSNotificationCenter defaultCenter] postNotification:notification];            
        }
    }
}

@end
