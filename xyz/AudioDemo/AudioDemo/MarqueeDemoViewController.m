//
//  MarqueeDemoViewController.m
//  AudioDemo
//
//  Created by Swati Goyal on 11/10/14.
//  Copyright (c) 2014 Appcoda. All rights reserved.
//

#import "MarqueeDemoViewController.h"

@interface MarqueeDemoViewController ()

@end

@implementation MarqueeDemoViewController
@synthesize demoLabel1, demo;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Continuous Type
    self.demoLabel1.marqueeType = MLContinuous;
    self.demoLabel1.scrollDuration = 15.0;
    self.demoLabel1.animationCurve = UIViewAnimationOptionCurveEaseInOut;
    self.demoLabel1.fadeLength = 10.0f;
    self.demoLabel1.continuousMarqueeExtraBuffer = 10.0f;
    self.demoLabel1.tag = 101;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
