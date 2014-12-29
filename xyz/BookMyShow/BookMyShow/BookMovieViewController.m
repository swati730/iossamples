//
//  BookMovieViewController.m
//  BookMyShow
//
//  Created by Swati Goyal on 10/20/14.
//  Copyright (c) 2014 MEDITAB. All rights reserved.
//

#import "BookMovieViewController.h"
#import "FormViewController.h"


@interface BookMovieViewController ()

@end

@implementation BookMovieViewController

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
-(IBAction)book_ticket:(id)sender{
    FormViewController *controller = [[FormViewController alloc] initWithNibName:@"FormViewController" bundle:nil];
   
    
    if ([sender tag] == 0) {
        controller.movie = @"Bang Bang!";
        NSLog(@"1st Movie booked");
    }
    else if ([sender tag] == 1) {
        controller.movie = @"Haider";
        NSLog(@"2nd Movie booked");
    }
    
    else {
        controller.movie = @"Annabelle";
        NSLog(@"3rd Movie booked");
    }
    
    [self.navigationController pushViewController:controller animated:YES];
    
}
@end
