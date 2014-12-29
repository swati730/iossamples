//
//  VenueViewController.m
//  BookMyShow
//
//  Created by Swati Goyal on 10/31/14.
//  Copyright (c) 2014 MEDITAB. All rights reserved.
//

#import "VenueViewController.h"
#import "PickVenueTableViewCell.h"
#import "ShowtimesViewController.h"

@interface VenueViewController ()

@end

@implementation VenueViewController
@synthesize arr_venues,arr_venue1,arr_venue2,arr_venue3, dic_movie;
@synthesize dic_ventimes;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Pick a Venue";
  //  arr_venues = [[NSMutableArray alloc] initWithObjects:@"City Gold: Ashram Road",@"CineMax: Shiv, Ashram Road",@"Big Cinemas: Himalaya Mall", nil];
    arr_venue1 = [[NSMutableArray alloc] initWithObjects:@"CineMax: Shiv, Ashram Road",@"5:30PM",@"7:30PM",@"8:30PM",@"9:30PM", nil];
    arr_venue2 = [[NSMutableArray alloc] initWithObjects:@"City Gold: Ashram Road",@"6:30PM",@"9:30PM",@"10:30PM",@"11:30PM", nil];
    arr_venue3 = [[NSMutableArray alloc] initWithObjects:@"Big Cinemas: Himalaya Mall",@"4:30PM",@"5:30PM",@"8:30PM",@"10:30PM", nil];
    dic_ventimes = [[NSMutableDictionary alloc]initWithObjectsAndKeys:arr_venue1,@"0",arr_venue2,@"1",arr_venue3,@"2", nil ];
    NSLog(@"%@",dic_movie);
    
   // NSLog(@"%@",[dic_movie valueForKey:@"show timing"]);
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableCell";
    
    PickVenueTableViewCell *cell = (PickVenueTableViewCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"PickVenueTableViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    NSString* myNewString = [NSString stringWithFormat:@"%i", indexPath.row];
    //cell.venue.text = [arr_venues objectAtIndex:indexPath.row];
    NSMutableArray *result = [[NSMutableArray alloc]init];
    for (NSString* obj in [dic_ventimes valueForKey:myNewString])
    {
        if([[dic_movie valueForKey:@"show timing"] containsObject:obj])
            [result addObject:obj];
    }
    NSLog(@"%@",result);
    NSMutableArray *arr =[[NSMutableArray alloc]init];
    arr =[NSMutableArray arrayWithObjects:@" ",@" ",@" ",@" ",nil];
    for (int i=0; i<result.count; i++) {
        arr[i] = [result objectAtIndex:i];
    }
    cell.venue.text = [[dic_ventimes valueForKey:myNewString] objectAtIndex:0 ];
    cell.time1.text = arr[0];
    cell.time2.text = arr[1];
    cell.time3.text = arr[2];
    cell.time4.text = arr[3];
   /*  if ([result objectAtIndex:1]) {
        cell.time2.text = [result objectAtIndex:1 ];
    }
    else if ([result objectAtIndex:2]) {
        cell.time3.text = [result objectAtIndex:2 ];
    }
    else if ([result objectAtIndex:3]) {
        cell.time4.text = [result objectAtIndex:4 ];
    }*/
    
    //cell.time2.text = [[dic_ventimes valueForKey:myNewString] objectAtIndex:2 ];
   // cell.time3.text = [[dic_ventimes valueForKey:myNewString] objectAtIndex:3 ];
   // cell.time4.text = [[dic_ventimes valueForKey:myNewString] objectAtIndex:4 ];
   /*    cell.btn_book.tag = indexPath.row;
    [cell.btn_book addTarget:self action:@selector(book_movie:) forControlEvents:UIControlEventTouchUpInside];*/
    
    return cell;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90;
}
-(IBAction)book_movie:(id)sender{
}
-(void)setValue:(NSMutableDictionary *)dic
{
    dic_movie = dic;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    NSString* myNewString = [NSString stringWithFormat:@"%i", indexPath.row];
    ShowtimesViewController *controller = [[ShowtimesViewController alloc] initWithNibName:@"ShowtimesViewController" bundle:nil];
    [controller setValue:[dic_ventimes valueForKey:myNewString]];
    [controller setValueforMovie:dic_movie];
    [self.navigationController pushViewController:controller animated:YES];
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
