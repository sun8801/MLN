//
//  MLNDataBinding.m
//  LuaNative
//
//  Created by tamer on 2020/1/15.
//  Copyright © 2020 liu.xu_1586. All rights reserved.
//

#import "MLNDataBinding.h"
#import "MLNKVObserverHelper.h"
#import "MLNBlockObserver.h"
#import "MLNStaticExporterMacro.h"
#import "MLNKitHeader.h"
#import "MLNKitViewController.h"

@interface MLNDataBinding ()

@property (nonatomic, strong) NSMutableDictionary *dataMap;

@end
@implementation MLNDataBinding

- (instancetype)init
{
    if (self = [super init]) {
        _dataMap = [NSMutableDictionary dictionary];
    }
    return self;
}

- (void)bindData:(NSObject *)data key:(NSString *)key
{
    [self.dataMap setObject:data forKey:key];
}

- (void)addObserverForKeyPath:(NSString *)keyPath handler:(MLNBlock *)handler
{
    NSArray<NSString *> *keyPathArray = [keyPath componentsSeparatedByString:@"."];
    if (keyPathArray.count > 1) {
        NSString *firstKey = keyPathArray.firstObject;
        NSObject *data = [self.dataMap objectForKey:firstKey];
        NSString *secondKey = [keyPathArray objectAtIndex:1];
        MLNKVObserverHelper *helper = [[MLNKVObserverHelper alloc] initWithTargetObject:data keyPath:secondKey];
        NSObject<MLNKVObserverProtocol> *obs = [[MLNBlockObserver alloc] initWithBloclk:handler];
        [helper addObserver:obs];
        [_dataMap setValue:helper forKey:keyPath];
    }
}

+ (void)lua_bindDataForKeyPath:(NSString *)keyPath handler:(MLNBlock *)handler
{
    MLNKitViewController *vc = (MLNKitViewController *)MLN_KIT_INSTANCE([self mln_currentLuaCore]).viewController;
    [vc.dataBinding addObserverForKeyPath:keyPath handler:handler];
}

#pragma mark - Setup For Lua
LUA_EXPORT_STATIC_BEGIN(MLNDataBinding)
LUA_EXPORT_STATIC_METHOD(bind, "lua_bindDataForKeyPath:handler:", MLNDataBinding)
LUA_EXPORT_STATIC_END(MLNDataBinding, DataBinding, NO, NULL)

@end
