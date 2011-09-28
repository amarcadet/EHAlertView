//
//  EHAlertView.h
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

#import <UIKit/UIKit.h>

#if NS_BLOCKS_AVAILABLE
typedef void (^EHAlertBasicBlock)(void);
typedef void (^EHAlertButtonBlock)(NSInteger buttonIndex);
#endif

@interface EHAlertView : UIAlertView <UIAlertViewDelegate>
{
#if NS_BLOCKS_AVAILABLE
	EHAlertButtonBlock willDismissButtonBlock;
	EHAlertButtonBlock clickedButtonBlock;
	EHAlertButtonBlock didDismissButtonBlock;
#endif
}

- (id)initWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ... NS_REQUIRES_NIL_TERMINATION;

#if NS_BLOCKS_AVAILABLE
- (void)setWillDismissButtonBlock:(EHAlertButtonBlock)block;
- (void)setClickedButtonBlock:(EHAlertButtonBlock)block;
- (void)setDidDismissButtonBlock:(EHAlertButtonBlock)block;
#endif

@end
