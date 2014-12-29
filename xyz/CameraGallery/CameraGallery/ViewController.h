//
//  ViewController.h
//  CameraGallery
//
//  Created by Swati Goyal on 11/9/14.
//  Copyright (c) 2014 MEDITAB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (strong, nonatomic) IBOutlet UIImageView *imageView;

- (IBAction)takePhoto:  (UIButton *)sender;
- (IBAction)selectPhoto:(UIButton *)sender;




@end

