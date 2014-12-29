//
//  SongsCellTableViewCell.m
//  AudioDemo
//
//  Created by Swati Goyal on 11/8/14.
//  Copyright (c) 2014 Appcoda. All rights reserved.
//

#import "SongsCellTableViewCell.h"

@implementation SongsCellTableViewCell
@synthesize textLabel,detailTextLabel;
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
