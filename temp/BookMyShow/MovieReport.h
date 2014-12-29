//
//  MovieReport.h
//  BookMyShow
//
//  Created by Swati Goyal on 11/5/14.
//  Copyright (c) 2014 MEDITAB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MovieReport : UIViewController
@property (nonatomic) NSMutableArray *arr_userdata;
@property(nonatomic) IBOutlet UILabel *username;
@property(nonatomic) IBOutlet UILabel *no_of_tickets;
@property(nonatomic) IBOutlet UILabel *moviename;
@property(nonatomic) NSString *name;
@property(nonatomic) NSString *tickets;
@property(nonatomic) IBOutlet UIButton *btn_users;
@property(nonatomic) IBOutlet UIButton *btn_movies;
@property(nonatomic) NSMutableArray *arr_result;

@end
