#import "CoreDataPoweredFetchResultsControllerHelper.h"

@interface CoreDataPoweredFetchResultsControllerHelper ()

@property (nonatomic, weak) UITableView *tableView;

@property (nonatomic, strong)  void(^blockToExecuteWhenYouNeedToUpdateYourCell)(NSIndexPath *indexPath);

@end

@implementation CoreDataPoweredFetchResultsControllerHelper

#pragma mark - Fetched results controller


- (instancetype)initWithTableView:(UITableView *)tableView andBlockToUpdateCells:(void (^)(NSIndexPath *))block {
    self = [super init];
    if (self) {
        _tableView = tableView;
        _blockToExecuteWhenYouNeedToUpdateYourCell = block;
    }
    return self;
}

- (instancetype)init {
    NSAssert(NO, @"WAY!");
    return nil;
}

- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller
{
    [self.tableView beginUpdates];
}

- (void)controller:(NSFetchedResultsController *)controller didChangeSection:(id <NSFetchedResultsSectionInfo>)sectionInfo
           atIndex:(NSUInteger)sectionIndex forChangeType:(NSFetchedResultsChangeType)type
{
    switch(type) {
        case NSFetchedResultsChangeInsert:
            [self.tableView insertSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [self.tableView deleteSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        default:
            return;
    }
}

- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject
       atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type
      newIndexPath:(NSIndexPath *)newIndexPath
{
    UITableView *tableView = self.tableView;
    
    switch(type) {
        case NSFetchedResultsChangeInsert:
            [tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeUpdate:

            self.blockToExecuteWhenYouNeedToUpdateYourCell(indexPath);
            break;
            
        case NSFetchedResultsChangeMove:
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            [tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller
{
    [self.tableView endUpdates];
}

@end
