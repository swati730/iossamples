//
//  JSonSampleViewController.h
//  DemoWebServices
//
//  Created by Swati Goyal on 11/6/14.
//  Copyright (c) 2014 MEDITAB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JSonSampleViewController : UIViewController
@property (nonatomic, strong) IBOutlet UILabel *greetingId;
@property (nonatomic, strong) IBOutlet UILabel *greetingContent;

- (IBAction)fetchGreeting;

@end
