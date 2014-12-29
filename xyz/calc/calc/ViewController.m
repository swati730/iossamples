//
//  ViewController.m
//  calc
//
//  Created by Swati Goyal on 10/14/14.
//  Copyright (c) 2014 MEDITAB. All rights reserved.
//

#import "ViewController.h"
#import "CustomButton.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    //CustomButton *button = [[CustomButton alloc] initWithFrame:CGRectMake(100, 100, 75, 30)];
    //[self.view addSubview:button];
    lb = [[UILabel alloc] initWithFrame:CGRectMake(10, 90, 320, 30)];
    lb.textColor = [UIColor whiteColor];
    lb.font = [UIFont fontWithName:@"Helvetica-Bold" size:10];
    lb.backgroundColor = [UIColor blackColor];
    lb.text = @"SWITCH                PASTE                  <              >              CLEAR";
    [self.view addSubview:lb];
    
    input = [[UILabel alloc] initWithFrame:CGRectMake(10, 20,320,70)];
    input.textColor = [UIColor orangeColor];
    input.font = [UIFont fontWithName:@"Helvetica-Bold" size:25];
    input.backgroundColor=[UIColor blackColor];
    input.text=@"";
    [self.view addSubview:input];
    int myInteger=9;
    for(int  y=240; y<=420; y+=60){
        for(int  x=10; x<240; x+=80){
            NSString* myNewString = [NSString stringWithFormat:@"%d", myInteger];
            if(myInteger == 0)
            {
                // [self addButtonWithTitle:myNewString tag:myInteger  row:x column:y width:60 height:30 ];
                CustomButton *button = [[CustomButton alloc ] initWithFrame:CGRectMake(10, 420, 160, 60)];
                [button setTitle:myNewString forState:UIControlStateNormal];
                [button setTag:myInteger];
                [button addTarget:self action:@selector(buttonPressed:)forControlEvents:UIControlEventTouchUpInside];
                [self.view addSubview:button];
                break;
            }else{
                
                CustomButton *button = [[CustomButton alloc ] initWithFrame:CGRectMake(x, y,80, 60)];
                [button setTitle:myNewString forState:UIControlStateNormal];
                [button setTag:myInteger];
                [button addTarget:self action:@selector(buttonPressed:)forControlEvents:UIControlEventTouchUpInside];
                [self.view addSubview:button];
                //[self addButtonWithTitle:myNewString tag:myInteger  row:x column:y width:30 height:30];
                myInteger--;
            }
        }
    }
    CustomButton *plus = [[CustomButton alloc ] initWithFrame:CGRectMake(250, 240, 70, 60)];
    [plus setTitle:@"+" forState:UIControlStateNormal];
    [plus setTag:12];
    [plus addTarget:self action:@selector(buttonPressed:)forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:plus];
    
    CustomButton *minus = [[CustomButton alloc ] initWithFrame:CGRectMake(250, 300, 70, 60)];
    [minus setTitle:@"-" forState:UIControlStateNormal];
    [minus setTag:13];
    [minus addTarget:self action:@selector(buttonPressed:)forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:minus];
	
    CustomButton *mul = [[CustomButton alloc ] initWithFrame:CGRectMake(250, 180, 70, 60)];
    [mul setTitle:@"*" forState:UIControlStateNormal];
    [mul setTag:14];
    [mul addTarget:self action:@selector(buttonPressed:)forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:mul];
    
    
    CustomButton *eql = [[CustomButton alloc ] initWithFrame:CGRectMake(250, 360, 70, 120)];
    [eql setTitle:@"=" forState:UIControlStateNormal];
    [eql setTag:11];
    [eql addTarget:self action:@selector(buttonPressed:)forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:eql];
    
    CustomButton *dec = [[CustomButton alloc ] initWithFrame:CGRectMake(170, 420, 80, 60)];
    [dec setTitle:@"." forState:UIControlStateNormal];
    [dec setTag:10];
    [dec addTarget:self action:@selector(buttonPressed:)forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:dec];
    
    CustomButton *div = [[CustomButton alloc ] initWithFrame:CGRectMake(170, 180, 80, 60)];
    [div setTitle:@"/" forState:UIControlStateNormal];
    [div setTag:15];
    [div addTarget:self action:@selector(buttonPressed:)forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:div];
    
    CustomButton *sqr = [[CustomButton alloc ] initWithFrame:CGRectMake(10, 180, 80, 60)];
    [sqr setTitle:@"sqr" forState:UIControlStateNormal];
    [sqr setTag:17];
    [sqr addTarget:self action:@selector(buttonPressed:)forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:sqr];
    
    
    CustomButton *pow = [[CustomButton alloc ] initWithFrame:CGRectMake(90, 180, 80, 60)];
    [pow setTitle:@"x^n" forState:UIControlStateNormal];
    [pow setTag:16];
    [pow addTarget:self action:@selector(buttonPressed:)forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:pow];
    
    
    
    CustomButton *del = [[CustomButton alloc ] initWithFrame:CGRectMake(250, 120, 70, 60)];
    [del setTitle:@"X" forState:UIControlStateNormal];
    [del setTag:18];
    [del addTarget:self action:@selector(buttonPressed:)forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:del];
    
    CustomButton *bro = [[CustomButton alloc ] initWithFrame:CGRectMake(90, 120, 80, 60)];
    [bro setTitle:@"(" forState:UIControlStateNormal];
    [bro setTag:19];
    [bro addTarget:self action:@selector(buttonPressed:)forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bro];
    
    CustomButton *brc = [[CustomButton alloc ] initWithFrame:CGRectMake(170, 120, 80, 60)];
    [brc setTitle:@")" forState:UIControlStateNormal];
    [brc  setTag:20];
    [brc  addTarget:self action:@selector(buttonPressed:)forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:brc ];
    
    CustomButton *sec = [[CustomButton alloc ] initWithFrame:CGRectMake(10, 120, 80, 60)];
    [sec  setTitle:@"2nd" forState:UIControlStateNormal];
    [sec  setTag:21];
    [sec  addTarget:self action:@selector(buttonPressed:)forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:sec ];    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 - (void)addButtonWithTitle:(NSString *)aTitle tag:(int)tag row:(int)row column:(int)column width:(int)width height:(int)height{
 
 UIButton *button;
 button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
 button.frame = CGRectMake(row, column, width,height);
 [button setTitle:aTitle forState:UIControlStateNormal];
 button.tag = tag;
 button.backgroundColor = [UIColor colorWithRed:(0.1) green:(0.2) blue:(0.3) alpha:(0.4)];
 
 [button addTarget:self action:@selector(buttonPressed:)forControlEvents:UIControlEventTouchUpInside];
 [self.view addSubview:button];
 
 }
 */
