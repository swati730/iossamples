//
//  VenueViewController.h
//  BookMyShow
//
//  Created by Swati Goyal on 10/31/14.
//  Copyright (c) 2014 MEDITAB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VenueViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property(nonatomic) NSMutableArray * arr_venues;
@property(nonatomic) NSMutableArray * arr_venue1;
@property(nonatomic) NSMutableArray * arr_venue2;
@property(nonatomic) NSMutableArray * arr_venue3;
@property(nonatomic) NSMutableDictionary *dic_ventimes;
-(void)setValue:(NSMutableDictionary *)dic;
@property (nonatomic,weak) NSMutableDictionary *dic_movie;

@end
