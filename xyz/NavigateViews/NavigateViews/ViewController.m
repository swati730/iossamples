//
//  ViewController.m
//  NavigateViews
//
//  Created by Swati Goyal on 10/15/14.
//  Copyright (c) 2014 MEDITAB. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
@interface ViewController ()

@end

@implementation ViewController

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
-(IBAction)btn_transfer_tap:(id)sender {
    SecondViewController *controller = [[SecondViewController alloc] initWithNibName:@"SecondViewController" bundle:nil];
    [self.navigationController pushViewController:controller animated:YES];
    [self.tabBarController tabBarController  ]
    
    
}
@end
