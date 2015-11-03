//
//  MasterViewController.m
//  WeatherWorld
//
//  Created by Pol Quintana on 4/11/14.
//  Copyright (c) 2014 Pol Quintana. All rights reserved.
//

#import "CountryViewController.h"
#import "CountryDetailViewController.h"
#import <CoreData/CoreData.h>
#import "City.h"
#import "DFSoundPlayer.h"
#import "OpenWeatherMap.h"
#import "CityTableViewCell.h"

@interface CountryViewController () <NSFetchedResultsControllerDelegate>


@property (nonatomic, strong) DFSoundPlayer *player;

@end

@implementation CountryViewController

#pragma mark - Table View


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if ([self isLastCellAtIndexAtIndexPath:indexPath]) {
        NSLog(@"Removing");
        [City deleteAllInContext:self.managedObjectContext];
    }
    
}

- (IBAction)deleteButton:(id)sender {
    [City deleteAllInContext:self.managedObjectContext];
}

#pragma mark - Related to TableView

- (void)insertNewObject:(id)sender {
    self.player = [[DFSoundPlayer alloc] init];
//     [self.player playSoundWithFileName:@"iiihii" andExtension:@"wav"];
//    
//    [self.player playAllWavSounds:@[@"ioputarl",
//                                    @"iiihii",
//                                    @"ioputarl",
//                                    @"iiihii",
//                                    @"ioputarl"]];
    
    City *bcn = [City insertInManagedObjectContext:self.managedObjectContext];
    bcn.name = @"Barcelona";
    bcn.latitude = @41;
    bcn.longitude = @2;
    
    NSError *error = nil;
    if (![self.managedObjectContext save:&error]) {
        
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
}

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    CityTableViewCell *myCell = (CityTableViewCell *)cell;
    
    City *city = [self.fetchedResultsController objectAtIndexPath:indexPath];

    [myCell updateCellUsingCity:city];
}

#pragma mark - System

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.defaultCellHeight = 120.0;
    
    self.fetchRequest = [City allCountersFetchRequestInContext:self.managedObjectContext];
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    
    UIBarButtonItem *refreshButton =[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(refreshWeatherData)];
    
    
    self.navigationItem.rightBarButtonItems = @[ addButton, refreshButton];
}


#pragma mark - Refresh data

- (void)refreshWeatherData {
    NSLog(@"refresh");
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        NSArray *cities = [self.fetchedResultsController fetchedObjects];
        
        NSAssert([NSThread currentThread] != [NSThread mainThread], @"");
        
        for (City *city in cities) {
            // get data from internet using city name
            OpenWeatherMap *map = [[OpenWeatherMap alloc] init];
            
            NSDictionary *d = [map weatherInfoForCity:city.name];
            
            // update this CD object
            [city updateCityDataUsingWeatherData:d];
            [self.managedObjectContext save:nil];

        }
        NSLog(@"refresh END");


    });
    
    }

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        City *city = [self.fetchedResultsController objectAtIndexPath:indexPath];
        CountryDetailViewController *vc = (CountryDetailViewController *)[segue destinationViewController];
        vc.detailItem = city;
    }
}


@end
