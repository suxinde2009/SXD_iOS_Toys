//
//  CityTableViewCell.m
//  WeatherWorld
//
//  Created by Diego Freniche Brito on 05/11/14.
//  Copyright (c) 2014 Pol Quintana. All rights reserved.
//

#import "CityTableViewCell.h"
#import <FBBitmapFontView.h>
#import "UIImageView+IHWebImage.h"

@interface CityTableViewCell () {
    BOOL firstTime;
}
@property (weak, nonatomic) IBOutlet FBBitmapFontView *cityName;
@property (weak, nonatomic) IBOutlet UIImageView *weatherIcon;

@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) City *myCity;

@end

@implementation CityTableViewCell

- (void)updateCellUsingCity:(City *)city {
    self.myCity = city;
    
    self.cityName.text = city.name;
    self.cityName.numberOfBottomPaddingDot = 1;
    self.cityName.numberOfTopPaddingDot    = 1;
    self.cityName.numberOfLeftPaddingDot   = 2;
    self.cityName.numberOfRightPaddingDot  = 2;
    self.cityName.glowSize = 20.0;
    self.cityName.innerGlowSize = 3.0;
    self.cityName.edgeLength = 5.0;
    [self.cityName resetSize];
    
    NSString *image = [NSString stringWithFormat:@"http://openweathermap.org/img/w/%@.png" , city.icon];
    NSURL *imageUrl = [NSURL URLWithString:image];
    
    [self.weatherIcon ih_setImageFromURL:imageUrl completion:nil];
    
}

- (void)awakeFromNib {
    // Initialization code
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(updateTimer) userInfo:nil repeats:YES];
}



- (void)updateTimer {
    
    if (firstTime) {
        //NSLog(@"🐷🐷🐷  AWESOME!");
        
        self.cityName.text = self.myCity.name;
        [self.cityName resetSize];

    } else {
        self.cityName.text = [self.myCity.temp stringValue];
        [self.cityName resetSize];

        //NSLog(@"🐤🐤🐤  AWESOME!");
    }
    
    firstTime = !firstTime;
    
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dealloc {
    [self.timer invalidate];
    self.timer = nil;
}

@end
