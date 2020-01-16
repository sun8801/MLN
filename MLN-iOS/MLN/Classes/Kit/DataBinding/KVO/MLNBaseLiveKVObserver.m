//
//  MLNLiveKVObserver.m
//  MLN
//
//  Created by tamer on 2020/1/16.
//

#import "MLNBaseLiveKVObserver.h"
#import <pthread.h>

@interface MLNBaseLiveKVObserver () {
    pthread_mutex_t _lock;
}

@property (nonatomic, copy) void(^notifyLiveStickyBlock)(void);

@end
@implementation MLNBaseLiveKVObserver

- (instancetype)init
{
    self = [super init];
    if (self) {
        pthread_mutex_init(&_lock, NULL);
        _active = YES;
    }
    return self;
}

- (void)dealloc
{
     pthread_mutex_destroy(&_lock);
}

@synthesize active = _active;
- (void)setActive:(BOOL)active
{
    _active = active;
    if (active && self.notifyLiveStickyBlock) {
        self.notifyLiveStickyBlock();
        pthread_mutex_lock(&_lock);
        self.notifyLiveStickyBlock = nil;
        pthread_mutex_unlock(&_lock);
    }
}

- (void)notify:(NSString *)keyPath newValue:(id)newValue oldValue:(id)oldValue
{
    if (!self.isActive) {
        __weak typeof(self) wself = self;
        pthread_mutex_lock(&_lock);
        self.notifyLiveStickyBlock = ^{
            __strong typeof(wself) sself = wself;
            [sself notifyLiveForKeyPath:keyPath newValue:newValue oldValue:oldValue];
        };
        pthread_mutex_unlock(&_lock);
    } else {
        [self notifyLiveForKeyPath:keyPath newValue:newValue oldValue:oldValue];
    }
}

- (void)notifyLiveForKeyPath:(NSString *)keyPath newValue:(id)newValue oldValue:(id)oldValue
{
    
}

@end
