#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface CoreDataPoweredTableViewController : UITableViewController

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;


// PRIVATE PART, DON'T USE!

#warning CLEAN UP THIS MESS! THERE MUST BE A BETTER WAY!
@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic, strong) NSFetchRequest *fetchRequest;
@property (nonatomic) CGFloat defaultCellHeight;

- (BOOL)isLastCellAtIndexAtIndexPath:(NSIndexPath *)indexPath;

@end
