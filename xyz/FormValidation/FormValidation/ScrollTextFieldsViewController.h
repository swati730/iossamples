//
//  ScrollTextFieldsViewController.h
//  FormValidation
//
//  Created by Swati Goyal on 11/3/14.
//  Copyright (c) 2014 MEDITAB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScrollTextFieldsViewController : UIViewController <UIScrollViewDelegate, UITextFieldDelegate,UITextViewDelegate>
@property(nonatomic)IBOutlet UIScrollView *scrollView;
@property(nonatomic)IBOutlet UIButton *signInButton;
@property(nonatomic)IBOutlet UITextField *field1;
@property(nonatomic)IBOutlet UITextField *field2;
@property(nonatomic)IBOutlet UITextField *field3;
@property(nonatomic)IBOutlet UITextField *field4;
@property(nonatomic)IBOutlet UITextField *field5;
@property(nonatomic)IBOutlet UITextField *field6;
@property(nonatomic)IBOutlet UITextField *field7;
@property(nonatomic)IBOutlet UITextField *field8;
@property(nonatomic)IBOutlet UITextField *field9;
@property(nonatomic)IBOutlet UITextField *field10;

@property(nonatomic) UIView *inputAccView;
@property (nonatomic) IBOutlet UITextField *txtActiveField;
@property (nonatomic, retain) UIButton *btnDone;
@property (nonatomic, retain) UIButton *btnNext;
@property (nonatomic, retain) UIButton *btnPrev;


@end
