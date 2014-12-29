//
//  PickTicketMovieViewController.m
//  BookMyShow
//
//  Created by Swati Goyal on 10/20/14.
//  Copyright (c) 2014 MEDITAB. All rights reserved.
//

#import "PickTicketMovieViewController.h"
#import "FeedbackViewController.h"
#import "SqliteLib.h"

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
@synthesize movie, dic_movie,dic_userData;
@synthesize count1,count2,count3;
@synthesize category;
@synthesize time;
@synthesize totalPrice;
@synthesize str_movieName;
@synthesize str_time;
@synthesize myNewString;
@synthesize categorylabel;
@synthesize pickticket, btn_pick_seat;
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    // NSLog(movie.text);
    // NSLog(category);
   // NSLog(time.text);
    
    self.title = @"How Many Tickets";
    movie.text = [dic_movie valueForKey:@"Name"];
    categorylabel.text = category;
   // NSLog(@"%@",category);
    if([categorylabel.text isEqualToString:@"Select a category"]){
        pickticket.enabled = NO;
        btn_pick_seat.enabled = NO;
    }
   
    _no_of_tickets = 1;
    
    NSLog(@"Movie Name: %@",[dic_movie valueForKey:@"Name"]);
    time.text =self.str_time;
    
    
    
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
    
    NSString *query = [NSString stringWithFormat:@"select * from MovieTickets"];
    NSMutableArray *arr_result =[[NSMutableArray alloc]init];
    arr_result =[SqliteLib CustomeQuery:query];
    NSLog(@"array is %@",arr_result);
    NSMutableDictionary *mov =[[NSMutableDictionary alloc]init];
    /*query = [NSString stringWithFormat:@"insert into Movietickets values('%@','%@')",@"Bang Bang!",@"0"];
    //NSString *query = [NSString stringWithFormat:@"insert into users values(%@);",dic_user];
    [SqliteLib CustomeQuery:query];
    query = [NSString stringWithFormat:@"insert into Movietickets values('%@','%@')",@"Haider",@"0"];
    //NSString *query = [NSString stringWithFormat:@"insert into users values(%@);",dic_user];
    [SqliteLib CustomeQuery:query];
    query = [NSString stringWithFormat:@"insert into Movietickets values('%@','%@')",@"Annabelle",@"0"];
    //NSString *query = [NSString stringWithFormat:@"insert into users values(%@);",dic_user];
    [SqliteLib CustomeQuery:query];
     query = [NSString stringWithFormat:@"select * from MovieTickets"];
     arr_result =[[NSMutableArray alloc]init];
    arr_result =[SqliteLib CustomeQuery:query];
    NSLog(@"array is %@",arr_result);*/
    if([[dic_movie objectForKey:@"Name"]isEqualToString:@"Bang Bang!"]){
        for (mov in arr_result)
        {
            NSLog(@"Entered!");
            if([[mov objectForKey:@"mname"] isEqualToString:@"Bang Bang!"]){
               // count1 = [[[arr_result objectAtIndex:0] valueForKey:@"tickets"]integerValue] + _no_of_tickets;
                count1 = [[mov valueForKey:@"tickets"]integerValue] + _no_of_tickets;
                myNewString = [NSString stringWithFormat:@"%i", count1];
                query = [NSString stringWithFormat:@"update MovieTickets set %@ ='%@' WHERE mname LIKE '%@';", @"tickets",myNewString,@"Bang Bang!"];
                //NSString *query = [NSString stringWithFormat:@"insert into users values(%@);",dic_user];
                NSLog(@"Result:,%@",query);
                [SqliteLib CustomeQuery:query];
            }
        }
        
    }
    else if([[dic_movie objectForKey:@"Name"]isEqualToString:@"Haider "]){
        for (mov in arr_result)
        {
            NSLog(@"Entered!");
            if([[mov objectForKey:@"mname"] isEqualToString:@"Haider"]){
                // count1 = [[[arr_result objectAtIndex:0] valueForKey:@"tickets"]integerValue] + _no_of_tickets;
                count1 = [[mov valueForKey:@"tickets"]integerValue] + _no_of_tickets;
                myNewString = [NSString stringWithFormat:@"%i", count1];
                query = [NSString stringWithFormat:@"update MovieTickets set %@ ='%@' WHERE mname LIKE '%@';", @"tickets",myNewString,@"Haider"];
                //NSString *query = [NSString stringWithFormat:@"insert into users values(%@);",dic_user];
                NSLog(@"Result:,%@",query);
                [SqliteLib CustomeQuery:query];
            }
        }
        
    }
    else if([[dic_movie objectForKey:@"Name"]isEqualToString:@"Annabelle "]){
        for (mov in arr_result)
        {
            NSLog(@"Entered!");
            if([[mov objectForKey:@"mname"] isEqualToString:@"Annabelle"]){
                // count1 = [[[arr_result objectAtIndex:0] valueForKey:@"tickets"]integerValue] + _no_of_tickets;
                count1 = [[mov valueForKey:@"tickets"]integerValue] + _no_of_tickets;
                myNewString = [NSString stringWithFormat:@"%i", count1];
                query = [NSString stringWithFormat:@"update MovieTickets set %@ ='%@' WHERE mname LIKE '%@';", @"tickets",myNewString,@"Annabelle"];
                //NSString *query = [NSString stringWithFormat:@"insert into users values(%@);",dic_user];
                NSLog(@"Result:,%@",query);
                [SqliteLib CustomeQuery:query];
            }
        }
        
    }
    FeedbackViewController *controller = [[FeedbackViewController alloc]initWithNibName:@"FeedbackViewController" bundle:nil];
    myNewString = [NSString stringWithFormat:@"%i", _no_of_tickets];
    [dic_userData setObject:myNewString forKey:@"No of Tickets"];

     query = [NSString stringWithFormat:@"insert into users values('%@','%@','%@','%@')",[dic_userData valueForKey:@"FName"],[dic_userData valueForKey:@"LName"],[dic_userData valueForKey:@"Address"],[dic_userData valueForKey:@"No of Tickets"]];
    //NSString *query = [NSString stringWithFormat:@"insert into users values(%@);",dic_user];
    [SqliteLib CustomeQuery:query];
    
    
    query = [NSString stringWithFormat:@"select * from users"];
    arr_result =[[NSMutableArray alloc]init];
    arr_result =[SqliteLib CustomeQuery:query];
    NSLog(@"array is %@",arr_result);
   
    [self.navigationController pushViewController:controller animated:YES];
}
- (IBAction)ticketsSelect:(id)sender
{
    
    UISegmentedControl *segmentedControl = (UISegmentedControl *) sender;
    //UIColor *newSelectedTintColor = [UIColor colorWithRed: 0/255.0 green:175/255.0 blue:0/255.0 alpha:1.0];
    //[[[segmentedControl subviews] objectAtIndex:1] setTintColor:newSelectedTintColor];
    if(segmentedControl.tag == 0)
    {
        _no_of_tickets = segmentedControl.selectedSegmentIndex+1 ;
        NSLog(@"%i",_no_of_tickets);
    }
    
   // [[arr_users objectAtIndex:0]setObject:myNewString forKey:@"Total tickets" ];
    _total = _price * _no_of_tickets;
    myNewString = [NSString stringWithFormat:@"%i", _total];
    totalPrice.text = [ @"Rs." stringByAppendingString: myNewString];
   }
-(void)setValueforMovie:(NSMutableDictionary *)dic userData:(NSMutableDictionary *)dic_user
{
    dic_movie = dic;
    dic_userData =dic_user;
   // NSLog(@"Users:%@",arr_users);
}
@end
