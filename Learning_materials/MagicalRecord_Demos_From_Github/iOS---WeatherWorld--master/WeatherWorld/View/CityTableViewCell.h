//
//  CityTableViewCell.h
//  WeatherWorld
//
//  Created by Diego Freniche Brito on 05/11/14.
//  Copyright (c) 2014 Pol Quintana. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "City.h"

@interface CityTableViewCell : UITableViewCell

- (void)updateCellUsingCity:(City *)city;

@end
