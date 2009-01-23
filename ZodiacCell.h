//
//  ZodiacCell.h
//  Wingman-Horoscope
//
//  Created by Cameron Westland on 22/01/09.
//  Copyright 2009 Big Bang Technology. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ZodiacCell : UITableViewCell {
	IBOutlet UILabel *nameLabel;
	IBOutlet UILabel *dateLabel;
	IBOutlet UIImageView *zodiacImage;
}

@property (nonatomic, retain) UILabel *nameLabel;
@property (nonatomic, retain) UILabel *dateLabel;
@property (nonatomic, retain) UIImageView *zodiacImage;

@end
