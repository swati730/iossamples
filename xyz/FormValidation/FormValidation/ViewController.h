//
//  ViewController.h
//  FormValidation
//
//  Created by Swati Goyal on 11/1/14.
//  Copyright (c) 2014 MEDITAB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate, UITextViewDelegate>
@property(nonatomic, weak) IBOutlet UITextField *name;
@property (nonatomic) IBOutlet UITextField *field2;
@property (nonatomic) IBOutlet UITextField *txtActiveField;
@property (nonatomic) IBOutlet UITextField *field3;
@property (nonatomic)  IBOutlet UITextField *field4;
@property(nonatomic,weak) IBOutlet UITextField *field5;
@property(nonatomic,weak) IBOutlet UITextView *errs;
@property(nonatomic) UIView *inputAccView;
@property (nonatomic, retain) UIButton *btnDone;
@property (nonatomic, retain) UIButton *btnNext;
@property (nonatomic, retain) UIButton *btnPrev;

-(IBAction)formvalidate:(id)sender;
-(IBAction)btn_next:(id)sender;
@end

