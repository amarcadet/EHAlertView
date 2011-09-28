//
//  DemoViewController.m
//  Demo
//
//  Created by Antoine Marcadet on 28/09/11.
//  Copyright 2011 Epershand. All rights reserved.
//

#import "DemoViewController.h"
#import "EHAlertView.h"

@interface DemoViewController (Private)

- (void)showAlertView;

@end

@implementation DemoViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
	
	[self showAlertView];
}

- (void)showAlertView
{	
	__block EHAlertView *alertView = [[EHAlertView alloc] initWithTitle:@"Title"
																message:@"Message"
													  cancelButtonTitle:@"Cancel"
													  otherButtonTitles:@"First", @"Second", @"Third", nil];
	[alertView setClickedButtonBlock:^(NSInteger buttonIndex){
		NSLog(@"Clicked button : %d", buttonIndex);
	}];
	[alertView setDidDismissButtonBlock:^(NSInteger buttonIndex){
		if (buttonIndex != 0)
		{
			[self showAlertView];
		}
	}];
	[alertView show];
	[alertView release];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
