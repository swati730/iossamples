//
//  ChooseMovieViewController.m
//  BookMyShow
//
//  Created by Swati Goyal on 10/30/14.
//  Copyright (c) 2014 MEDITAB. All rights reserved.
//

#import "ChooseMovieViewController.h"
#import "BookMovieTableViewCell.h"
#import "MovieDetailsViewController.h"

@interface ChooseMovieViewController ()

@end

@implementation ChooseMovieViewController
@synthesize arr_movies , dic_movie1,dic_movie2,dic_movie3,dic_movie4,dic_movie5;
@synthesize dic_selectedmovie;
@synthesize arr_showtimings1,arr_showtimings2,arr_showtimings3;

- (void)viewDidLoad {
    [super viewDidLoad];
      self.title = @"MOVIES";
    arr_showtimings1 = [[NSMutableArray alloc ] initWithObjects:@"5:30PM",@"6:30PM",@"7:00PM",@"7:30PM",@"8:30PM",@"9:30PM",@"10:30PM" ,nil];
    arr_showtimings2 = [[NSMutableArray alloc ] initWithObjects:@"5:30PM",@"6:30PM",@"9:30PM",@"10:30PM",@"11:30PM",nil];
    arr_showtimings3 = [[NSMutableArray alloc ] initWithObjects:@"6:30PM",@"7:00PM",@"7:30PM",@"6:30PM",@"8:30PM",@"9:30PM",@"10:30" ,nil];
    dic_movie1 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:@"Bang Bang!",@"Name",@"Hindi",@"language",@"bangbang.png",@"image",arr_showtimings1,@"show timing",@"Silver",@"Category",@"Yes",@"Available",@"September 26, 2014",@"Initial release",@"Siddharth Anand",@"Director",@"154 minutes",@"Running time",@"Vishal-Shekhar",@"Music composed by",@"Fox Star Studios",@"Production company",@"0",@"no_of_tickets",nil];
    dic_movie2 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:@"Haider ",@"Name",@"Hindi",@"language",@"haider.jpeg",@"image",arr_showtimings2,@"show timing",@"Gold",@"Category",@"Yes",@"Available",@"October 2, 201",@"Initial release",@"Vishal Bhardwaj",@"Director",@"162 minutes",@"Running time",@"Vishal Bhardwaj",@"Music composed by",@"Fox Star Studios",@"Production company",@"0",@"no_of_tickets",nil];
    dic_movie3 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:@"Annabelle ",@"Name",@"Hindi",@"language",@"annabelle.jpg",@"image",arr_showtimings3,@"show timing",@"Platinum",@"Category",@"Yes",@"Available",@"September 29, 2014",@"Initial release",@"John R. Leonetti",@"Director",@"99 minutes",@"Running time",@" ",@"Music composed by",@"Peter Safran, James Wan, Tony DeRosa-Grund",@"Production company",@"0",@"no_of_tickets",nil];
    
    arr_movies = [[NSMutableArray alloc]initWithObjects:dic_movie1,dic_movie2,dic_movie3, nil];
    // Do any additional setup after loading the view.    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableCell";
    
    BookMovieTableViewCell *cell = (BookMovieTableViewCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"BookMovieTableViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    cell.name.text = [[arr_movies objectAtIndex:indexPath.row]valueForKey:@"Name"];
    NSLog(@"%@",[[arr_movies objectAtIndex:0]valueForKey:@"Name"]);
    NSLog(@"%@",cell.name.text);
    cell.image1.image = [UIImage imageNamed:[[arr_movies objectAtIndex:indexPath.row]valueForKey:@"image"]];
    cell.language.text = [[arr_movies objectAtIndex:indexPath.row]valueForKey:@"language"];
    cell.btn_book.tag = indexPath.row;
    [cell.btn_book addTarget:self action:@selector(book_movie:) forControlEvents:UIControlEventTouchUpInside];
    
    return cell;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 165;
}
-(IBAction)book_movie:(id)sender{
    
    MovieDetailsViewController *controller = [[MovieDetailsViewController alloc] initWithNibName:@"MovieDetailsViewController" bundle:nil];
    
    
    if ([sender tag] == 0) {
        dic_selectedmovie = [arr_movies objectAtIndex:0];
        NSLog(@"%@",dic_selectedmovie);
        NSLog(@"Button Pressed %ld",(long)[sender tag]);
    }
    else if ([sender tag] == 1) {
        dic_selectedmovie = [arr_movies objectAtIndex:1];
        NSLog(@"%@",dic_selectedmovie);
       }
    
    else if ([sender tag] == 2){
        dic_selectedmovie = [arr_movies objectAtIndex:2];
        NSLog(@"%@",dic_selectedmovie);
    }
   [controller setValue:dic_selectedmovie];
   [self.navigationController pushViewController:controller animated:YES];
    
}
- (IBAction)btn_addmovie:(id)sender{
dic_movie4 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:@"Happy New Year ",@"Name",@"Hindi",@"language",@"HappyNewYear.jpg",@"image",arr_showtimings2,@"show timing",@"Gold",@"Category",@"Yes",@"Available",@"October 24, 2014",@"Initial release",@"Farah Khan",@"Director",@"184 minutes",@"Running time",@"John Stewart",@"Music composed by",@"Gauri Khan Co.",@"Production company",@"0",@"no_of_tickets",nil];
    [arr_movies insertObject:dic_movie4 atIndex:0];
    NSLog(@"%@",arr_movies);
    [self.tableview reloadData];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
