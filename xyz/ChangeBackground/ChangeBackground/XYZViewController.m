//
//  XYZViewController.m
//  ChangeBackground
//
//  Created by Swati Goyal on 10/14/14.
//  Copyright (c) 2014 MEDITAB. All rights reserved.
//

#import "XYZViewController.h"

@interface XYZViewController ()

@end

@implementation XYZViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)btn_pressMeClick: (id) sender   {
    
    Lbl_text.text = @"Swati";
    int r = arc4random() % 200;
    int g = arc4random() % 200;
    int b = arc4random() % 200;
    
    UIColor *color = [UIColor colorWithRed:(r/200.0) green:(g/200.0) blue:(b/200.0) alpha:0.3];
    [self.view setBackgroundColor:color];
}

@end
