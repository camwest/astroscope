//
//  HoroscopeDetailController.m
//  Wingman-Horoscope
//
//  Created by Cameron Westland on 21/01/09.
//  Copyright 2009 Big Bang Technology. All rights reserved.
//

#import "HoroscopeDetailController.h"
#import "HoroscopeEditingController.h"
#include <AudioToolbox/AudioToolbox.h>


@implementation HoroscopeDetailController

float kFilteringFactor = 0.1;
CGFloat SHAKE_THRESHOLD = 2.1;


@synthesize parsedDescription, clothingItem1, clothingItem2, descriptiveFeature1, descriptiveFeature2, nameLabel, dateLabel, zodiacImage;

//sound synthesis
@synthesize pageSwipeSoundURLRef;
@synthesize soundFileObject;

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {    
	[super viewDidLoad];
	
	[[UIAccelerometer sharedAccelerometer] setUpdateInterval: 0.03]; // 30 fps
	[[UIAccelerometer sharedAccelerometer] setDelegate: self];
	
	[self loadDataIfExists];
	
	//load the sounds
	CFBundleRef mainBundle;
	mainBundle = CFBundleGetMainBundle();
	
	pageSwipeSoundURLRef = CFBundleCopyResourceURL(mainBundle, CFSTR("page_swipe"), CFSTR("wav"), NULL);
	
	AudioServicesCreateSystemSoundID (pageSwipeSoundURLRef, &soundFileObject);
}

- (void)viewDidAppear:(BOOL)animated
{
	watchForMovement = YES; 
}

- (void)viewDidDisappear:(BOOL)animated
{
	watchForMovement = NO;	
}

#pragma mark Data Management

-(NSString *)dataFilePath
{	
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
	return [documentsDirectory stringByAppendingPathComponent: kFileName];
}

-(void)loadDataIfExists
{
	NSString *filePath = [self dataFilePath];
	if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {

		NSArray *array = [[NSArray alloc] initWithContentsOfFile:filePath];
		
		clothingItem1 =			[array objectAtIndex: 0];
		clothingItem2 =			[array objectAtIndex: 1];
		descriptiveFeature1 =	[array objectAtIndex: 2];
		descriptiveFeature2 =	[array objectAtIndex: 3];
	} 
	
	if (clothingItem1 == NULL) {
		clothingItem1 = @"blue jeans";
	}
	
	if (clothingItem2 == NULL) {
		clothingItem2 = @"a red sweater";
	}
	
	if (descriptiveFeature1 == NULL) {
		descriptiveFeature1 = @"dark brown hair";
	}
	
	if (descriptiveFeature2 == NULL) {
		descriptiveFeature2 = @"stunning green eyes";
	}
}


#pragma mark Getters & Setters

- (NSDictionary *)horoscopeSelected
{
	return horoscopeSelected;
}

- (void)setHoroscopeSelected:(NSDictionary *)h
{
//	[horoscopeSelected release];
	
	[h retain];
	
	horoscopeSelected = h;

	[self updateStringValues];
}

#pragma mark Utility Methods
-(void)updateStringValues
{
	parsedDescription.text = [NSString stringWithFormat: [horoscopeSelected objectForKey:@"prediction"], self.clothingItem1, self.clothingItem2, self.descriptiveFeature1, self.descriptiveFeature2];
	
	nameLabel.text = [horoscopeSelected objectForKey:@"name"];
	dateLabel.text = [horoscopeSelected objectForKey:@"date"];
	
	UIImage *img = [UIImage imageWithContentsOfFile: [[NSBundle mainBundle] pathForResource: [horoscopeSelected objectForKey:@"image"] ofType:@"png"]];
	
	zodiacImage.image = img;
}

-(void)startEditing
{
	AudioServicesPlayAlertSound (self.soundFileObject);
	
	HoroscopeEditingController *controller = [[HoroscopeEditingController alloc] initWithNibName: @"HoroscopeEditingView" bundle: nil];
	
	[[self navigationController] pushViewController: controller animated: YES];
	
	controller.clothingItem1Field.text = self.clothingItem1;		
	controller.clothingItem2Field.text = self.clothingItem2;
	controller.descriptiveFeature1Field.text = self.descriptiveFeature1;
	controller.descriptiveFeature2Field.text = self.descriptiveFeature2;
	
	controller.title = [NSString stringWithFormat: @"Editing %@", nameLabel.text];
	
	controller.detailController = self;
	
//	[controller release];	
}

#pragma mark Accel features

- (void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration 
{	
	CGFloat lowPassFilteredX = (acceleration.x * kFilteringFactor) + (filteredAccelX * (1.0 - kFilteringFactor));
	CGFloat lowPassFilteredY = (acceleration.y * kFilteringFactor) + (filteredAccelY * (1.0 - kFilteringFactor));
	
	CGFloat highPassFilteredX = acceleration.x - lowPassFilteredX;
	CGFloat highPassFilteredY = acceleration.y - lowPassFilteredY;
	
	filteredAccelX = highPassFilteredX;
	filteredAccelY = highPassFilteredY;
	
	if ( (fabsf (highPassFilteredX) > SHAKE_THRESHOLD) || (fabsf (highPassFilteredY) > SHAKE_THRESHOLD) ) {
		if(watchForMovement == YES) {
			[self startEditing];
			watchForMovement = NO;
		}
	}	
}

- (void)dealloc {
	
//	[parsedDescription release];	
//	[clothingItem1 release];
//	[clothingItem2 release];
//	[descriptiveFeature1 release];
//	[descriptiveFeature2 release];
	
    [super dealloc];
}


@end
