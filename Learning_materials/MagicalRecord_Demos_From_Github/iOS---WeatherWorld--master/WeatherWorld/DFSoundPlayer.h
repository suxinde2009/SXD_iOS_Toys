//
//  DFSoundPlayer.h
//  WeatherWorld
//
//  Created by Diego Freniche Brito on 05/11/14.
//  Copyright (c) 2014 Pol Quintana. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DFSoundPlayer : NSObject

- (void)playSoundWithFileName:(NSString *)fileName andExtension:(NSString *)extension;
- (void)playAllWavSounds:(NSArray *)list;


@end
