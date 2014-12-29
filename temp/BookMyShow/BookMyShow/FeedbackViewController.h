//
//  FeedbackViewController.h
//  BookMyShow
//
//  Created by Swati Goyal on 10/21/14.
//  Copyright (c) 2014 MEDITAB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FeedbackViewController : UIViewController<UITextViewDelegate>
{
    IBOutlet UITextView *feedback;
    IBOutlet UILabel *lblPlaceHolderText;
}
@property(nonatomic)NSMutableArray *arr_users;
-(IBAction)btn_showReports:(id)sender;
-(IBAction)btn_movieReports:(id)sender;
-(void)setUsersData:(NSMutableArray *)arr;
@end
