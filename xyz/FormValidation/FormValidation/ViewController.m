//
//  ViewController.m
//  FormValidation
//
//  Created by Swati Goyal on 11/1/14.
//  Copyright (c) 2014 MEDITAB. All rights reserved.
//

#import "ViewController.h"
#import "ScrollDemoViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize name, field2, field3, field4,field5,txtActiveField,errs,inputAccView;
@synthesize btnDone,btnNext,btnPrev;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.name.delegate= self;
    self.field2.delegate=self;
    self.field3.delegate=self;
    self.field4.delegate=self;
    self.field5.delegate=self;
    self.errs.delegate=self;
    errs.editable = NO;
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)textFieldDidBeginEditing:(UITextField *)textField{
    // Call the createInputAccessoryView method we created earlier.
    // By doing that we will prepare the inputAccView.
    [self createInputAccessoryView];
    
    // Now add the view as an input accessory view to the selected textfield.
    [textField setInputAccessoryView:inputAccView];
    
    // Set the active field. We' ll need that if we want to move properly
    // between our textfields.
    txtActiveField = textField;
}
-(BOOL) textFieldShouldReturn: (UITextField *) textField {
    [textField resignFirstResponder];
    return YES;
}
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    
    NSString *errorMessage = nil;
    UITextField *errorField;
    if(textField == name){
        if([name.text isEqualToString:@""])
        {
            //Valiation for blank name field
            errorMessage = @"Please enter username";
            errorField = name;
        
        }
        else{
            //Valida tion for alphabets only
            NSString *myRegex = @"[A-Za-z_]*";
            NSPredicate *myTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", myRegex];
            NSString *string = name.text;
            if( [myTest evaluateWithObject:string]== NO){
            UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Entry Error" message:@"You can only enter alphabets in name." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:@"Clear", nil] ;
            [av show];
            return NO;
        }
        }
        if (errorMessage) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Failed!" message:errorMessage delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
            [errorField becomeFirstResponder];
            return NO;
        }else{
            return YES;
        }
    }
    
    else if (textField == field3) {
        //Validation for alphabets only
        NSString *myRegex = @"[A-Za-z_]*";
        NSPredicate *myTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", myRegex];
        NSString *string = field3.text;
        if( [myTest evaluateWithObject:string]== NO){
            UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Entry Error" message:@"You can only enter alphabets in name." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:@"Clear", nil] ;
            [av show];
            return NO;
        }
        
    }
    else if (textField == field2) {
        // Validation for length till 10
        if (field2.text.length > 10) {
            UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Entry Error" message:@"You must not enter more than 10 characters." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:@"Clear", nil] ;
            [av show];
            return NO;
        }
        
    }
     else if (textField == field5) {
         //field5.autocapitalizationType = UITextAutocapitalizationTypeNone;
         field5.text = [field5.text uppercaseString];
     }
    
    return YES;
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
 //allow only special characters
    if (textField == field4) {
        NSCharacterSet *set = [NSCharacterSet alphanumericCharacterSet];
        
        if ([string rangeOfCharacterFromSet:set].location != NSNotFound) {
            UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Entry Error" message:@"Only special characters allowed." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:@"Clear", nil] ;
            [av show];
            return NO;
        }
        
    }
    return YES;
    }

- (void)textFieldDidEndEditing:(UITextField *)textField {
    
    switch (textField.tag) {
        case 0:
            
            // do something with this text field
            break;
        case 1:
            
            // do something with this text field
            break;
            // remainder of switch statement....
    }
}
-(IBAction)formvalidate:(id)sender{
   
    UIAlertView *ErrorAlert = [[UIAlertView alloc] initWithTitle:@""
                                                         message:@"Fields are mandatory." delegate:nil
                                               cancelButtonTitle:@"OK"
                                               otherButtonTitles:nil, nil];
    
        if(self.name == nil || [self.name.text isEqualToString:@""])
        {
            [ErrorAlert show];
            [name becomeFirstResponder];
        }
        
        if(self.field2 == nil || [self.field2.text isEqualToString:@""])
        {
            [ErrorAlert show];
            [field2 becomeFirstResponder];
        }
    
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
    if (txtActiveField == name) {
        return;
    }
    else if (txtActiveField == field2) {
        [name becomeFirstResponder];
    }
    else if (txtActiveField == field3) {
        [field2 becomeFirstResponder];
    }
    else if (txtActiveField == field3) {
        [field2 becomeFirstResponder];
    }
    else if (txtActiveField == field4) {
        [field3 becomeFirstResponder];
    }
    else {
        [field4 becomeFirstResponder];
    }
}

-(void)gotoNextTextfield{
    if (txtActiveField == field5) {
        return;
    }
    else if (txtActiveField == field4) {
        [field5 becomeFirstResponder];
    }
    else if (txtActiveField == field3) {
        [field4 becomeFirstResponder];
    }
    else if (txtActiveField == field2) {
        [field3 becomeFirstResponder];
    }
    else {
        [field2 becomeFirstResponder];
    }
}

-(void)doneTyping{
    [txtActiveField resignFirstResponder];
}


-(IBAction)btn_next:(id)sender{
    ScrollDemoViewController *controller = [[ScrollDemoViewController alloc]initWithNibName:@"ScrollDemoViewController" bundle:nil];
    [self.navigationController pushViewController:controller animated:YES];

}
@end
