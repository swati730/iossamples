//
//  PagingViewController.h
//  DemoWebServices
//
//  Created by Swati Goyal on 11/6/14.
//  Copyright (c) 2014 MEDITAB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PagingViewController : UIViewController <UIScrollViewDelegate>
@property(nonatomic) IBOutlet UIPageControl *pageControl;
@property(nonatomic) IBOutlet UIScrollView *scrollView;
@property (nonatomic, strong) NSArray *pageImages;
@property (nonatomic, strong) NSMutableArray *pageViews;

- (void)loadVisiblePages;
- (void)loadPage:(NSInteger)page;
- (void)purgePage:(NSInteger)page;
@end
