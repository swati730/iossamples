//
//  FormViewController.h
//  BookMyShow
//
//  Created by Swati Goyal on 10/20/14.
//  Copyright (c) 2014 MEDITAB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PickTicketMovieViewController.h"

@interface FormViewController : UIViewController{
   IBOutlet UISegmentedControl *time;
   IBOutlet UISegmentedControl *category;
   IBOutlet UISegmentedControl *gender;
}
-(IBAction)btn_pickTicket:(id)sender;
@property (nonatomic,weak) NSString *movie;
@property(nonatomic,strong)PickTicketMovieViewController *controller;
@end
