//
//  BasicTableViewCell.m
//  WeatherOnMap
//
//  Created by Jacek Grygiel on 4/24/13.
//  Copyright (c) 2013 Jacek Grygiel. All rights reserved.
//

#import "BasicTableViewCell.h"

@implementation BasicTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (NSString*) defaultDequeueDescription{
    return [self description];
}

@end
