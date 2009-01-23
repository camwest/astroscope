//
//  HoroscopeEditingController.h
//  Wingman-Horoscope
//
//  Created by Cameron Westland on 21/01/09.
//  Copyright 2009 Big Bang Technology. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HoroscopeDetailController.h";

@interface HoroscopeEditingController : UIViewController <UITextFieldDelegate> {
	IBOutlet UITextField *clothingItem1Field;
	IBOutlet UITextField *clothingItem2Field;
	IBOutlet UITextField *descriptiveFeature1Field;
	IBOutlet UITextField *descriptiveFeature2Field;
	
	HoroscopeDetailController *detailController;
	
	//sound variables
	CFURLRef		confirmationSoundURLRef;
	SystemSoundID	soundFileObject;
}

@property (nonatomic, retain) IBOutlet UITextField *clothingItem1Field;
@property (nonatomic, retain) IBOutlet UITextField *clothingItem2Field;
@property (nonatomic, retain) IBOutlet UITextField *descriptiveFeature1Field;
@property (nonatomic, retain) IBOutlet UITextField *descriptiveFeature2Field;

@property (nonatomic, retain) HoroscopeDetailController *detailController;

//sound properties
@property (readwrite)	CFURLRef		confirmationSoundURLRef;
@property (readonly)	SystemSoundID	soundFileObject;

@end
