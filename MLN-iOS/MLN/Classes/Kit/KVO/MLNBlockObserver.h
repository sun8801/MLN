//
//  MLNKVObserver.h
//  LuaNative
//
//  Created by tamer on 2020/1/15.
//  Copyright © 2020 liu.xu_1586. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MLNKVObserverProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@class MLNBlock;
@interface MLNBlockObserver : NSObject <MLNKVObserverProtocol>

@property (nonatomic, strong, readonly) MLNBlock *block;

- (instancetype)initWithBloclk:(MLNBlock *)block;

@end

NS_ASSUME_NONNULL_END
