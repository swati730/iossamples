//
//  RootViewController.m
//  MDAudioPlayerSample
//
//  Created by Matt Donnelly on 03/08/2010.
//  Copyright 2010 Matt Donnelly. All rights reserved.
//

#import "RootViewController.h"
#import "MDAudioFile.h"
#import "MDAudioPlayerController.h"
#import "ListCellTableViewCell.h"


@implementation RootViewController

@synthesize fileArray;

#pragma mark -
#pragma mark View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];

	fileArray = [[NSMutableArray alloc] initWithObjects:[[NSBundle mainBundle] pathForResource:@"1" ofType:@"mp3"],
				 [[NSBundle mainBundle] pathForResource:@"2" ofType:@"mp3"],
				 [[NSBundle mainBundle] pathForResource:@"3" ofType:@"mp3"],
                 [[NSBundle mainBundle] pathForResource:@"audiofile" ofType:@"mp3"],
                 [[NSBundle mainBundle] pathForResource:@"Game of thrones" ofType:@"m4a"],nil];
    //fileArray = [fileArray arrayByAddingObjectsFromArray:fileArray];
   NSLog(@"%@",fileArray);
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleBlackTranslucent;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
	[super viewDidDisappear:animated];
}

 // Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations.
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark -
#pragma mark Table view data source

// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"%i", [fileArray count]);
    return [fileArray count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *simpleTableIdentifier = @"SimpleTableCell";
    
    ListCellTableViewCell *cell = (ListCellTableViewCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"ListCellTableViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
	cell.textLabel.text = [[NSString stringWithFormat:@"%@", [self.fileArray objectAtIndex:indexPath.row]] stringByDeletingPathExtension];
	
    return cell;
}


// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source.
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }   
}

// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}

// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}


#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath 
{    
	NSMutableArray *songs = [[NSMutableArray alloc] init];
	
	for (NSString *song in fileArray)
	{
		MDAudioFile *audioFile = [[MDAudioFile alloc] initWithPath:[NSURL fileURLWithPath:song]];
		[songs addObject:audioFile];
	}
	
	MDAudioPlayerController *audioPlayer = [[MDAudioPlayerController alloc] initWithSoundFiles:songs atPath:[[NSBundle mainBundle] bundlePath] andSelectedIndex:indexPath.row];
	[self presentViewController:audioPlayer animated:YES completion:nil];
}


#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}

@end

