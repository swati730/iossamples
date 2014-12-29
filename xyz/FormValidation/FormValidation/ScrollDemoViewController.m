//
//  ScrollDemoViewController.m
//  FormValidation
//
//  Created by Swati Goyal on 11/3/14.
//  Copyright (c) 2014 MEDITAB. All rights reserved.
//

#import "ScrollDemoViewController.h"
#import "ScrollTextFieldsViewController.h"

@interface ScrollDemoViewController ()

@end

@implementation ScrollDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Image Scroll";
    [self addScrollView];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)addScrollView{
    myScrollView = [[UIScrollView alloc]initWithFrame:
                    CGRectMake(20, 20, 280, 420)];
    myScrollView.accessibilityActivationPoint = CGPointMake(100, 100);
    imgView = [[UIImageView alloc]initWithImage:
               [UIImage imageNamed:@"bangbang.png"]];
    [myScrollView addSubview:imgView];
    myScrollView.minimumZoomScale = 0.5;
    myScrollView.maximumZoomScale = 3;
    myScrollView.contentSize = CGSizeMake(imgView.frame.size.width,
                                          imgView.frame.size.height);
    myScrollView.delegate = self;
    [self.view addSubview:myScrollView];
}
-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return imgView;
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSLog(@"Did end decelerating");
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    //    NSLog(@"Did scroll");
}
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView
                 willDecelerate:(BOOL)decelerate{
    NSLog(@"Did end dragging");
}
-(void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
    NSLog(@"Did begin decelerating");
}
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    NSLog(@"Did begin dragging");
}
-(IBAction)btn_next:(id)sender{
    ScrollTextFieldsViewController *controller = [[ScrollTextFieldsViewController alloc]initWithNibName:@"ScrollTextFieldsViewController" bundle:nil];
    [self.navigationController pushViewController:controller animated:YES];
    
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
