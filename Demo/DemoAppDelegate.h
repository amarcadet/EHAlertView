//
//  DemoAppDelegate.h
//  Demo
//
//  Created by Antoine Marcadet on 28/09/11.
//  Copyright 2011 Epershand. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DemoViewController;

@interface DemoAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) DemoViewController *viewController;

@end
