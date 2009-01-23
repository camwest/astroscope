//
//  RootViewController.h
//  Wingman-Horoscope
//
//  Created by Cameron Westland on 19/01/09.
//  Copyright Big Bang Technology 2009. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZodiacCell.h"

@interface RootViewController : UITableViewController {
	NSMutableArray *signs;
}

- (void)createData;
- (ZodiacCell *)createNewZodiacCellFromNib;


@property(nonatomic, retain) NSMutableArray *signs;

@end