-(void)buttonPressed: (id)sender
{
    // NSString* myNewString = [NSString stringWithFormat:@"%d", [sender tag]];
    NSString *lbo=input.text;
    
    NSString *lbn = [NSString stringWithFormat:@"%d", [sender tag]];
    NSString *pr=[lbo stringByAppendingString:lbn];
    input.text = pr;
    if ([sender tag] == 0) {
        NSLog(@"0");
        // do something here
    }
    if ([sender tag] == 1) {
        // Do some think here
        NSLog(@"1");
    }
    if ([sender tag] == 2) {
        // Do some think here
        NSLog(@"2");
    }
    if ([sender tag] == 3) {
        // Do some think here
        NSLog(@"3");
    }
    if ([sender tag] == 4) {
        // Do some think here
        NSLog(@"4");
    }
    if ([sender tag] == 5) {
        // Do some think here
        NSLog(@"5");
    }
    if ([sender tag] == 6) {
        // Do some think here
        NSLog(@"6");
    }
    if ([sender tag] == 7) {
        // Do some think here
        NSLog(@"7");
    }
    if ([sender tag] == 8) {
        // Do some think here
        NSLog(@"8");
    }
    if ([sender tag] == 9) {
        // Do some think here
        NSLog(@"9");
    }
    
}
@end
