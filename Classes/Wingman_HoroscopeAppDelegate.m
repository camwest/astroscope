//
//  Wingman_HoroscopeAppDelegate.m
//  Wingman-Horoscope
//
//  Created by Cameron Westland on 19/01/09.
//  Copyright Big Bang Technology 2009. All rights reserved.
//

#import "Wingman_HoroscopeAppDelegate.h"
#import "RootViewController.h"


@implementation Wingman_HoroscopeAppDelegate

@synthesize window;
@synthesize navigationController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {
	
	// Configure and show the window
	[window addSubview:[navigationController view]];
	[window makeKeyAndVisible];
}

- (void)applicationWillTerminate:(UIApplication *)application {
	// Save data if appropriate
}


- (void)dealloc {
//	[navigationController release];
//	[window release];
	[super dealloc];
}

@end
