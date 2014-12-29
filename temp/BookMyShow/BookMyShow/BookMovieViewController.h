//
//  BookMovieViewController.h
//  BookMyShow
//
//  Created by Swati Goyal on 10/20/14.
//  Copyright (c) 2014 MEDITAB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BookMovieViewController : UIViewController

@property (nonatomic) IBOutlet UILabel *name1;
@property (nonatomic) IBOutlet UILabel *lang1;

@property (nonatomic) IBOutlet UIImageView *image1;
@property (nonatomic) IBOutlet UILabel *name2;
@property (nonatomic) IBOutlet UILabel *lang2;
@property (nonatomic) IBOutlet UILabel *name3;
@property (nonatomic) IBOutlet UILabel *lang3;
@property(nonatomic) NSMutableArray *arr_movies;
@property(nonatomic) NSMutableDictionary *dic_movie1;
@property(nonatomic) NSMutableDictionary *dic_movie2;
@property(nonatomic) NSMutableDictionary *dic_movie3;
@property(nonatomic) NSMutableDictionary *dic_selectedmovie;

-(IBAction)book_ticket:(id)sender;

@end
