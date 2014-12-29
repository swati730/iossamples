//
//  JukeBoxViewController.h
//  AudioDemo
//
//  Created by Swati Goyal on 11/8/14.
//  Copyright (c) 2014 Appcoda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
@interface JukeBoxViewController : UIViewController
@property (nonatomic, retain) AVAudioPlayer *audioPlayer;

// Public methods
- (void)initPlayer:(NSString*) audioFile fileExtension:(NSString*)fileExtension;
- (void)playAudio;
- (void)pauseAudio;
- (void)setCurrentAudioTime:(float)value;
- (float)getAudioDuration;
- (NSString*)timeFormat:(float)value;
- (NSTimeInterval)getCurrentAudioTime;

@end