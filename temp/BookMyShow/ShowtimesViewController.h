//
//  ShowtimesViewController.h
//  BookMyShow
//
//  Created by Swati Goyal on 11/1/14.
//  Copyright (c) 2014 MEDITAB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShowtimesViewController : UIViewController
@property(nonatomic)NSString *str;
@property(nonatomic) NSMutableArray *arr_venue;
@property(nonatomic) NSMutableDictionary *movie;
@property(nonatomic) IBOutlet UILabel *movie_name;
@property(nonatomic) IBOutlet UILabel *venue_name;
@property(nonatomic) IBOutlet UISegmentedControl *seg_time;
@property(nonatomic) IBOutlet UISegmentedControl *segmentedControl;
-(void)setValue:(NSMutableArray *)arr;
-(void)setValueforMovie:(NSMutableDictionary *)dic;
@end
