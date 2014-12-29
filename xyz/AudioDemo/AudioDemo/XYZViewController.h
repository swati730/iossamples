//
//  XYZViewController.h
//  AudioDemo
//
//  Created by Swati Goyal on 11/8/14.
//  Copyright (c) 2014 Appcoda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JukeBoxViewController.h"

@interface XYZViewController : UIViewController

@property (nonatomic, strong) JukeBoxViewController *audioPlayer;

@property (weak, nonatomic) IBOutlet UISlider *currentTimeSlider;
@property (weak, nonatomic) IBOutlet UIButton *playButton;
@property (weak, nonatomic) IBOutlet UILabel *duration;
@property (weak, nonatomic) IBOutlet UILabel *timeElapsed;

@property BOOL isPaused;
@property BOOL scrubbing;

@property NSTimer *timer;

@end