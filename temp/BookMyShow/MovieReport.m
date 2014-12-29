//
//  MovieReport.m
//  BookMyShow
//
//  Created by Swati Goyal on 11/5/14.
//  Copyright (c) 2014 MEDITAB. All rights reserved.
//

#import "MovieReport.h"
#import "SqliteLib.h"

@interface MovieReport ()

@end

@implementation MovieReport
@synthesize username,no_of_tickets,moviename;
@synthesize name,tickets;
@synthesize arr_userdata,arr_result;
@synthesize btn_movies,btn_users;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"View Movie Reports";
    int y=190;
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
    // Do any additional setup after loading the view from its nib.
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
