//
//  FormViewController.m
//  BookMyShow
//
//  Created by Swati Goyal on 10/20/14.
//  Copyright (c) 2014 MEDITAB. All rights reserved.
//

#import "FormViewController.h"
#import "PickTicketMovieViewController.h"
#import "ReportsViewController.h"
#import "BookMovieViewController.h"
#import "SqliteLib.h"

@interface FormViewController ()

@end

@implementation FormViewController
@synthesize arr_users,dic_user;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
    
}
@synthesize fname,lname,address,firstname,lastname,str_address;
@synthesize controller,reportsController;
@synthesize movie;
@synthesize dic_mov;
@synthesize selectedTime;
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Form";
    self.fname.delegate= self;
    self.lname.delegate= self;
    self.address.delegate= self;
    controller.category= @"Select a category";
    
    dic_user =[[NSMutableDictionary alloc]init];
    arr_users =[[NSMutableArray alloc]init];
    
    
   // controller.categorylabel.text = controller.category;
    reportsController = [[ReportsViewController alloc]initWithNibName:@"ReportsViewController" bundle:nil];
   controller = [[PickTicketMovieViewController alloc]initWithNibName:@"PickTicketMovieViewController" bundle:nil];
   // controller.str_time = @"10:30am";
   // controller.category = @"Premium";
    //NSLog(movie);
    // Do any additional setup after loading the view from its nib.
    /*if([controller.category isEqualToString:@""])
    {
        controller.category = @"Premium";
    }
    if([controller.str_time isEqualToString:@" "]){
        controller.str_time = @"10:30am";
    }*/
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)btn_pickTicket:(id)sender{
    if(fname.text.length==0){
        UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Failed!" message:@"First Name cannot be blank" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:@"Clear", nil] ;
        [av show];
        [fname becomeFirstResponder];
    }
    else {
       // NSDictionary *dic_temp = [[NSDictionary alloc] initWithObjectsAndKeys:@"trial",@"key", nil];
       // [SqliteLib CreateDB:@"Reports" FieldsInTable:dic_temp];
       // [NSString stringWithFormat:@"INSERT OR REPLACE INTO %@ (%@) VALUES (%@);",TableName,query,questioStr];
        firstname= fname.text;
        lastname=lname.text;
        str_address=address.text;
        [dic_user setObject:firstname forKey:@"FName" ];
        [dic_user setObject:lastname forKey:@"LName" ];
        [dic_user setObject:str_address forKey:@"Address" ];
        [arr_users insertObject:dic_user atIndex:0];
        NSLog(@"Dictionary : %@",dic_user);
        
       /* NSString *query = [NSString stringWithFormat:@"insert into users values('%@','%@','%@')",firstname,lastname,str_address];
        //NSString *query = [NSString stringWithFormat:@"insert into users values(%@);",dic_user];
        [SqliteLib CustomeQuery:query];
        

        query = [NSString stringWithFormat:@"select * from users"];
        NSMutableArray *arr_result =[[NSMutableArray alloc]init];
        arr_result =[SqliteLib CustomeQuery:query];
        NSLog(@"array is %@",arr_result);*/
        [reportsController setValue:arr_users];
        [controller setValueforMovie:dic_mov userData:dic_user];
        [self.navigationController pushViewController:controller animated:YES];
    }
    
}

- (IBAction)segmentSwitch:(id)sender
{
    controller.pickticket.enabled = YES;
    controller.btn_pick_seat.enabled = YES;
    UISegmentedControl *segmentedControl = (UISegmentedControl *) sender;
    
    if(segmentedControl.tag == 0)
    {
        
    }
    else if(segmentedControl.tag == 2)
    {
        if(segmentedControl.selectedSegmentIndex == 0)
        {
            controller.category= @"Premium";
            controller.price = 200;        }
        else if(segmentedControl.selectedSegmentIndex == 1)
        {
            controller.category= @"Silver";
            controller.price = 250;
        }
        else
        {
            controller.category= @"Gold";
            controller.price = 300;
        }
        controller.categorylabel.text = controller.category;
        controller.str_price = [NSString stringWithFormat:@"%i", controller.price];
        controller.pricelabel.text = [@"Rs." stringByAppendingString: controller.str_price];
        controller.total = controller.price * controller.no_of_tickets;
        controller.myNewString = [NSString stringWithFormat:@"%i", controller.total];
        //controller.totalPrice.text = controller.myNewString;
        controller.totalPrice.text = [ @"Rs." stringByAppendingString: controller.myNewString];
    }
}

-(void)setValue:(NSMutableDictionary *)dic
{
    dic_mov = dic;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    
    NSString *errorMessage = nil;
    UITextField *errorField;
    if(textField == fname){
        if([fname.text isEqualToString:@""])
        {
            //Valiation for blank name field
            errorMessage = @"Please enter username";
            errorField = fname;
            
        }
        
            //Valida tion for alphabets only
            NSString *myRegex = @"[A-Za-z_]*";
            NSPredicate *myTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", myRegex];
            NSString *string = fname.text;
            if( [myTest evaluateWithObject:string]== NO){
                UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Entry Error" message:@"You can only enter alphabets in name." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:@"Clear", nil] ;
                [av show];
                return NO;
            
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
    return YES;
}

-(BOOL) textFieldShouldReturn: (UITextField *) textField {
    NSLog(@"%@",textField.text) ;
    [textField resignFirstResponder];
    return YES;
}
@end
