# EHAlertView

EHAlertView is an easy to use UIAlertView subclass that allow you to avoid usage of delegate pattern while dealing with alert view action.
Simply use blocks to define what should be done when the user willDismiss, clicked or didDismiss the alert.

### Sample code

```objective-c
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
```