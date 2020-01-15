//
//  MLNDataBinding.h
//  LuaNative
//
//  Created by tamer on 2020/1/15.
//  Copyright © 2020 liu.xu_1586. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MLNStaticExportProtocol.h"

NS_ASSUME_NONNULL_BEGIN
@class MLNBlock;
@interface MLNDataBinding : NSObject <MLNStaticExportProtocol>

- (void)bindData:(NSObject *)data key:(NSString *)key;
- (void)addObserverForKeyPath:(NSString *)keyPath handler:(MLNBlock *)handler;

@end

NS_ASSUME_NONNULL_END
