//
//  MovieDetailsViewController.m
//  BookMyShow
//
//  Created by Swati Goyal on 10/30/14.
//  Copyright (c) 2014 MEDITAB. All rights reserved.
//

#import "MovieDetailsViewController.h"
#import "VenueViewController.h"

@interface MovieDetailsViewController ()

@end

@implementation MovieDetailsViewController
@synthesize dic_mov;
@synthesize name,language,image1,btn_book;
@synthesize initial_release,run_time,director,music_by,production;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = [dic_mov valueForKey:@"Name"];
    name.text = [dic_mov valueForKey:@"Name"];
    language.text = [dic_mov valueForKey:@"language"];
    image1.image = [UIImage imageNamed:[dic_mov valueForKey:@"image"]];
    initial_release.text = [dic_mov valueForKey:@"Initial release"];
    run_time.text = [dic_mov valueForKey:@"Running time"];
    director.text = [dic_mov valueForKey:@"Director"];
    music_by.text = [dic_mov valueForKey:@"Music composed by"];
    production.text = [dic_mov valueForKey:@"Production company"];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(void)setValue:(NSMutableDictionary *)dic
{
    dic_mov = dic;
}

- (IBAction)btn_book_pressed:(id)sender{
    VenueViewController *controller = [[VenueViewController alloc] initWithNibName:@"VenueViewController" bundle:nil];
    [controller setValue:dic_mov];
    [self.navigationController pushViewController:controller animated:YES];
}
@end
