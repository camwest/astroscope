//
//  ZodiacCell.m
//  Wingman-Horoscope
//
//  Created by Cameron Westland on 22/01/09.
//  Copyright 2009 Big Bang Technology. All rights reserved.
//

#import "ZodiacCell.h"


@implementation ZodiacCell

@synthesize nameLabel, dateLabel, zodiacImage;

- (id)initWithFrame:(CGRect)frame reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithFrame:frame reuseIdentifier:reuseIdentifier]) {
        // Initialization code
    }
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {

    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)dealloc {
    [super dealloc];
}


@end
