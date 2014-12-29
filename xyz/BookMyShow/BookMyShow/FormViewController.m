//
//  FormViewController.m
//  BookMyShow
//
//  Created by Swati Goyal on 10/20/14.
//  Copyright (c) 2014 MEDITAB. All rights reserved.
//

#import "FormViewController.h"
#import "PickTicketMovieViewController.h"

@interface FormViewController ()

@end

@implementation FormViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
    
}
@synthesize controller;
@synthesize movie;
- (void)viewDidLoad
{
    [super viewDidLoad];
   controller = [[PickTicketMovieViewController alloc]initWithNibName:@"PickTicketMovieViewController" bundle:nil];
    controller.str_time = @"10:30am";
    controller.category = @"Premium";
    //NSLog(movie);
    // Do any additional setup after loading the view from its nib.
    /*if([controller.category isEqualToString:@""])
    {
        controller.category = @"Premium";
    }
    if([controller.str_time isEqualToString:@" "]){
        controller.str_time = @"10:30am";
    }*/
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)btn_pickTicket:(id)sender{
    
    controller.str_movieName = movie;
    [self.navigationController pushViewController:controller animated:YES];
}

- (IBAction)segmentSwitch:(id)sender
{
    
    UISegmentedControl *segmentedControl = (UISegmentedControl *) sender;
    
    if(segmentedControl.tag == 0)
    {
        if(segmentedControl.selectedSegmentIndex == 0)
        {
           controller.str_time = @"10:30 am";
            NSLog(@"Reached");
        }
        else if(segmentedControl.selectedSegmentIndex == 1)
        {
            controller.str_time = @"11:30 am";
        }
        else if(segmentedControl.selectedSegmentIndex == 2)
        {
            controller.str_time = @"12:30 pm";
        }
        else if(segmentedControl.selectedSegmentIndex == 3)
        {
            controller.str_time = @"02:00 pm";
        }
        else if(segmentedControl.selectedSegmentIndex == 4)
        {
            controller.str_time = @"04:30 pm";
        }
        else         {
            controller.str_time = @"06:30 pm";
        }
        controller.time.text =controller.str_time;
    }
    else if(segmentedControl.tag == 2)
    {
        if(segmentedControl.selectedSegmentIndex == 0)
        {
            controller.category= @"Premium";
            controller.price = 200;        }
        else if(segmentedControl.selectedSegmentIndex == 1)
        {
            controller.category= @"Silver";
            controller.price = 250;
        }
        else
        {
            controller.category= @"Gold";
            controller.price = 300;
        }
        controller.categorylabel.text = controller.category;
        controller.str_price = [NSString stringWithFormat:@"%i", controller.price];
        controller.pricelabel.text = [@"Rs." stringByAppendingString: controller.str_price];
        controller.total = controller.price * controller.no_of_tickets;
        controller.myNewString = [NSString stringWithFormat:@"%i", controller.total];
        //controller.totalPrice.text = controller.myNewString;
        controller.totalPrice.text = [ @"Rs." stringByAppendingString: controller.myNewString];
    }
}


@end
