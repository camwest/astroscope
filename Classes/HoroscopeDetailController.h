//
//  HoroscopeDetailController.h
//  Wingman-Horoscope
//
//  Created by Cameron Westland on 21/01/09.
//  Copyright 2009 Big Bang Technology. All rights reserved.
//

#import <UIKit/UIKit.h>
#include <AudioToolbox/AudioToolbox.h>
#import "ZodiacCell.h"

#define kFileName		@"data.plist"

@interface HoroscopeDetailController : UIViewController <UIAccelerometerDelegate> {
	NSDictionary *horoscopeSelected;

	// component outlets
	IBOutlet UITextView *parsedDescription;
	IBOutlet UILabel *nameLabel;
	IBOutlet UILabel *dateLabel;
	IBOutlet UIImageView *zodiacImage;

	// Default values
	NSString *clothingItem1; // = @"blue jeans";
	NSString *clothingItem2; // = @"a red sweater";
	NSString *descriptiveFeature1; // = @"dark brown hair";
	NSString *descriptiveFeature2; // = @"stunning green eyes";
		
	//acceleration variables
	UIAccelerationValue filteredAccelX;
	UIAccelerationValue filteredAccelY;
	
	BOOL showingEditScreen;
	
	//sound variables
	CFURLRef		pageSwipeSoundURLRef;
	SystemSoundID	soundFileObject;

}

-(void)updateStringValues;
-(void)startEditing;
-(NSString *)dataFilePath;
-(void)loadDataIfExists;

@property (nonatomic, retain) NSDictionary *horoscopeSelected;
@property (nonatomic, retain) IBOutlet UITextView *parsedDescription;
@property (nonatomic, retain) NSString *clothingItem1;
@property (nonatomic, retain) NSString *clothingItem2;
@property (nonatomic, retain) NSString *descriptiveFeature1;
@property (nonatomic, retain) NSString *descriptiveFeature2;
@property (nonatomic, retain) UILabel *nameLabel;
@property (nonatomic, retain) UILabel *dateLabel;
@property (nonatomic, retain) UIImageView *zodiacImage;

//sound properties
@property (readwrite)	CFURLRef		pageSwipeSoundURLRef;
@property (readonly)	SystemSoundID	soundFileObject;



@end
