//
//  PlacesFirstViewController.m
//  AhmedabadTimes
//
//  Created by Swati Goyal on 10/16/14.
//  Copyright (c) 2014 MEDITAB. All rights reserved.
//

#import "PlacesFirstViewController.h"
#import "Places2ViewController.h"

@interface PlacesFirstViewController ()

@end

@implementation PlacesFirstViewController

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
-(IBAction)btn_places:(id)sender{
    Places2ViewController *controller = [[Places2ViewController alloc] initWithNibName:@"Places2ViewController" bundle:nil];
    [self.navigationController pushViewController:controller animated:YES];
}
@end
