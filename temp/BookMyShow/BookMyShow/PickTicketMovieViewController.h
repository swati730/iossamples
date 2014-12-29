//
//  PickTicketMovieViewController.h
//  BookMyShow
//
//  Created by Swati Goyal on 10/20/14.
//  Copyright (c) 2014 MEDITAB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PickTicketMovieViewController : UIViewController
{
   
}

@property (nonatomic) int count1;
@property (nonatomic) int count2;
@property (nonatomic) int count3;

@property (nonatomic) IBOutlet UISegmentedControl *pickticket;
@property (nonatomic) IBOutlet UIButton *btn_pick_seat;
@property(nonatomic) IBOutlet UILabel *categorylabel;
@property(nonatomic) IBOutlet UILabel *pricelabel;
@property(nonatomic,weak) IBOutlet UILabel *movie;
@property(nonatomic) NSString *category;
@property(nonatomic) NSString *str_price;
@property(nonatomic)IBOutlet UILabel *time;
@property(nonatomic) IBOutlet UILabel *totalPrice;


@property (nonatomic, strong) NSString * str_movieName;
@property (nonatomic,strong) NSString *str_time;
@property (nonatomic) int price;
@property (nonatomic) int total;
@property (nonatomic) int no_of_tickets;
@property (nonatomic)  NSString* myNewString;
@property (nonatomic) NSMutableDictionary *dic_movie;
@property (nonatomic) NSMutableDictionary *dic_userData;
-(IBAction)submit:(id)sender;
-(void)setValueforMovie:(NSMutableDictionary *)dic userData:(NSMutableDictionary *)dic_user;
@end
