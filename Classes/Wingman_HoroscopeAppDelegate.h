//
//  Wingman_HoroscopeAppDelegate.h
//  Wingman-Horoscope
//
//  Created by Cameron Westland on 19/01/09.
//  Copyright Big Bang Technology 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Wingman_HoroscopeAppDelegate : NSObject <UIApplicationDelegate> {
    
    UIWindow *window;
    UINavigationController *navigationController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

@end

