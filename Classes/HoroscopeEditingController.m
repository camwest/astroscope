//
//  HoroscopeEditingController.m
//  Wingman-Horoscope
//
//  Created by Cameron Westland on 21/01/09.
//  Copyright 2009 Big Bang Technology. All rights reserved.
//

#import "HoroscopeEditingController.h"


@implementation HoroscopeEditingController

@synthesize clothingItem1Field, clothingItem2Field, descriptiveFeature1Field, descriptiveFeature2Field, detailController;

//sound synthesis
@synthesize confirmationSoundURLRef;
@synthesize soundFileObject;

// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
		[self.navigationItem setHidesBackButton:YES animated:NO];
		[super setEditing:YES animated:NO];

    }
    return self;
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	UIBarButtonItem *saveButton = [[[UIBarButtonItem alloc] initWithTitle:@"Save" style:UIBarButtonItemStylePlain target:self action: @selector(saveButtonPressed)] autorelease];	
	self.navigationItem.rightBarButtonItem = saveButton;
	
	//add clear buttons
	clothingItem1Field.clearButtonMode = UITextFieldViewModeWhileEditing;
	clothingItem2Field.clearButtonMode = UITextFieldViewModeWhileEditing;
	descriptiveFeature1Field.clearButtonMode = UITextFieldViewModeWhileEditing;
	descriptiveFeature2Field.clearButtonMode = UITextFieldViewModeWhileEditing;
	
	//load the sounds
	CFBundleRef mainBundle;
	mainBundle = CFBundleGetMainBundle();
	
	confirmationSoundURLRef = CFBundleCopyResourceURL(mainBundle, CFSTR("oh_yeah"), CFSTR("wav"), NULL);
	
	AudioServicesCreateSystemSoundID (confirmationSoundURLRef, &soundFileObject);	
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField 
{
	//resets the field to the top
	[UIView beginAnimations:nil context:NULL];
	self.view.center = CGPointMake(self.view.center.x, self.view.frame.size.height / 2);
	[UIView commitAnimations];
	
	[textField resignFirstResponder];
	
	return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
	[UIView beginAnimations:nil context:NULL];
	self.view.center = CGPointMake(self.view.center.x, (self.view.frame.size.height / 2) - textField.frame.origin.y + 90);
	[UIView commitAnimations];
}

- (IBAction)saveButtonPressed
{	
	NSLog(@"Save button pressed");
	
	//update the detail controller
	detailController.clothingItem1		 = self.clothingItem1Field.text;
	detailController.clothingItem2		 = self.clothingItem2Field.text;
	detailController.descriptiveFeature1 = self.descriptiveFeature1Field.text;
	detailController.descriptiveFeature2 = self.descriptiveFeature2Field.text;
	
	[detailController updateStringValues];
	
	//save the data to a file
	NSMutableArray *array = [[NSMutableArray alloc] init];	
	
	[array addObject: self.clothingItem1Field.text];
	[array addObject: self.clothingItem2Field.text];
	[array addObject: self.descriptiveFeature1Field.text];
	[array addObject: self.descriptiveFeature2Field.text];
	
	[array writeToFile: [detailController dataFilePath] atomically: YES];	
	
	//navigate back to the detail controler
	[[self navigationController] popViewControllerAnimated: YES];
	
	//OH YEAH!
	AudioServicesPlaySystemSound (self.soundFileObject);
}

- (void)dealloc {
	
//	[clothingItem1Field release];
//	[clothingItem2Field release];
//	[descriptiveFeature1Field release];
//	[descriptiveFeature2Field release];

    [super dealloc];
}



@end
