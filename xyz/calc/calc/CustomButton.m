//
//  CustomButton.m
//  calc
//
//  Created by Swati Goyal on 10/15/14.
//  Copyright (c) 2014 MEDITAB. All rights reserved.
//

//
//  CustomButton.m
//  calc
//
//  Created by Swati Goyal on 10/15/14.
//  Copyright (c) 2014 MEDITAB. All rights reserved.
//

#import "CustomButton.h"
#import <QuartzCore/QuartzCore.h>

@implementation CustomButton



- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        NSLog(@"CustomButton");
        
        self.backgroundColor = [UIColor colorWithRed:(0.8) green:(0.8) blue:(0.8) alpha:(1.0)];
        
        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
        [self.layer setBorderWidth:0.3];
        [self.layer setBorderColor:[UIColor blackColor].CGColor];
        
    }
    return self;
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */

@end
