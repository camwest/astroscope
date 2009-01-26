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
					 @"ariesImage", @"image", 
					 @"Fire is your element, and today you’re feeling the confidence that helps define the Aries. You’re warm nature will attract the attention of a perfect stranger. Keep your eyes out for someone wearing %@ and %@. They’ll also have %@ and %@. Aries don’t need to explain their next move, just rely on your spontaneous sense of fun, and let your personality do the rest.", @"prediction",
					 nil]];

	[data addObject:[NSDictionary dictionaryWithObjectsAndKeys: 
					 @"Taurus", @"name", 
					 @"Apr 21 - May 21", @"date", 
					 @"taurusImage", @"image", 
					 @"Today’s a great day to be a Taurus. You’re determined to get what you want, and today is all about Carpe Diem. Chances are that today you’re going to meet a unique person with an intoxicating presence. Keep your eyes out for someone wearing %@ and %@. They’ll also have %@ and %@. Instead of being practical, do the unexpected. Being sensible has its place and time, but today isn’t it!", @"prediction",
					 nil]];	

	[data addObject:[NSDictionary dictionaryWithObjectsAndKeys: 
					 @"Gemini", @"name", 
					 @"May 22 - Jun 21", @"date", 
					 @"geminiImage", @"image", 
					 @"Although sometimes it might get you into trouble, your curiosity will reward you today. Light-hearted social encounters are nice, but you’ve been waiting for a more substantial conversation, and you should get ready for a nice surprise. Keep your eyes out for someone wearing %@ and %@. They’ll also have %@ and %@. This stranger might be your complete opposite in many ways, but will definitely compliment your great sense of humour and keep your conversation on track.", @"prediction",
					 nil]];	

	[data addObject:[NSDictionary dictionaryWithObjectsAndKeys: 
					 @"Cancer", @"name", 
					 @"Jun 22 - Jul 22", @"date", 
					 @"cancerImage", @"image", 
					 @"Today is a day for you to let your guard down and take a chance. Cancer’s like to protect themselves from perceived dangers, and sometime chances pass you by. Keep your eyes out for someone wearing %@ and %@. They’ll also have %@ and %@. When you see them, instead of hiding in your shell, take a chance and say hello. They’ll appreciate the risk you’re taking and reciprocate your good intentions.", @"prediction",
					 nil]];	

	[data addObject:[NSDictionary dictionaryWithObjectsAndKeys: 
					 @"Leo", @"name", 
					 @"Jul 23 - Aug 21", @"date", 
					 @"leoImage", @"image", 
					 @"Proud and magnificent, Leos are the king of their domain. Take advantage of your confidence and leadership abilities today when you come across a stranger in disguise. Keep your eyes out for someone wearing %@ and %@. They’ll also have %@ and %@. Be bold and reach out on a limb, strike up a conversation and see what happens. Forget any expectations you might have, just run with it and have fun.", @"prediction",
					 nil]];	

	[data addObject:[NSDictionary dictionaryWithObjectsAndKeys: 
					 @"Virgo", @"name", 
					 @"Aug 22 - Sep 23", @"date", 
					 @"virgoImage", @"image", 
					 @"Make no mistake, today is one in a million, and you’re ready to roll the dice. Jupiter and Mercury align only three times a century, and that means you should expect the unexpected – and run with it. Keep your eyes out for someone wearing %@ and a %@. They’ll also have %@ and %@. They wouldn’t believe you if you told them, so stay calm and cool, but the two of you are set to embark on the adventure of a lifetime. The energy between you will be electric, and the chemistry will be cosmic.", @"prediction",					 
					 nil]];	

	[data addObject:[NSDictionary dictionaryWithObjectsAndKeys: 
					 @"Libra", @"name", 
					 @"Sep 24 - Oct 23", @"date", 
					 @"libraImage", @"image", 
					 @"Today is the day that you rectify another imbalance in your life. You’re comfortable in almost any social situation, but you have trouble instigating spontaneous conversations. Keep your eyes out for someone wearing %@ and %@. They’ll also have %@ and %@. When you see them, don’t think twice about it, just say hi and see what happens. They’ll respond to your energy and your attitude.", @"prediction",
					 nil]];	

	[data addObject:[NSDictionary dictionaryWithObjectsAndKeys: 
					 @"Scorpio", @"name", 
					 @"Oct 24 - Nov 22", @"date", 
					 @"scorpioImage", @"image", 
					 @"Today is the day to let your guard down and take a chance. Turn off your skepticism and show a bit of your mysterious personality. Chances are that if you do, you won’t regret it. Keep your eyes out for someone wearing %@ and %@. They’ll also have %@ and %@. Let your personality do the talking when you say hello – no need to be anyone other than yourself. You just might have the conversation of a lifetime.", @"prediction",					 
					 nil]];	

	[data addObject:[NSDictionary dictionaryWithObjectsAndKeys: 
					 @"Sagittarius", @"name", 
					 @"Nov 23 - Dec 22", @"date", 
					 @"sagittariusImage", @"image", 
					 @"Your optimism and adventurous spirit are your best assets, although some times you keep them in check. But today has a twist in store, so be ready for anything. Keep your eyes out for someone wearing %@ and %@. They’ll also have %@ and %@. It might seem silly at first, but trust your instincts. Your love of travel and philosophy will ensure you have a lot to talk about.", @"prediction",
					 nil]];	

	[data addObject:[NSDictionary dictionaryWithObjectsAndKeys: 
					 @"Capricorn", @"name", 
					 @"Dec 23 - Jan 20", @"date", 
					 @"capricornImage", @"image", 
					 @"Capricorns are goal-oriented, driven people. But today is all about keeping expectations low, and letting yourself take a chance. Keep your eyes out for someone wearing %@ and %@. They’ll also have %@ and %@. If you have the courage to be honest, they’ll appreciate what you have to offer and return the favour.  Have faith in your ability to communicate what’s inside your head, you won’t be sorry.", @"prediction",
					 nil]];	

	[data addObject:[NSDictionary dictionaryWithObjectsAndKeys: 
					 @"Aquarius", @"name", 
					 @"Jan 21 - Feb 19", @"date", 
					 @"aquariusImage", @"image", 
					 @"You’re one in a million, but today you’re going to meet your match. Your friendly, approachable nature is going to help you when it happens. Keep your eyes out for someone wearing %@ and %@. They’ll also have %@ and %@. They might see you as eccentric, but they’ll appreciate the genius that goes along with it. You’ll both feel the connection when you get to talking, so don’t worry about anything except being yourself and keeping an open mind.", @"prediction",					 
					 nil]];	

	[data addObject:[NSDictionary dictionaryWithObjectsAndKeys: 
					 @"Pisces", @"name", 
					 @"Feb 20 - Mar 20", @"date", 
					 @"piscesImage", @"image", 
					 @"When it comes to intuition and instincts, a Pisces can read a room like a book. You can see a person for who they really are, and not just what they’d like to be seen as. Trust your basic instincts today when you see someone wearing %@ and %@. They’ll also have %@ and %@. The fact that you connect with others easily will only make the first five minutes easy and natural. Take advantage of the opportunities life throws your way.", @"prediction",
					 nil]];	

	self.signs = [NSArray arrayWithArray:data];
}

- (void)dealloc {
    [super dealloc];
}


@end

