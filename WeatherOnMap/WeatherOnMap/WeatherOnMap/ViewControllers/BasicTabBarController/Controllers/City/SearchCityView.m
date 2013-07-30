//
//  SearchCityView.m
//  WeatherOnMap
//
//  Created by Jacek Grygiel on 1/2/13.
//  Copyright (c) 2013 Jacek Grygiel. All rights reserved.
//

#import "SearchCityView.h"
#import "CityModel.h"
#import "CitySearchTableViewCell.h"

@interface SearchCityView ()
@property(nonatomic, retain) NSArray *orginalData;
@end

@implementation SearchCityView
@synthesize findButton = _findButton;
@synthesize findCityTextField = _findCityTextField;
@synthesize searchTableView = _searchTableView;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.findCityTextField = [[[UITextField alloc] initWithFrame:CGRectMake(20, 10, 210, 35)] autorelease];
        self.findCityTextField.borderStyle = UITextBorderStyleRoundedRect;
        self.findCityTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        
        self.findButton = [[[UIButton alloc] initWithFrame:CGRectMake(250, 10, 60, 35)] autorelease];
        [self.findButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.findButton setTitle:NSLocalizedString(@"find.city.title", nil) forState:UIControlStateNormal];
        self.findButton.titleLabel.font = [UIFont systemFontOfSize:12.0];
        [self.findButton setBackgroundImage:[UIImage imageNamed:@"button.png"] forState:UIControlStateNormal];
        [self.findButton addTarget:self action:@selector(findCityAction:) forControlEvents:UIControlEventTouchUpInside];
        self.orginalData = [NSArray array];
        
        [self addSubview:self.findCityTextField];
        [self addSubview:self.findButton];
    }
    return self;
}


#pragma mark table delegates method

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CitySearchTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[CitySearchTableViewCell defaultDequeueDescription]];
    CityModel *cityModel = [self.orginalData objectAtIndex:indexPath.row];
    if (cell == nil) {
        cell = [[CitySearchTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[CitySearchTableViewCell defaultDequeueDescription]];
        
        UIButton *addButton = [[[UIButton alloc] initWithFrame:CGRectMake(250, 5, 60, 35)] autorelease];
        addButton.tag = indexPath.row;
        [addButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [addButton setTitle:NSLocalizedString(@"find.city.add", nil) forState:UIControlStateNormal];
        addButton.titleLabel.font = [UIFont systemFontOfSize:10.0];
        [addButton setBackgroundImage:[UIImage imageNamed:@"button.png"] forState:UIControlStateNormal];
        [addButton addTarget:self action:@selector(addCity:) forControlEvents:UIControlEventTouchUpInside];
        [cell addSubview:addButton];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%@, country = %@, population = %lld",cityModel.name, cityModel.country, cityModel.population];
    cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:12.0];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.orginalData count];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

- (void) findCityAction:(id) sender{
    
    [[WeatherOnMapService sharedInstance] findCityByName:self.findCityTextField.text withCaller:self];


}

- (void) addCity:(id) sender{
    UIButton *addButton = (UIButton*) sender;
    [self selectCity:[self.orginalData objectAtIndex:addButton.tag]];
}

- (void) selectCity:(CityModel*) city{
    if ([self.delegate respondsToSelector:@selector(didFilledDataChanged:withData:)]) {
		[self.delegate didFilledDataChanged:self withData:city];
	}
	
	[self hideInParentView];
}

- (void) didReceiveError:(NSError*) error{
    DebugLog(@"%@", error);
}
- (void) didReceiveResponse:(BasicResponseModel*) basicResponse{
    
    self.orginalData = basicResponse.list;
    if (self.searchTableView) {
        [UIView animateWithDuration:0.5 animations:^{
            self.searchTableView.alpha = 0.0;
        } completion:^(BOOL finished) {
            [self.searchTableView removeFromSuperview];
            self.searchTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 50, 320, 480-50) style:UITableViewStylePlain];
            self.searchTableView.delegate = self;
            self.searchTableView.dataSource = self;
            self.searchTableView.alpha = 0.0;
            [self addSubview:self.searchTableView];
            [UIView animateWithDuration:0.5 animations:^{
                self.searchTableView.alpha = 1.0;
            } completion:^(BOOL finished) {
                [self.searchTableView reloadData];
            }];
        }];
    }else{
        self.searchTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 50, 320, 480-50) style:UITableViewStylePlain];
        self.searchTableView.delegate = self;
        self.searchTableView.dataSource = self;
        self.searchTableView.alpha = 0.0;
        [self addSubview:self.searchTableView];
        [UIView animateWithDuration:0.5 animations:^{
            self.searchTableView.alpha = 1.0;
        } completion:^(BOOL finished) {
            [self.searchTableView reloadData];
        }];
    }
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
