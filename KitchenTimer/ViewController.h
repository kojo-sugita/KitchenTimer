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
}

- (IBAction)startButton:(id)sender;
- (IBAction)stopButton:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@end
