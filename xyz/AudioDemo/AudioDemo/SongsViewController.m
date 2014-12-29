//
//  SongsViewController.m
//  AudioDemo
//
//  Created by Swati Goyal on 11/8/14.
//  Copyright (c) 2014 Appcoda. All rights reserved.
//

#import "SongsViewController.h"
#import "SongsCellTableViewCell.h"
#import <MediaPlayer/MediaPlayer.h>
#import <MediaPlayer/MPMediaQuery.h>
@interface SongsViewController ()

@end

@implementation SongsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

   
    
          }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    MPMediaQuery *songsQuery = [MPMediaQuery songsQuery];
    NSArray *songs = [songsQuery items];
    
    NSLog(@"array count is %lu", (unsigned long)[songs count]);

    
    return [songs count];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *simpleTableIdentifier = @"SimpleTableCell";
    
    SongsCellTableViewCell *cell = (SongsCellTableViewCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"SongsCellTableViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    
    MPMediaQuery *songsQuery = [MPMediaQuery songsQuery];
    NSArray *songs = [songsQuery items];
    NSLog(@"%@",songs);
    MPMediaItem *rowItem = [songs objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [rowItem valueForProperty:MPMediaItemPropertyTitle];
    cell.detailTextLabel.text = [rowItem valueForProperty:MPMediaItemPropertyArtist];
    
    return cell;
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
