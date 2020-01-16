//
//  MLNDataBinding.h
//  LuaNative
//
//  Created by tamer on 2020/1/15.
//  Copyright © 2020 liu.xu_1586. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MLNKVObserverProtocol.h"

NS_ASSUME_NONNULL_BEGIN
@interface MLNDataBinding : NSObject

- (void)bindData:(NSObject *)data key:(NSString *)key;
- (void)updateDataForKeyPath:(NSString *)keyPath value:(id)value;
- (void)addDataObserver:(NSObject<MLNKVObserverProtocol> *)observer forKeyPath:(NSString *)keyPath;

@end

NS_ASSUME_NONNULL_END
