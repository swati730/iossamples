//
//  ViewController.m
//  DemoWebServices
//
//  Created by Swati Goyal on 11/5/14.
//  Copyright (c) 2014 MEDITAB. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end


#define kStrikeIronUserID   @"swatig@meditab.com"
#define kStrikeIronPassword @"123456"
@implementation ViewController
@synthesize enteredEmailAddress = _enteredEmailAddress;
@synthesize verificationResults;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.emailAddress.delegate= self;
    
    //self.enteredEmailAddress.d;
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (BOOL)textFieldShouldReturn:(UITextField *)emailTextField {
    
    [emailTextField resignFirstResponder];
    return YES;
    
}

- (IBAction)verifyEmail:(id)sender{
    self.enteredEmailAddress = self.emailAddress.text;
    self.verificationResults.text = @"";

    NSString *restCallString = [NSString stringWithFormat:@"http://ws.strikeiron.com/StrikeIron/EMV6Hygiene/VerifyEmail?LicenseInfo.RegisteredUser.UserID=%@;LicenseInfo.RegisteredUser.Password=%@;VerifyEmail.Email=%@;VerifyEmail.Timeout=30", kStrikeIronUserID, kStrikeIronPassword, self.enteredEmailAddress ];


    // Create the URL to make the rest call.
    NSURL *restURL = [NSURL URLWithString:restCallString];
    NSURLRequest *restRequest = [NSURLRequest requestWithURL:restURL];
    
    if( currentConnection)
    {
        [currentConnection cancel];
        currentConnection = nil;
        self.apiReturnXMLData = nil;
    }
    currentConnection = [[NSURLConnection alloc] initWithRequest:restRequest delegate:self];
    
    // If the connection was successful, create the XML that will be returned.
    self.apiReturnXMLData = [NSMutableData data];
    
}
- (void)connection:(NSURLConnection*)connection didReceiveResponse:(NSURLResponse *)response {
    [self.apiReturnXMLData setLength:0];
}

- (void)connection:(NSURLConnection*)connection didReceiveData:(NSData*)data {
    [self.apiReturnXMLData appendData:data];
}

- (void)connection:(NSURLConnection*)connection didFailWithError:(NSError*)error {
    NSLog(@"URL Connection Failed!");
    NSLog(@"%@",error);
    currentConnection = nil;
}


- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString*)qualifiedName attributes:(NSDictionary *)attributeDict {
    
    // Log the error - in this case we are going to let the user pass but log the message
    if( [elementName isEqualToString:@"Error"])
    {
        NSLog(@"Web API Error!");
    }
    
    // Pull out the elements we care about.
    if( [elementName isEqualToString:@"StatusNbr"] ||
       [elementName isEqualToString:@"HygieneResult"])
    {
        self.currentElement = [[NSString alloc] initWithString:elementName];
    }
}

- (void)parser:(NSXMLParser*)parser foundCharacters:(NSString*)string {
    
    if([self.currentElement isEqualToString:@"StatusNbr"])
    {
        self.statusNbr = [string intValue];
        self.currentElement = nil;
    }
    else if([self.currentElement isEqualToString:@"HygieneResult"])
    {
        self.hygieneResult = [[NSString alloc] initWithString:string];
        self.currentElement = nil;
    }
}
-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    
}
-(void)parserDidEndDocument:(NSXMLParser *)parser {
    
    // Determine what we are going to display in the label
    if([self.hygieneResult isEqualToString:@"Spam Trap"])
    {
        self.verificationResults.text = @"Dangerous email, please correct";
    }
    else if(self.statusNbr >= 300)
    {
        self.verificationResults.text = @"Invalid email, please re-enter";
    }
    else
    {
        self.verificationResults.text = @"Thank you for your submission";
    }
    
    self.apiReturnXMLData = nil;
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection {
    // create our XML parser with the return data from the connection
    xmlParser = [[NSXMLParser alloc] initWithData:self.apiReturnXMLData];
    
    // setup the delgate (see methods below)
    
    [xmlParser setDelegate:self];
    
    // start parsing. The delgate methods will be called as it is iterating through the file.
    [xmlParser parse];
    
    currentConnection = nil;
}

@end
