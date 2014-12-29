//
//  FeedbackViewController.m
//  BookMyShow
//
//  Created by Swati Goyal on 10/21/14.
//  Copyright (c) 2014 MEDITAB. All rights reserved.
//

#import "FeedbackViewController.h"
#import "ReportsViewController.h"
#import "MovieReport.h"

@interface FeedbackViewController ()

@end

@implementation FeedbackViewController
@synthesize arr_users;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Feedback";
    [feedback setDelegate:self];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    
    if([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    
    return YES;
}
- (void)textViewDidChange:(UITextView *)textView {
    // Enable and disable lblPlaceHolderText
    if ([textView.text length] > 0) {
        [lblPlaceHolderText setHidden:YES];
    } else {
        [lblPlaceHolderText setHidden:NO];
    }
}
-(IBAction)btn_showReports:(id)sender{
    ReportsViewController *controller = [[ReportsViewController alloc] initWithNibName:@"ReportsViewController" bundle:nil];
    [controller setValue:arr_users];
    [self.navigationController pushViewController:controller animated:YES];
}
-(IBAction)btn_movieReports:(id)sender{
    MovieReport *controller = [[MovieReport alloc] initWithNibName:@"MovieReport" bundle:nil];
    //[controller setValue:arr_users];
    [self.navigationController pushViewController:controller animated:YES];
}
-(void)setUsersData:(NSMutableArray *)arr{
    arr_users = arr;
    NSLog(@"Users:%@",arr_users);
}
@end
