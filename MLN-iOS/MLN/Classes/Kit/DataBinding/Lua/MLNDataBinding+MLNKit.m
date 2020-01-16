//
//  MLNDataBinding+MLNKit.m
//  MLN
//
//  Created by tamer on 2020/1/16.
//

#import "MLNDataBinding+MLNKit.h"
#import "MLNBlockObserver.h"
#import "MLNStaticExporterMacro.h"
#import "MLNKitHeader.h"
#import "MLNKitViewController.h"

@implementation MLNDataBinding (MLNKit)

+ (void)lua_bindDataForKeyPath:(NSString *)keyPath handler:(MLNBlock *)handler
{
    MLNKitViewController *kitViewController = (MLNKitViewController *)MLN_KIT_INSTANCE([self mln_currentLuaCore]).viewController;
    NSObject<MLNKVObserverProtocol> *observer = [[MLNBlockObserver alloc] initWithBloclk:handler];
    [kitViewController addDataObserver:observer forKeyPath:keyPath];
}

#pragma mark - Setup For Lua
LUA_EXPORT_STATIC_BEGIN(MLNDataBinding)
LUA_EXPORT_STATIC_METHOD(bind, "lua_bindDataForKeyPath:handler:", MLNDataBinding)
LUA_EXPORT_STATIC_END(MLNDataBinding, DataBinding, NO, NULL)

@end
