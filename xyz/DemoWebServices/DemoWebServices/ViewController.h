//
//  ViewController.h
//  DemoWebServices
//
//  Created by Swati Goyal on 11/5/14.
//  Copyright (c) 2014 MEDITAB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate, NSURLConnectionDelegate, NSXMLParserDelegate>
{
    NSURLConnection *currentConnection;
    NSXMLParser *xmlParser;
}
- (IBAction)verifyEmail:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *emailAddress;
@property (weak, nonatomic) IBOutlet UILabel *verificationResults;
@property (copy, nonatomic) NSString *enteredEmailAddress;
@property (retain, nonatomic) NSMutableData *apiReturnXMLData;
@property (nonatomic) NSInteger statusNbr;
@property (copy, nonatomic) NSString *hygieneResult;
@property (copy, nonatomic) NSString *currentElement;
@end

