//
//  FormViewController.h
//  BookMyShow
//
//  Created by Swati Goyal on 10/20/14.
//  Copyright (c) 2014 MEDITAB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PickTicketMovieViewController.h"
#import "ReportsViewController.h"

@interface FormViewController : UIViewController <UITextFieldDelegate>
{
    
   IBOutlet UISegmentedControl *time;
   IBOutlet UISegmentedControl *category;
   IBOutlet UISegmentedControl *gender;
}
@property (nonatomic) NSMutableArray *arr_users;
@property(nonatomic) NSMutableDictionary *dic_user;
@property(nonatomic) IBOutlet UITextField *fname;
@property(nonatomic) IBOutlet UITextField *lname;
@property(nonatomic) IBOutlet UITextField *address;
@property(nonatomic) NSString *firstname;
@property(nonatomic) NSString *lastname;
@property(nonatomic) NSString *str_address;

@property(nonatomic) IBOutlet UILabel *selectedTime;
@property (nonatomic,weak) NSString *movie;
@property (nonatomic,weak) NSMutableDictionary *dic_mov;
@property(nonatomic,strong)PickTicketMovieViewController *controller;
@property(nonatomic,strong) ReportsViewController *reportsController;
-(IBAction)btn_pickTicket:(id)sender;
-(void)setValue:(NSMutableDictionary *)dic;
@end
