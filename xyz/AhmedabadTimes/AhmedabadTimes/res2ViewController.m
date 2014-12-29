//
//  res2ViewController.m
//  AhmedabadTimes
//
//  Created by Swati Goyal on 10/16/14.
//  Copyright (c) 2014 MEDITAB. All rights reserved.
//

#import "res2ViewController.h"
#import "PlacesFirstViewController.h"

@interface res2ViewController ()

@end

@implementation res2ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)btn_main:(id)sender{
    //PlacesFirstViewController *controller = [[PlacesFirstViewController alloc] initWithNibName:@"PlacesFirstViewController" bundle:nil];
   // [self.tabBarController.selectedIndex = 1];
    //[self.tabBarController setSelectedIndex:1];
  // UITabBarController *tabBarController = [[UITabBarController alloc] init];
    //[self.tabBarController.selectedViewController = [self.tabBarController.viewControllers objectAtIndex:1] ];
   self.tabBarController.selectedViewController = [self.tabBarController.viewControllers objectAtIndex:0];
}
-(IBAction)btn_tab4:(id)sender{
    
    self.tabBarController.selectedViewController = [self.tabBarController.viewControllers objectAtIndex:3];
}
@end
