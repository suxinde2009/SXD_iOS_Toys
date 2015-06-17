#import <CoreData/CoreData.h>
#import <UIKit/UIKit.h>

@interface CoreDataPoweredFetchResultsControllerHelper : NSObject <NSFetchedResultsControllerDelegate>

- (instancetype)initWithTableView:(UITableView *)tableView andBlockToUpdateCells:(void (^)(NSIndexPath *indexPath))block;

@end
