//
//  PickTicketMovieViewController.m
//  BookMyShow
//
//  Created by Swati Goyal on 10/20/14.
//  Copyright (c) 2014 MEDITAB. All rights reserved.
//

#import "PickTicketMovieViewController.h"
#import "FeedbackViewController.h"

@interface PickTicketMovieViewController ()

@end

@implementation PickTicketMovieViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
@synthesize movie;
@synthesize category;
@synthesize time;
@synthesize totalPrice;
@synthesize str_movieName;
@synthesize str_time;
@synthesize myNewString;
@synthesize categorylabel;
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    // NSLog(movie.text);
    // NSLog(category);
   // NSLog(time.text);
    
    
    movie.text = self.str_movieName;
    time.text =self.str_time;
    categorylabel.text = category;
    
    _no_of_tickets = 1;
    if([category isEqualToString:@"Premium"]){
        _price = 200;
    }
    else if([category isEqualToString:@"Silver"]){
        _price = 250;
    }
    else if([category isEqualToString:@"Gold"]){
        _price=300;
    }
    _str_price = [NSString stringWithFormat:@"%i", _price];
    _pricelabel.text = [@"Rs." stringByAppendingString: _str_price];
    _total = _price * _no_of_tickets;
    myNewString = [NSString stringWithFormat:@"%i", _total];
    totalPrice.text = [ @"Rs." stringByAppendingString: myNewString];
    //totalPrice.text = myNewString;
    //NSLog();
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)submit:(id)sender{

    FeedbackViewController *controller = [[FeedbackViewController alloc]initWithNibName:@"FeedbackViewController" bundle:nil];
    [self.navigationController pushViewController:controller animated:YES];
}
- (IBAction)ticketsSelect:(id)sender
{
    
    UISegmentedControl *segmentedControl = (UISegmentedControl *) sender;
    //UIColor *newSelectedTintColor = [UIColor colorWithRed: 0/255.0 green:175/255.0 blue:0/255.0 alpha:1.0];
    //[[[segmentedControl subviews] objectAtIndex:1] setTintColor:newSelectedTintColor];
    if(segmentedControl.tag == 0)
    {
        if(segmentedControl.selectedSegmentIndex == 0)
        {
            _no_of_tickets =1;        }
        else if(segmentedControl.selectedSegmentIndex == 1)
        {
            _no_of_tickets =2;
        }
        else if(segmentedControl.selectedSegmentIndex == 2)
        {
            _no_of_tickets =3;
        }
        else if(segmentedControl.selectedSegmentIndex == 3)
        {
            _no_of_tickets =4;
        }
        else if(segmentedControl.selectedSegmentIndex == 4)
        {
            _no_of_tickets =5;
        }
        else if(segmentedControl.selectedSegmentIndex == 5)
        {
            _no_of_tickets =6;
        }
        else if(segmentedControl.selectedSegmentIndex == 6)
        {
            _no_of_tickets =7;
        }
        else if(segmentedControl.selectedSegmentIndex == 7)
        {
            _no_of_tickets =8;
        }
        else if(segmentedControl.selectedSegmentIndex == 8)
        {
            _no_of_tickets =9;
        }
        else         {
            _no_of_tickets =10;
        }
    }
    _total = _price * _no_of_tickets;
    myNewString = [NSString stringWithFormat:@"%i", _total];
    totalPrice.text = [ @"Rs." stringByAppendingString: myNewString];
   }

@end
