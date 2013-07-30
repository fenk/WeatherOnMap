//
//  SearchCityView.m
//  WeatherOnMap
//
//  Created by Jacek Grygiel on 1/2/13.
//  Copyright (c) 2013 Jacek Grygiel. All rights reserved.
//

#import "SearchCityViewController.h"
#import "CDCityInfo.h"
#import "CitySearchTableViewCell.h"
#import <QuartzCore/QuartzCore.h>
@interface SearchCityViewController ()
@property(nonatomic, retain) NSArray *orginalData;
@end

@implementation SearchCityViewController
@synthesize findCityTextField = _findCityTextField;
@synthesize searchTableView = _searchTableView;
@synthesize delegate = _delegate;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIBarButtonItem *leftBarButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(dismissModalViewControllerAnimated:)];
    [self.navigationItem setLeftBarButtonItem:leftBarButton];
    [leftBarButton release];
    

    
    self.findCityTextField = [[[UITextField alloc] initWithFrame:CGRectMake(20, 10, 280, 35)] autorelease];
    self.findCityTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.findCityTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    
    UIBarButtonItem *rightBarButton = [[UIBarButtonItem alloc] initWithTitle: NSLocalizedString(@"find.city.title", nil) style:UIBarButtonItemStyleDone target:self action:@selector(findCityAction:)];
   [self.navigationItem setRightBarButtonItem:rightBarButton];
   [rightBarButton release];

    self.orginalData = [NSArray array];
    
    [self.view addSubview:self.findCityTextField];
}


#pragma mark table delegates method

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CitySearchTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[CitySearchTableViewCell defaultDequeueDescription]];
    CDCityInfo *cityInfo = [self.orginalData objectAtIndex:indexPath.row];
    if (cell == nil) {
        cell = [[CitySearchTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:[CitySearchTableViewCell defaultDequeueDescription]];

        
        UIButton *addButton = [[[UIButton alloc] initWithFrame:CGRectMake(270, 12, 35, 35)] autorelease];
        addButton.tag = indexPath.row;
        [addButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [addButton setBackgroundImage:[UIImage imageNamed:@"plus.png"] forState:UIControlStateNormal];
        [addButton addTarget:self action:@selector(addCity:) forControlEvents:UIControlEventTouchUpInside];
        [cell addSubview:addButton];
        
        UIView *lineUp = [[UIView alloc] initWithFrame:CGRectMake(0, 0, cell.frame.size.width, 1)];
        lineUp.backgroundColor = [ColorDefined navigationBarColor];
        [cell addSubview:lineUp];

        if (indexPath.row == self.orginalData.count-1) {
            UIView *lineDown = [[UIView alloc] initWithFrame:CGRectMake(0, 60-1, cell.frame.size.width, 1)];
            lineDown.backgroundColor = [ColorDefined navigationBarColor];
            [cell addSubview:lineDown];

        }
//        CAGradientLayer *gradient = [CAGradientLayer layer];
//        gradient.frame = CGRectMake(0, 0, 320, 60);
//        gradient.colors = [NSArray arrayWithObjects:(id)[[ColorDefined tabbarDarkerColor] CGColor], (id)[[ColorDefined tabbarColor] CGColor], nil];
//        [cell.layer insertSublayer:gradient atIndex:0];
        
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%@",cityInfo.name];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Country Code: %@, Population: %lld", cityInfo.country, cityInfo.population];
    cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:16.0];
    cell.detailTextLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:12.0];

    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.orginalData count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60.0;
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

- (void) selectCity:(CDCityInfo*) city{
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(searchCityViewController:didDismissWithData:)]) {
        [self.delegate searchCityViewController:self didDismissWithData:city];
    }
    [self dismissModalViewControllerAnimated:YES];
}

- (void) didReceiveError:(NSError*) error{
    DebugLog(@"%@", error);
    
}
- (void) didReceiveResponse:(BasicResponseModel*) basicResponse fromCoreData:(BOOL)coreData{
    
    [self.findCityTextField resignFirstResponder];
    
    
    self.orginalData = basicResponse.list;
    if (self.searchTableView) {
        [UIView animateWithDuration:0.5 animations:^{
            self.searchTableView.alpha = 0.0;
        } completion:^(BOOL finished) {
            [self.searchTableView removeFromSuperview];
            self.searchTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 50, self.view.frame.size.width, self.view.frame.size.height-50) style:UITableViewStylePlain];
            self.searchTableView.delegate = self;
            self.searchTableView.dataSource = self;
            self.searchTableView.alpha = 0.0;
            self.searchTableView.backgroundColor = [UIColor clearColor];
            self.searchTableView.separatorColor = [UIColor clearColor];
            [self.view addSubview:self.searchTableView];
            [UIView animateWithDuration:0.5 animations:^{
                self.searchTableView.alpha = 1.0;
            } completion:^(BOOL finished) {
                [self.searchTableView reloadData];
            }];
        }];
    }else{
        self.searchTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 50, self.view.frame.size.width, self.view.frame.size.height-50) style:UITableViewStylePlain];
        self.searchTableView.delegate = self;
        self.searchTableView.dataSource = self;
        self.searchTableView.alpha = 0.0;
        self.searchTableView.backgroundColor = [UIColor clearColor];
        self.searchTableView.separatorColor = [UIColor clearColor];
        [self.view addSubview:self.searchTableView];
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
