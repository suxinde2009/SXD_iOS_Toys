#import "CoreDataPoweredTableViewController.h"
#import "CoreDataPoweredFetchResultsControllerHelper.h"

@interface CoreDataPoweredTableViewController ()

@property (nonatomic, strong) CoreDataPoweredFetchResultsControllerHelper *helper;

@end

@implementation CoreDataPoweredTableViewController

@synthesize fetchedResultsController = _fetchedResultsController;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.helper = [[CoreDataPoweredFetchResultsControllerHelper alloc] initWithTableView:self.tableView andBlockToUpdateCells:^(NSIndexPath *indexPath) {
          [self configureCell:[self.tableView cellForRowAtIndexPath:indexPath] atIndexPath:indexPath];
    }];
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    NSLog(@"Fella you're running low on memory!");
}

#pragma mark - NSFetchResultController creation

- (NSFetchedResultsController *)fetchedResultsController
{
    if (_fetchedResultsController != nil) {
        return _fetchedResultsController;
    }
    
    NSAssert(self.fetchRequest != nil, @"Fella, pass me a FetchRequest to show!");
    NSAssert(self.managedObjectContext != nil, @"Bro, you forgot to pass me a Context!");
    
    _fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:self.fetchRequest managedObjectContext:self.managedObjectContext sectionNameKeyPath:nil cacheName:@"Master"];
    _fetchedResultsController.delegate = self.helper;
    
    NSError *error = nil;
    if (![self.fetchedResultsController performFetch:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _fetchedResultsController;
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.fetchedResultsController sections].count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    id <NSFetchedResultsSectionInfo> sectionInfo = [self.fetchedResultsController sections][section];
    return [sectionInfo numberOfObjects] + 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell;
    
    if ([self isLastCellAtIndexAtIndexPath:indexPath]) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"DeleteAllCell" forIndexPath:indexPath];
    }
    else {
        cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
        [self configureCell:cell atIndexPath:indexPath];
    }
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([self isLastCellAtIndexAtIndexPath:indexPath]) {
        return NO;
    }
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.managedObjectContext deleteObject:[self.fetchedResultsController objectAtIndexPath:indexPath]];
        [self.managedObjectContext save:nil];
    }
}

#define HEIGHT_DELETE_ROW 60.0

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if ([self isLastCellAtIndexAtIndexPath:indexPath]) {
        return HEIGHT_DELETE_ROW;
    }
    NSAssert(self.defaultCellHeight != 0.0, @"CELL HEIGHT!");
    
    return self.defaultCellHeight;
}


- (BOOL)isLastCellAtIndexAtIndexPath:(NSIndexPath *)indexPath {
    id <NSFetchedResultsSectionInfo> sectionInfo = [self.fetchedResultsController sections][indexPath.section];
    if ([sectionInfo numberOfObjects] == indexPath.row) {
        return YES;
    }
    
    return NO;
}

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
}


@end
