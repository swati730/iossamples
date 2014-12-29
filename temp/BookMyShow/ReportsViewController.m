//
//  ReportsViewController.m
//  BookMyShow
//
//  Created by Swati Goyal on 11/3/14.
//  Copyright (c) 2014 MEDITAB. All rights reserved.
//

#import "ReportsViewController.h"
#import "SqliteLib.h"
#import "FormViewController.h"
#import "PickTicketMovieViewController.h"

@interface ReportsViewController ()

@end

@implementation ReportsViewController
@synthesize username,no_of_tickets,moviename;
@synthesize name,tickets;
@synthesize arr_userdata,arr_result;
@synthesize myScrollView;
- (void)viewDidLoad {
    self.title = @"View Reports";
    int y =120;
    [super viewDidLoad];
    [arr_result removeAllObjects];
    username = [[UILabel alloc]initWithFrame:CGRectMake(20, 80, 100, 20)];
    username.text = @"Username";
    username.font=[username.font fontWithSize:15];
    [username setTextAlignment:NSTextAlignmentRight];
    no_of_tickets =[[UILabel alloc]initWithFrame:CGRectMake(150, 80, 180, 20)];
    no_of_tickets.text = @"No of tickets booked";
    no_of_tickets.font=[no_of_tickets.font fontWithSize:15];
    [no_of_tickets setTextAlignment:NSTextAlignmentLeft];
    [self.view addSubview:username];
    [self.view addSubview:no_of_tickets];
    NSString *query = [NSString stringWithFormat:@"select * from users"];
    arr_result =[[NSMutableArray alloc]init];
    arr_result =[SqliteLib CustomeQuery:query];
    NSLog(@"array is %@",arr_result);
    NSDictionary *dic_user = [[NSDictionary alloc]init];
    for(dic_user in arr_result){
        name = [dic_user valueForKey:@"firstname"];
        tickets = [dic_user valueForKey:@"tickets"];
        UILabel *uname = [[UILabel alloc]initWithFrame:CGRectMake(20, y, 100, 20)];
        uname.text = name;
        uname.font=[uname.font fontWithSize:10];
        [uname setTextAlignment:NSTextAlignmentRight];
        
        UILabel  *tkts =[[UILabel alloc]initWithFrame:CGRectMake(150, y, 50, 20)];
        tkts.text = tickets;
        tkts.font=[tkts.font fontWithSize:10];
        [tkts setTextAlignment:NSTextAlignmentLeft];
        NSLog(@"Name: %@",name);
        NSLog(@"Tickets: %@",tickets);
        [self.view addSubview:uname];
        [self.view addSubview:tkts];
        y+=25;
    }
    /*for (UIView * view in self.view.subviews) {
        if(![view isEqual:btn_users]||![view isEqual:btn_movies]){
            [view removeFromSuperview];
        }
    }*/
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)setValue:(NSMutableArray *)arr
{
    arr_userdata =arr;
    //NSLog(@"%@",arr);
}

/*-(IBAction)btn_userDetails:(id)sender{
    btn_users.enabled =NO;
    btn_movies.enabled = YES;
    [self.view setNeedsDisplay];
    
}
-(IBAction)btn_movieDetails:(id)sender{
    btn_movies.enabled = NO;
    btn_users.enabled = YES;
    [self.view setNeedsDisplay];
    [arr_result removeAllObjects];
    moviename = [[UILabel alloc]initWithFrame:CGRectMake(20, 120, 100, 20)];
    moviename.text = @"Movie Name";
    [username setTextAlignment:NSTextAlignmentRight];
    no_of_tickets =[[UILabel alloc]initWithFrame:CGRectMake(150, 120, 180, 20)];
    no_of_tickets.text = @"No of tickets booked";
    [no_of_tickets setTextAlignment:NSTextAlignmentLeft];
    no_of_tickets.font=[no_of_tickets.font fontWithSize:15];
    [self.view addSubview:moviename];
    [self.view addSubview:no_of_tickets];
    NSString *query = [NSString stringWithFormat:@"select * from MovieTickets"];
    arr_result =[[NSMutableArray alloc]init];
    arr_result =[SqliteLib CustomeQuery:query];
    NSLog(@"array is %@",arr_result);
    NSDictionary *dic_movie = [[NSDictionary alloc]init];
    for(dic_movie in arr_result){
        name = [dic_movie valueForKey:@"mname"];
        tickets = [dic_movie valueForKey:@"tickets"];
        UILabel *uname = [[UILabel alloc]initWithFrame:CGRectMake(20, y, 100, 20)];
        uname.text = name;
        [uname setTextAlignment:NSTextAlignmentRight];
        uname.font=[uname.font fontWithSize:10];
        
        UILabel  *tkts =[[UILabel alloc]initWithFrame:CGRectMake(150, y, 50, 20)];
        tkts.text = tickets;
        [tkts setTextAlignment:NSTextAlignmentLeft];
        tkts.font=[tkts.font fontWithSize:10];
        NSLog(@"Name: %@",name);
        NSLog(@"Tickets: %@",tickets);
        [self.view addSubview:uname];
        [self.view addSubview:tkts];
        y+=25;
    }
    
}*/
-(void)addScrollView{
    myScrollView = [[UIScrollView alloc]initWithFrame:
                    CGRectMake(10, 160, 320, 420)];
    myScrollView.accessibilityActivationPoint = CGPointMake(100, 100);
    
    myScrollView.delegate = self;
    [self.view addSubview:myScrollView];
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
