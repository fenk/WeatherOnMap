//
//  SearchCityView.m
//  WeatherOnMap
//
//  Created by Jacek Grygiel on 1/2/13.
//  Copyright (c) 2013 Jacek Grygiel. All rights reserved.
//

#import "SearchCityView.h"

@implementation SearchCityView
@synthesize findButton = _findButton;
@synthesize findCityTextField = _findCityTextField;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.findCityTextField = [[[UITextField alloc] initWithFrame:CGRectMake(20, 10, 280, 28)] autorelease];
        self.findCityTextField.borderStyle = UITextBorderStyleRoundedRect;
        
        self.findButton = [[[UIButton alloc] initWithFrame:CGRectMake(200, 45, 100, 28)] autorelease];
        [self.findButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.findButton setTitle:NSLocalizedString(@"find.city.title", nil) forState:UIControlStateNormal];
        self.findButton.titleLabel.font = [UIFont systemFontOfSize:12.0];
        [self.findButton setBackgroundImage:[UIImage imageNamed:@"button.png"] forState:UIControlStateNormal];
        [self.findButton addTarget:self action:@selector(findCityAction:) forControlEvents:UIControlEventTouchUpInside];
       
        [self addSubview:self.findCityTextField];
        [self addSubview:self.findButton];
    }
    return self;
}

- (void) findCityAction:(id) sender{
    if ([self.delegate respondsToSelector:@selector(didFilledDataChanged:withData:)]) {
		[self.delegate didFilledDataChanged:self withData:self.findCityTextField.text];
	}
	
	[self hideInParentView];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
