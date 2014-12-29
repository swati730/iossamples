//
//  PlacesSecondViewController.m
//  AhmedabadTimes
//
//  Created by Swati Goyal on 10/16/14.
//  Copyright (c) 2014 MEDITAB. All rights reserved.
//

#import "PlacesSecondViewController.h"
#import "res2ViewController.h"

@interface PlacesSecondViewController ()

@end

@implementation PlacesSecondViewController

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
-(IBAction)pool:(id)sender{
    res2ViewController *controller = [[res2ViewController alloc] initWithNibName:@"res2ViewController" bundle:nil];
    [self.navigationController pushViewController:controller animated:YES];
    txt = [[UITextView alloc] initWithFrame:CGRectMake(10, 90, 300, 200)];
    txt.font = [UIFont fontWithName:@"Helvetica-Bold" size:10];
    txt.backgroundColor = [UIColor colorWithRed:(0.5) green:(0.8) blue:(1.8) alpha:(0.5)];
    txt.text = @"Barbeque Nation   Barbeque Nation presents 'Pat Chapman Grills The World' festival. Come October, Barbeque Nation will present the British celebrity Chef who has earned the moniker of Curry King, the man responsible for Balti-isation ";
    [controller.view addSubview:txt];

}
-(IBAction)rom:(id)sender{
    
    res2ViewController *controller = [[res2ViewController alloc] initWithNibName:@"res2ViewController" bundle:nil];
    [self.navigationController pushViewController:controller animated:YES];
    txt = [[UITextView alloc] initWithFrame:CGRectMake(10, 90, 320, 200)];
    txt.font = [UIFont fontWithName:@"Helvetica-Bold" size:10];
    txt.backgroundColor = [UIColor colorWithRed:(1.5) green:(0.2) blue:(0.8) alpha:(0.3)];
    txt.text = @"La Bella    Located in one of the narrow by-lanes in the older part of the city, this place is absolutely pristine and the only one I know of, in Ahmedabad that dishes up authentic Goan delicacies at incredibly low rates. ";
    [controller.view addSubview:txt];
}
-(IBAction)roof:(id)sender{
    res2ViewController *controller = [[res2ViewController alloc] initWithNibName:@"res2ViewController" bundle:nil];
    [self.navigationController pushViewController:controller animated:YES];
    txt = [[UITextView alloc] initWithFrame:CGRectMake(10, 90, 320, 200)];
    txt.font = [UIFont fontWithName:@"Helvetica-Bold" size:10];
    txt.backgroundColor = [UIColor colorWithRed:(0.6) green:(0.6) blue:(0.8) alpha:(0.3)];
    txt.text = @"hotel Paramount  Well, when it was coming to non.vegetarian food, we had only 2-3 options available in the city. We have seen that time when Hotel Paramount was one kind of synonym for the non.veg.food. Sadly and very disappointingly, it has lost its charm over the time. ";
    [controller.view addSubview:txt];
}
-(IBAction)dish:(id)sender{
    res2ViewController *controller = [[res2ViewController alloc] initWithNibName:@"res2ViewController" bundle:nil];
    [self.navigationController pushViewController:controller animated:YES];
    txt = [[UITextView alloc] initWithFrame:CGRectMake(10, 90, 320, 200)];
    txt.font = [UIFont fontWithName:@"Helvetica-Bold" size:10];
    txt.backgroundColor = [UIColor colorWithRed:(1.7) green:(0.2) blue:(1.8) alpha:(0.2)];
    txt.text = @"650 - The Global Kitchen Just opened at the time of research, 650 is situated among beautiful gardens and ponds in the corner of Shreekunj Mandapam, one of Ahmedabad’s well-known party venues. ";
    [controller.view addSubview:txt];
}
-(IBAction)pan:(id)sender{
    res2ViewController *controller = [[res2ViewController alloc] initWithNibName:@"res2ViewController" bundle:nil];
    [self.navigationController pushViewController:controller animated:YES];
    txt = [[UITextView alloc] initWithFrame:CGRectMake(10, 90, 320, 200)];
    txt.font = [UIFont fontWithName:@"Helvetica-Bold" size:10];
    txt.backgroundColor = [UIColor colorWithRed:(1.0) green:(0.2) blue:(0.4) alpha:(0.5)];
    txt.text = @"650 - The Global Kitchen just opened at the time of research, 650 is situated among beautiful gardens and ponds in the corner of Shreekunj Mandapam, one of Ahmedabad’s well-known party venues. ";
    [controller.view addSubview:txt];
}
@end
