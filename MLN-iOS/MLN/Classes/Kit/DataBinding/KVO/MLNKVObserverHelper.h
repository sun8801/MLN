//
//  MLNKVObserverHelper.h
//  LuaNative
//
//  Created by tamer on 2020/1/15.
//  Copyright © 2020 liu.xu_1586. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MLNKVObserverProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface MLNKVObserverHelper : NSObject

@property (nonatomic, weak, readonly) NSObject *targetObject;
@property (nonatomic, strong, readonly) NSSet<NSObject<MLNKVObserverProtocol> *> *observerSet;
@property (nonatomic, copy, readonly) NSString *keyPath;

- (instancetype)initWithTargetObject:(NSObject *)targetObject keyPath:(NSString *)keyPath;

- (void)addObserver:(NSObject<MLNKVObserverProtocol> *)observer;

@end

NS_ASSUME_NONNULL_END
