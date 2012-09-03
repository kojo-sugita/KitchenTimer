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
@synthesize timeLabel;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    timer = [CountdownTimer sharedInstance];
    timer.notifyEachRound = YES;
    
    [[NSNotificationCenter defaultCenter]addObserver:self
                                            selector:@selector(getNotifiedOnTimer:)
                                                name:timer.timerNoticefication
                                              object:timer];
}

- (void)viewDidUnload
{
    [self setTimeLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)startButton:(id)sender {
    [timer start:20.0f clock:0.1f];
}

- (IBAction)stopButton:(id)sender {
    [timer stop];
}

- (void)getNotifiedOnTimer:(NSNotification*)center
{
    CGFloat value = ((NSNumber *)[[center userInfo] objectForKey:@"noticeTime"]).floatValue;
    timeLabel.text = [NSString stringWithFormat:@"%.1f", value];
}

@end
