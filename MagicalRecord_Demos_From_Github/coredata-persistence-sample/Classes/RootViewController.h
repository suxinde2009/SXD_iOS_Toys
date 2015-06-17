//
//  RootViewController.h
//  PersistenceSample
//
//  Created by Ing. Jozef Bozek on 27.12.2010.
//  Copyright 2010 bring-it-together s.r.o. All rights reserved.
//

#import "DAOBase.h"

@interface MyCustomDAO : DAO
{
	
}

@end


@interface RootViewController : UITableViewController <NSFetchedResultsControllerDelegate> {
	NSFetchedResultsController *fetchedResultsController;
	
}

@property (nonatomic, retain) NSFetchedResultsController *fetchedResultsController;

@end
