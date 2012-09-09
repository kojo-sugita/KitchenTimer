//
//  ViewController.m
//  KitchenTimer
//
//  Created by Kojo Sugita on 12/08/31.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () 

@end

@implementation ViewController
@synthesize startButton;
@synthesize pauseButton;
@synthesize stopButton;
@synthesize timeLabel;

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.pauseButton.titleLabel.text = @"一時停止";
    self.pauseButton.enabled = NO;

    // タイマー
    timer = [CountdownTimer sharedInstance];
    timer.notifyEachRound = YES;
    
    isPause = NO;

    // 通知の設定
    [[NSNotificationCenter defaultCenter]addObserver:self
                                            selector:@selector(getNotifiedOnTimer:)
                                                name:timer.timerNoticefication
                                              object:timer];
}

- (void)viewDidUnload
{
    [self setTimeLabel:nil];
    [self setStartButton:nil];
    [self setPauseButton:nil];
    [self setStopButton:nil];
    
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)getNotifiedOnTimer:(NSNotification*)center
{
    CGFloat value = ((NSNumber *)[[center userInfo] objectForKey:@"noticeTime"]).floatValue;
    timeLabel.text = [NSString stringWithFormat:@"%.1f", value];
}

- (IBAction)tapped_startButton:(id)sender {
    self.pauseButton.enabled = YES;

    [timer start:10.0f clock:0.1f];
}

- (IBAction)tapped_pauseButton:(id)sender {
    if (isPause) {
        [self.pauseButton setTitle:@"一時停止" forState:UIControlStateNormal];
        isPause = NO;
        [timer restart];
        
    } else {
        [self.pauseButton setTitle:@"再開" forState:UIControlStateNormal];
        isPause = YES;
        [timer pause];        
    }
}

- (IBAction)tapped_stopButton:(id)sender {
    self.pauseButton.enabled = NO;
    isPause = NO;
    [self.pauseButton setTitle:@"一時停止" forState:UIControlStateNormal];

    self.timeLabel.text = @"0";
    [timer stop];
}

@end
