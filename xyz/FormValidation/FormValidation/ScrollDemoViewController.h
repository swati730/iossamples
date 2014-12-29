//
//  ScrollDemoViewController.h
//  FormValidation
//
//  Created by Swati Goyal on 11/3/14.
//  Copyright (c) 2014 MEDITAB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScrollDemoViewController : UIViewController<UIScrollViewDelegate>{
UIScrollView *myScrollView;
    UIImageView *imgView;
}
-(void)addScrollView;
-(IBAction)btn_next:(id)sender;
@end
