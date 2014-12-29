//
//  BookMovieViewController.m
//  BookMyShow
//
//  Created by Swati Goyal on 10/20/14.
//  Copyright (c) 2014 MEDITAB. All rights reserved.
//

#import "BookMovieViewController.h"
#import "FormViewController.h"


@interface BookMovieViewController ()

@end

@implementation BookMovieViewController
@synthesize arr_movies , dic_movie1,dic_movie2,dic_movie3;
@synthesize dic_selectedmovie;
@synthesize name1, lang1,image1;
@synthesize name2, lang2;
@synthesize name3, lang3;
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
   // arr_movies = [[NSMutableArray alloc]init];
    dic_movie1 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:@"Bang Bang!",@"Name",@"Hindi",@"language",@"bangbang.png",@"image",@"10:00am",@"show timing",@"Silver",@"Category",@"Yes",@"Available",nil];
    dic_movie2 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:@"Haider ",@"Name",@"Hindi",@"language",@"11:00am",@"show timing",@"Gold",@"Category",@"Yes",@"Available",nil];
    dic_movie3 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:@"Annabelle ",@"Name",@"Hindi",@"language",@"1:00pm",@"show timing",@"Platinum",@"Category",@"Yes",@"Available",nil];
    
    arr_movies = [[NSMutableArray alloc]initWithObjects:dic_movie1,dic_movie2,dic_movie3, nil];
    NSLog(@"%@ %@ %@",dic_movie1,dic_movie2,dic_movie3);
    
    /*for (NSMutableDictionary *item in arr_movies) {
       name1.text  = [item valueForKey:@"Name"];
     }*/
    /*for (int i=0 ; i<[arr_movies count] ; i++) {
        
        NSString *mov = [[arr_movies objectAtIndex:i]valueForKey:@"Name"];
        NSLog(@"%@",mov);
        name1.text = mov;
       // name1.text = [dic_mov valueForKey:@"Name"];
    }*/
    
    
    name1.text = [dic_movie1 valueForKey:@"Name"];
    lang1.text = [dic_movie1 valueForKey:@"language"];
    name2.text = [dic_movie2 valueForKey:@"Name"];
    lang2.text = [dic_movie2 valueForKey:@"language"];
    name3.text = [dic_movie3 valueForKey:@"Name"];
    lang3.text = [dic_movie3 valueForKey:@"language"];
    UIImage *img1 = [UIImage imageNamed:[dic_movie1 valueForKey:@"image"]];
    [image1 setImage:img1];
    NSLog(@"%@",name1.text);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)book_ticket:(id)sender{
    FormViewController *controller = [[FormViewController alloc] initWithNibName:@"FormViewController" bundle:nil];
   
    
    if ([sender tag] == 0) {
        controller.movie = @"Bang Bang!";
        //NSLog(@"1st Movie booked");
        dic_selectedmovie = [arr_movies objectAtIndex:0];
        NSLog(@"%@",dic_selectedmovie);
    }
    else if ([sender tag] == 1) {
        controller.movie = @"Haider";
       // NSLog(@"2nd Movie booked");
        dic_selectedmovie = [arr_movies objectAtIndex:1];
        NSLog(@"%@",dic_selectedmovie);
    }
    
    else {
        controller.movie = @"Annabelle";
        //NSLog(@"3rd Movie booked");
        dic_selectedmovie = [arr_movies objectAtIndex:2];
        NSLog(@"%@",dic_selectedmovie);
    }
    
    [self.navigationController pushViewController:controller animated:YES];
    
}
@end
