

#import "DFSoundPlayer.h"
#import <AVFoundation/AVFoundation.h>

@interface DFSoundPlayer () <AVAudioPlayerDelegate>

@property (nonatomic, strong) AVAudioPlayer *player;

@property (nonatomic, strong) NSMutableArray *listOfSounds;

@end

@implementation DFSoundPlayer

- (void)playSoundWithFileName:(NSString *)fileName andExtension:(NSString *)extension {
    
    NSAssert(fileName != nil, @"👎 OMG you're stupid");
    NSAssert(extension != nil, @"👎 OMG you're stupid");

    NSString *filePath = [[NSBundle mainBundle] pathForResource:fileName ofType:extension];
    NSURL *url = [NSURL fileURLWithPath:[filePath lowercaseString]];
    
    NSAssert(url != nil, @"OMG!");
    
    NSError *error;
    self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    if (error) {
        NSLog(@"💩");
    }
    self.player.delegate = self;
    [self.player prepareToPlay];
    [self.player setVolume:1.0];
    [self.player play];
}

- (void)playAllWavSounds:(NSArray *)list {
    
    if (self.listOfSounds == nil) {
        self.listOfSounds = [NSMutableArray arrayWithArray:list];
    }
    
    [self playSoundWithFileName:[list firstObject] andExtension:@"wav"];
}

- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag {
    
    if (self.listOfSounds.count > 1) {
        [self.listOfSounds removeObjectAtIndex:0];
        [self playAllWavSounds:self.listOfSounds];
    } else {
        self.listOfSounds = nil;
    }
}


@end
