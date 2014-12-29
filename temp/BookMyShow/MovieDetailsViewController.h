//
//  MovieDetailsViewController.h
//  BookMyShow
//
//  Created by Swati Goyal on 10/30/14.
//  Copyright (c) 2014 MEDITAB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MovieDetailsViewController : UIViewController
@property (nonatomic,weak) NSMutableDictionary *dic_mov;
@property (nonatomic) IBOutlet UILabel *name;
@property (nonatomic) IBOutlet UILabel *language;
@property (nonatomic) IBOutlet UIImageView *image1;
@property (nonatomic) IBOutlet UIButton *btn_book;
@property (nonatomic) IBOutlet UILabel *initial_release;
@property (nonatomic) IBOutlet UILabel *run_time;
@property (nonatomic) IBOutlet UILabel *director;
@property (nonatomic) IBOutlet UILabel *music_by;
@property (nonatomic) IBOutlet UILabel *production;
-(void)setValue:(NSMutableDictionary *)dic;
- (IBAction)btn_book_pressed:(id)sender;
@end
