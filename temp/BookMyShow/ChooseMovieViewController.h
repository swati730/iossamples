//
//  ChooseMovieViewController.h
//  BookMyShow
//
//  Created by Swati Goyal on 10/30/14.
//  Copyright (c) 2014 MEDITAB. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ChooseMovieViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property(nonatomic) NSMutableArray *arr_movies;
@property(nonatomic) NSMutableDictionary *dic_movie1;
@property(nonatomic) NSMutableDictionary *dic_movie2;
@property(nonatomic) NSMutableDictionary *dic_movie3, *dic_movie4, *dic_movie5;
@property(nonatomic) NSMutableDictionary *dic_selectedmovie;
@property(nonatomic) NSMutableArray *arr_showtimings1;
@property(nonatomic) NSMutableArray *arr_showtimings2;
@property(nonatomic) NSMutableArray *arr_showtimings3;
@property(nonatomic) IBOutlet UITableView *tableview;

- (IBAction)book_movie:(id)sender;
- (IBAction)btn_addmovie:(id)sender;
@end
