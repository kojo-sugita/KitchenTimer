//
//  ViewController.h
//  KitchenTimer
//
//  Created by Kojo Sugita on 12/08/31.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CountdownTimer.h"

@interface ViewController : UIViewController {
    CountdownTimer *timer;
    BOOL isPause;
}

//- (IBAction)startButton:(id)sender;
//- (IBAction)stopButton:(id)sender;
//- (IBAction)pauseButton:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *startButton;
@property (weak, nonatomic) IBOutlet UIButton *pauseButton;
@property (weak, nonatomic) IBOutlet UIButton *stopButton;

- (IBAction)tapped_startButton:(id)sender;
- (IBAction)tapped_pauseButton:(id)sender;
- (IBAction)tapped_stopButton:(id)sender;


@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@end
