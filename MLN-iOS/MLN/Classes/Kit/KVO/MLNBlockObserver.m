//
//  MLNKVObserver.m
//  LuaNative
//
//  Created by tamer on 2020/1/15.
//  Copyright © 2020 liu.xu_1586. All rights reserved.
//

#import "MLNBlockObserver.h"
#import <MLNBlock.h>

@implementation MLNBlockObserver

- (instancetype)initWithBloclk:(MLNBlock *)block
{
    if (self = [super init]) {
        _block = block;
    }
    return self;
}

- (void)notify:(NSString *)keyPath newValue:(id)newValue oldValue:(id)oldValue
{
    [self.block addObjArgument:newValue];
    [self.block addObjArgument:oldValue];
    [self.block callIfCan];
}

@end
