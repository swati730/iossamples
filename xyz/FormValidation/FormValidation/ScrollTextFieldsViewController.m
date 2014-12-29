//
//  ScrollTextFieldsViewController.m
//  FormValidation
//
//  Created by Swati Goyal on 11/3/14.
//  Copyright (c) 2014 MEDITAB. All rights reserved.
//

#import "ScrollTextFieldsViewController.h"

@interface ScrollTextFieldsViewController ()

@end

@implementation ScrollTextFieldsViewController
@synthesize scrollView;
@synthesize signInButton;
@synthesize field1,field2,field3,field4,field5,field6,field7,field8,field9,field10;
@synthesize inputAccView,btnPrev,btnNext,btnDone,txtActiveField;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Scroll TextFields";
    self.field1.delegate= self;
    self.field2.delegate= self;
    self.field3.delegate= self;
    self.field4.delegate= self;
    self.field5.delegate= self;
    self.field6.delegate= self;
    self.field7.delegate= self;
    self.field8.delegate= self;
    self.field9.delegate= self;
    self.field10.delegate= self;
    self.scrollView.contentSize = CGSizeMake(320, 600);
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)registerForKeyboardNotifications {
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWasShown:)
                                                 name:UIKeyboardDidShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillBeHidden:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
    
}

- (void)deregisterFromKeyboardNotifications {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardDidHideNotification
                                                  object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillHideNotification
                                                  object:nil];
    
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    [self registerForKeyboardNotifications];
    
}

- (void)viewWillDisappear:(BOOL)animated {
    
    [self deregisterFromKeyboardNotifications];
    
    [super viewWillDisappear:animated];
    
}
-(void)keyboardWasShown:(NSNotification *)notification {
    
   /* NSDictionary* info = [notification userInfo];
    
    CGSize keyboardSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    CGPoint buttonOrigin = self.signInButton.frame.origin;
    
    CGFloat buttonHeight = self.signInButton.frame.size.height;
    
    CGRect visibleRect = self.view.frame;
    
    visibleRect.size.height -= keyboardSize.height;
    
    if (!CGRectContainsPoint(visibleRect, buttonOrigin)){
        
        CGPoint scrollPoint = CGPointMake(0.0, buttonOrigin.y - visibleRect.size.height + buttonHeight);
        
        [self.scrollView setContentOffset:scrollPoint animated:YES];
        
    }*/
    
}
- (void)textFieldDidEndEditing:(UITextField *)textField {
    CGPoint scrollPoint = CGPointMake(0, textField.frame.origin.y);
    [self.scrollView setContentOffset:scrollPoint animated:YES];
}
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    [self createInputAccessoryView];
    [textField setInputAccessoryView:inputAccView];
    txtActiveField = textField;
    CGPoint scrollPoint = CGPointMake(0, txtActiveField.frame.origin.y);
    [self.scrollView setContentOffset:scrollPoint animated:YES];
}


- (void)keyboardWillBeHidden:(NSNotification *)notification {
    
    [self.scrollView setContentOffset:CGPointZero animated:YES];
}
-(BOOL) textFieldShouldReturn: (UITextField *) textField {
    [textField resignFirstResponder];
    return YES;
}
-(void)createInputAccessoryView{
    
    inputAccView = [[UIView alloc] initWithFrame:CGRectMake(10.0, 0.0, 310.0, 40.0)];
    
    // Set the view’s background color.
    [inputAccView setBackgroundColor:[UIColor lightGrayColor]];
    [inputAccView setAlpha: 0.8];
    btnPrev = [UIButton buttonWithType: UIButtonTypeCustom];
    [btnPrev setFrame: CGRectMake(0.0, 0.0, 80.0, 40.0)];
    [btnPrev setBackgroundColor:[UIColor grayColor]];
    [btnPrev setTitle: @"Previous" forState: UIControlStateNormal];
    
    [btnPrev addTarget: self action: @selector(gotoPrevTextfield) forControlEvents: UIControlEventTouchUpInside];
    
    btnNext = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnNext setFrame:CGRectMake(85.0f, 0.0f, 80.0f, 40.0f)];
    [btnNext setTitle:@"Next" forState:UIControlStateNormal];
    [btnNext setBackgroundColor:[UIColor grayColor]];
    [btnNext addTarget:self action:@selector(gotoNextTextfield) forControlEvents:UIControlEventTouchUpInside];
    
    btnDone = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnDone setFrame:CGRectMake(240.0, 0.0f, 80.0f, 40.0f)];
    [btnDone setTitle:@"Done" forState:UIControlStateNormal];
    [btnDone setBackgroundColor:[UIColor grayColor]];
    [btnDone setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btnDone addTarget:self action:@selector(doneTyping) forControlEvents:UIControlEventTouchUpInside];
    
    [inputAccView addSubview:btnPrev];
    [inputAccView addSubview:btnNext];
    [inputAccView addSubview:btnDone];
}
-(void)gotoPrevTextfield{
    
    if (txtActiveField == field1) {
        return;
    }
    else if (txtActiveField == field2) {
        [field1 becomeFirstResponder];
    }
    else if (txtActiveField == field3) {
        [field2 becomeFirstResponder];
    }
    else if (txtActiveField == field4) {
        [field3 becomeFirstResponder];
    }
    else if (txtActiveField == field5) {
        [field4 becomeFirstResponder];
    }
    else if (txtActiveField == field6) {
        [field5 becomeFirstResponder];
    }
    else if (txtActiveField == field7) {
        [field6 becomeFirstResponder];
    }
    else if (txtActiveField == field8) {
        [field7 becomeFirstResponder];
    }
    else if (txtActiveField == field9) {
        [field8 becomeFirstResponder];
    }
    
    else {
        [field9 becomeFirstResponder];
    }
    CGPoint scrollPoint = CGPointMake(0, txtActiveField.frame.origin.y);
    [self.scrollView setContentOffset:scrollPoint animated:YES];
}

-(void)gotoNextTextfield{
    if (txtActiveField == field10) {
        return;
    }
    else if (txtActiveField == field9) {
        [field10 becomeFirstResponder];
    }
    else if (txtActiveField == field8) {
        [field9 becomeFirstResponder];
    }
    else if (txtActiveField == field7) {
        [field8 becomeFirstResponder];
    }else if (txtActiveField == field6) {
        [field7 becomeFirstResponder];
    }
    else if (txtActiveField == field5) {
        [field6 becomeFirstResponder];
    }else if (txtActiveField == field4) {
        [field5 becomeFirstResponder];
    }else if (txtActiveField == field3) {
        [field4 becomeFirstResponder];
    }else if (txtActiveField == field2) {
        [field3 becomeFirstResponder];
    }
    else {
        [field2 becomeFirstResponder];
    }
}

-(void)doneTyping{
    [txtActiveField resignFirstResponder];
}


/*- (BOOL)textFieldShouldReturn:(UITextField *)textField
 {
 
 
 NSInteger nextTag = textField.tag + 1;
 // Try to find next responder
 UIResponder *nextResponder = [textField.superview viewWithTag:nextTag];
 
 if (nextResponder) {
 [scrollview setContentOffset:CGPointMake(0,textField.center.y-60) animated:YES];
 // Found next responder, so set it.
 [nextResponder becomeFirstResponder];
 } else {
 [scrollview setContentOffset:CGPointMake(0,0) animated:YES];
 [textField resignFirstResponder];
 return YES;
 }
 
 return NO;
 }
 
 */
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
