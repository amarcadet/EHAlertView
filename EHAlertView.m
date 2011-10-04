//
//  EHAlertView.m
//
//  Created by Antoine Marcadet on 28/09/11.
//  Copyright 2011 Antoine Marcadet. All rights reserved.
//
//  Permission is given to use this source code file without charge in any
//  project, commercial or otherwise, entirely at your risk, with the condition
//  that any redistribution (in part or whole) of source code must retain
//  this copyright and permission notice. Attribution in compiled projects is
//  appreciated but not required.
//

#import "EHAlertView.h"

@implementation EHAlertView

- (void)dealloc
{
#if NS_BLOCKS_AVAILABLE
	if (willDismissButtonBlock != nil)
	{
		[willDismissButtonBlock release];
	}
	if (clickedButtonBlock != nil)
	{
		[clickedButtonBlock release];
	}
	if (didDismissButtonBlock != nil)
	{
		[didDismissButtonBlock release];
	}
#endif
	[super dealloc];
}

- (id)initWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ...
{
	if ((self = [super initWithTitle:title message:message delegate:self cancelButtonTitle:cancelButtonTitle otherButtonTitles:nil]))
	{
		va_list args;
		va_start(args, otherButtonTitles);
		for (NSString *otherButtonTitle = otherButtonTitles; otherButtonTitle != nil; otherButtonTitle = va_arg(args, NSString *))
		{
			[self addButtonWithTitle:otherButtonTitle];
		}
		va_end(args);
    }
    return self;
}


#if NS_BLOCKS_AVAILABLE

- (void)setWillDismissButtonBlock:(EHAlertButtonBlock)block
{
	if (willDismissButtonBlock != nil)
	{
		[willDismissButtonBlock release];
	}
	willDismissButtonBlock = [block copy];
}

- (void)setClickedButtonBlock:(EHAlertButtonBlock)block
{
	if (clickedButtonBlock != nil)
	{
		[clickedButtonBlock release];
	}
	clickedButtonBlock = [block copy];	
}

- (void)setDidDismissButtonBlock:(EHAlertButtonBlock)block
{
	if (didDismissButtonBlock != nil)
	{
		[didDismissButtonBlock release];
	}
	didDismissButtonBlock = [block copy];
}

#pragma mark - UIAlertViewDelegate

- (void)alertView:(UIAlertView *)alertView willDismissWithButtonIndex:(NSInteger)buttonIndex
{
	if (willDismissButtonBlock != nil)
	{
		willDismissButtonBlock(buttonIndex);
	}
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
	if (clickedButtonBlock != nil)
	{
		clickedButtonBlock(buttonIndex);
	}
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
	if (didDismissButtonBlock != nil)
	{
		didDismissButtonBlock(buttonIndex);
	}
}

#endif

@end
