//
//  LDMasterViewController.m
//  MagicalImportExample
//
//  Created by Denis Lebedev on 6/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LDMasterViewController.h"
#import "LDDetailViewController.h"
#import "LDFourSquareAPIClient.h"

#import "Venue.h"
#import "VenueCell.h"
#import "Location.h"

#define kCLIENTID "HDEHROGPMARZ2O1JTK55VHXE4TTNGE0NQR4DBCKHFZULURJV"
#define kCLIENTSECRET "ILG5POWGBRBZDXLNPAGECAZOBC0KFPQAQ5SYOP51KFYANZ1B"

@interface LDMasterViewController ()

- (void)configureCell:(VenueCell *)cell atIndexPath:(NSIndexPath *)indexPath;

@property (nonatomic, strong) NSArray *data;

@end

@implementation LDMasterViewController

@synthesize data;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *latLon = @"48.858,2.2944";
    NSString *clientID = [NSString stringWithUTF8String:kCLIENTID];
    NSString *clientSecret = [NSString stringWithUTF8String:kCLIENTSECRET];
    NSDictionary *queryParams;
    queryParams = [NSDictionary dictionaryWithObjectsAndKeys:latLon, @"ll", clientID, @"client_id", clientSecret, @"client_secret", @"20120602", @"v", nil];

    [[LDFourSquareAPIClient sharedClient] getPath:@"v2/venues/search" parameters:queryParams success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSArray *venues = [[responseObject objectForKey:@"response"] objectForKey:@"venues"];
        
        NSMutableArray *arr = [NSMutableArray array];
        for (NSDictionary *venueDict in venues) {
            [arr addObject:[Venue MR_importFromObject:venueDict]];
        }
        //[Venue MR_importFromArray:venues];
        self.data = arr;
        [self.tableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}

#pragma mark - Table View

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    VenueCell *cell = [tableView dequeueReusableCellWithIdentifier:@"VenueCell"];
    [self configureCell:cell atIndexPath:indexPath];
    return cell;
}

- (void)configureCell:(VenueCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    Venue *venue = [self.data objectAtIndex:indexPath.row];
    cell.nameLabel.text = [venue name];
    cell.distanceLabel.text = [NSString stringWithFormat:@"%d", [[venue.location distance] intValue]];
    cell.checkinsLabel.text = [NSString stringWithFormat:@"%d", [[venue checkins] intValue]];
}

@end
