//
//  MLNLiveKVObserver.h
//  MLN
//
//  Created by tamer on 2020/1/16.
//

#import <Foundation/Foundation.h>
#import "MLNLiveKVObserverProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface MLNBaseLiveKVObserver : NSObject <MLNLiveKVObserverProtocol> {
    @protected BOOL _active;
}

@end

NS_ASSUME_NONNULL_END
