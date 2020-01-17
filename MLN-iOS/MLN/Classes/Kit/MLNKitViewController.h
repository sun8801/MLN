//
//  MLNKitViewController.h.h
//  MLN
//
//  Created by MoMo on 2019/8/5.
//

#import <UIKit/UIKit.h>
#import "MLNViewControllerProtocol.h"
#import "MLNKitViewControllerDelegate.h"
#import "MLNExportProtocol.h"
#import "MLNKVObserverProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@class MLNKitInstance;
@class MLNKitInstanceHandlersManager;
@class MLNLuaBundle;
/**
 提供一个默认的包含MLNKitInstance的视图控制器
 */
@interface MLNKitViewController : UIViewController <MLNViewControllerProtocol> {
@protected MLNKitInstance *_kitInstance;
}

/**
 当前KitInstance
 */
@property (nonatomic, strong, readonly) MLNKitInstance *kitInstance;

/**
 入口文件
 */
@property (nonatomic, copy, readonly) NSString *entryFilePath;

/**
 传递给Lua的参数
 */
@property (nonatomic, copy, readonly) NSDictionary *extraInfo;

/**
 当前运行的运行的Bundle环境, 默认为Main Bundle
 */
@property (nonatomic, copy, readonly) NSString *currentBundlePath;

/**
 KitViewController的代理
 */
@property (nonatomic, weak) id<MLNKitViewControllerDelegate> delegate;

/**
 其他处理句柄的管理器
 */
@property (nonatomic, strong, readonly) MLNKitInstanceHandlersManager *handlerManager;


/**
 注册的bridge类数组
 */
@property (nonatomic, strong, readonly) NSArray<Class<MLNExportProtocol>> *regClasses;

/**
 是否隐藏导航栏
 */
@property (nonatomic, assign) BOOL statusBarHidden;

/**
 创建KitViewController
 
 @param entryFilePath 入口文件
 @return KitViewController
 */
- (instancetype)initWithEntryFilePath:(NSString *)entryFilePath;

/**
 创建KitViewController
 
 @param entryFilePath 入口文件
 @param extraInfo 传递给Lua的参数
 @return KitViewController
 */
- (instancetype)initWithEntryFilePath:(NSString *)entryFilePath extraInfo:(nullable NSDictionary *)extraInfo;

/**
 创建KitViewController
 
 @param entryFilePath 入口文件
 @param extraInfo 传递给Lua的参数
 @param regClasses 要注册的bridge类数组
 @return KitViewController
 */
- (instancetype)initWithEntryFilePath:(NSString *)entryFilePath extraInfo:(nullable NSDictionary *)extraInfo regClasses:(nullable NSArray<Class<MLNExportProtocol>> *)regClasses NS_DESIGNATED_INITIALIZER;
// 废弃默认的初始化方法
+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithCoder:(NSCoder *)aDecoder NS_UNAVAILABLE;
- (instancetype)initWithNibName:(nullable NSString *)nibNameOrNil bundle:(nullable NSBundle *)nibBundleOrNil NS_UNAVAILABLE;
/**
 更改Bundle环境,默认为Main Bundle
 
 @param bundlePath Bundle路径
 */
- (void)changeCurrentBundlePath:(NSString *)bundlePath;

/**
 更改Bundle环境,默认为Main Bundle
 
 @param bundle Lua Bundle
 */
- (void)changeCurrentBundle:(MLNLuaBundle *)bundle;

/**
 重新加载
 */
- (void)reload;

/**
 重新加载
 
 @param entryFilePath 要被加载的入口文件
 */
- (void)reloadWithEntryFilePath:(NSString *)entryFilePath;

/**
 重新加载
 
 @param entryFilePath 要被加载的入口文件
 @param bundlePath 入口文件所在的Bundle环境
 */
- (void)reloadWithEntryFilePath:(NSString *)entryFilePath bundlePath:(NSString *)bundlePath;

/**
 重新加载
 
 @param entryFilePath 要被加载的入口文件
 @param extraInfo 透传的参数
 @param bundlePath 入口文件所在的Bundle环境
 */
- (void)reloadWithEntryFilePath:(NSString *)entryFilePath extraInfo:(nullable NSDictionary *)extraInfo bundlePath:(NSString *)bundlePath;

/**
 注册Bridge
 
 @param registerClasses 要被注册的Bridge数组
 @return 是否成功
 */
- (BOOL)regClasses:(NSArray<Class<MLNExportProtocol>> *)registerClasses;

@end

@interface MLNKitViewController (DataBinding)

/**
通过id获取视图

@param identifier 视图对应的id
*/
- (UIView *)findViewById:(NSString *)identifier;

/**
模型数据绑定

@param data 要绑定的数据
@param key 访问数据的Key
*/
- (void)bindData:(NSObject *)data key:(NSString *)key;

/**
更新绑定的模型数据

@param keyPath 访问数据的Key
@param value 要更新的数据
*/
- (void)updateDataForKeyPath:(NSString *)keyPath value:(id)value;

/**
获取绑定的模型数据

@param keyPath 访问数据的Key
@return 对应的数据
*/
- (id __nullable)dataForKeyPath:(NSString *)keyPath;

/**
监听数据变化

@param observer 监听者
@param keyPath 访问数据的Key
*/
- (void)addDataObserver:(NSObject<MLNKVObserverProtocol> *)observer forKeyPath:(NSString *)keyPath;

@end

/**
声明访问某个Lua的视图

@param LUA_VIEW_CONTROLLER  Lua所属的视图控制器
@param VIEW_ID 访问视图的ID
*/
#define MLN_IMPORT_LUA_VIEW(LUA_VIEW_CONTROLLER, VIEW_ID)\
- (UIView *)VIEW_ID\
{\
return [(LUA_VIEW_CONTROLLER) findViewById: @#VIEW_ID];\
}

/**
声明访问某个Lua的视图,并声明别名。之后Native可以通过别名访问

@param LUA_VIEW_CONTROLLER  Lua所属的视图控制器
@param VIEW_ID 访问视图的ID
@param VIEW_ALIAS 访问视图的别名
*/
#define MLN_IMPORT_LUA_VIEW_WITH_ALIAS(LUA_VIEW_CONTROLLER, VIEW_ID, VIEW_ALIAS)\
- (UIView *)VIEW_ALIAS\
{\
return [(LUA_VIEW_CONTROLLER) findViewById: @#VIEW_ID];\
}


NS_ASSUME_NONNULL_END
