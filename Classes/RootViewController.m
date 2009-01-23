//
//  RootViewController.m
//  Wingman-Horoscope
//
//  Created by Cameron Westland on 19/01/09.
//  Copyright Big Bang Technology 2009. All rights reserved.
//

#import "RootViewController.h"
#import "Wingman_HoroscopeAppDelegate.h"
#import "HoroscopeDetailController.h"
#import "ZodiacCell.h"

@implementation RootViewController

@synthesize signs;

-(id)initWithCoder:(NSCoder *)coder
{
	if (self = [super initWithCoder:coder]) {
		[self createData];
	}
	
	return self;	
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}

#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.signs.count;
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Zodiac";
    
	ZodiacCell *cell = (ZodiacCell *) [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

    if (cell == nil) {
		cell = [self createNewZodiacCellFromNib];		
    }
    
	//[signs objectAtIndex: indexPath.row];
	NSDictionary *data = [self.signs objectAtIndex: indexPath.row];
	
	cell.nameLabel.text = [data objectForKey:@"name"];
	cell.dateLabel.text = [data objectForKey:@"date"];
	
	UIImage *img = [UIImage imageWithContentsOfFile: [[NSBundle mainBundle] pathForResource: [data objectForKey:@"image"] ofType:@"png"]];

	cell.zodiacImage.image = img;
	
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	NSLog(@"Selected Item");
	
	HoroscopeDetailController *horoscopeDetailController = [[HoroscopeDetailController alloc] 
															initWithNibName: @"HoroscopeDetail" 
															bundle: nil];
	
	[[self navigationController] pushViewController: horoscopeDetailController animated: YES];
	horoscopeDetailController.horoscopeSelected = [signs objectAtIndex: indexPath.row];
//	[horoscopeDetailController release];
}

- (ZodiacCell *)createNewZodiacCellFromNib
{
	NSArray *nibContents = [[NSBundle mainBundle] loadNibNamed:@"ZodiacCell" owner:self options:nil];
	NSEnumerator *nibEnumerator = [nibContents objectEnumerator];
	
	ZodiacCell *zodiacCell = nil;
	NSObject *nibItem = nil;
	
	while ( (nibItem = [nibEnumerator nextObject]) != nil) {
		if ( [nibItem isKindOfClass: [ZodiacCell class]] ) {
			zodiacCell = (ZodiacCell *) nibItem;
			if ([zodiacCell.reuseIdentifier isEqualToString: @"Zodiac"]) {
				break; //we have a winner
			} else {
				zodiacCell = nil;
			}
		}
	}
	
	return zodiacCell;
}

- (void)createData
{
	NSMutableArray *data = [NSMutableArray array];

	[data addObject:[NSDictionary dictionaryWithObjectsAndKeys: 
					 @"Aries", @"name", 
					 @"Mar 21 - Apr 20", @"date", 
					 @"ariesImage", @"image", nil]];

	[data addObject:[NSDictionary dictionaryWithObjectsAndKeys: 
					 @"Taurus", @"name", 
					 @"Apr 21 - May 21", @"date", 
					 @"taurusImage", @"image", nil]];	

	[data addObject:[NSDictionary dictionaryWithObjectsAndKeys: 
					 @"Gemini", @"name", 
					 @"May 22 - Jun 21", @"date", 
					 @"geminiImage", @"image", nil]];	

	[data addObject:[NSDictionary dictionaryWithObjectsAndKeys: 
					 @"Cancer", @"name", 
					 @"Jun 22 - Jul 22", @"date", 
					 @"cancerImage", @"image", nil]];	

	[data addObject:[NSDictionary dictionaryWithObjectsAndKeys: 
					 @"Leo", @"name", 
					 @"Jul 23 - Aug 21", @"date", 
					 @"leoImage", @"image", nil]];	

	[data addObject:[NSDictionary dictionaryWithObjectsAndKeys: 
					 @"Virgo", @"name", 
					 @"Aug 22 - Sep 23", @"date", 
					 @"virgoImage", @"image", nil]];	

	[data addObject:[NSDictionary dictionaryWithObjectsAndKeys: 
					 @"Libra", @"name", 
					 @"Sep 24 - Oct 23", @"date", 
					 @"libraImage", @"image", nil]];	

	[data addObject:[NSDictionary dictionaryWithObjectsAndKeys: 
					 @"Scorpio", @"name", 
					 @"Oct 24 - Nov 22", @"date", 
					 @"scorpioImage", @"image", nil]];	

	[data addObject:[NSDictionary dictionaryWithObjectsAndKeys: 
					 @"Sagittarius", @"name", 
					 @"Nov 23 - Dec 22", @"date", 
					 @"sagittariusImage", @"image", nil]];	

	[data addObject:[NSDictionary dictionaryWithObjectsAndKeys: 
					 @"Capricorn", @"name", 
					 @"Dec 23 - Jan 20", @"date", 
					 @"capricornImage", @"image", nil]];	

	[data addObject:[NSDictionary dictionaryWithObjectsAndKeys: 
					 @"Aquarius", @"name", 
					 @"Jan 21 - Feb 19", @"date", 
					 @"aquariusImage", @"image", nil]];	

	[data addObject:[NSDictionary dictionaryWithObjectsAndKeys: 
					 @"Pisces", @"name", 
					 @"Feb 20 - Mar 20", @"date", 
					 @"piscesImage", @"image", nil]];	

	self.signs = [NSArray arrayWithArray:data];
}

- (void)dealloc {
    [super dealloc];
}


@end

