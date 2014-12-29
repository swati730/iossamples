//
//  ShowtimesViewController.m
//  BookMyShow
//
//  Created by Swati Goyal on 11/1/14.
//  Copyright (c) 2014 MEDITAB. All rights reserved.
//

#import "ShowtimesViewController.h"
#import "FormViewController.h"

@interface ShowtimesViewController ()

@end

@implementation ShowtimesViewController
@synthesize arr_venue,movie,str;
@synthesize seg_time;
@synthesize movie_name, venue_name;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Show Times";
    NSLog(@"%@",arr_venue);
    NSLog(@"%@",movie);
    NSMutableArray *result = [[NSMutableArray alloc]init];
    for (NSString* obj in arr_venue)
    {
        if([[movie valueForKey:@"show timing"] containsObject:obj])
            [result addObject:obj];
    }
    NSLog(@"%@",result);
    movie_name.text = [movie valueForKey:@"Name"];
    venue_name.text = [arr_venue objectAtIndex:0];
    seg_time = [[UISegmentedControl alloc] initWithItems:result];
    seg_time.frame = CGRectMake(35, 200, 250, 50);
   
    [seg_time addTarget:self action:@selector(segmentSwitch:) forControlEvents: UIControlEventValueChanged];
    seg_time.selectedSegmentIndex = 1;
    [self.view addSubview:seg_time];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)setValue:(NSMutableArray *)arr
{
    arr_venue = arr;
}
-(void)setValueforMovie:(NSMutableDictionary *)dic{
    movie = dic;
}


- (IBAction)segmentSwitch:(id)sender
{
    
    UISegmentedControl *segmentedControl = (UISegmentedControl *) sender;
    FormViewController *controller = [[FormViewController alloc] initWithNibName:@"FormViewController" bundle:nil];
    
    str = [segmentedControl titleForSegmentAtIndex:segmentedControl.selectedSegmentIndex];
    controller.selectedTime.text = (NSString *)str;
    NSLog(@"%i",segmentedControl.selectedSegmentIndex);
    NSLog(@"%@",[segmentedControl titleForSegmentAtIndex:segmentedControl.selectedSegmentIndex]);
    NSLog(@"%@", str);
    NSLog(@"%@",controller.selectedTime.text );
    [controller setValue:movie];
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
