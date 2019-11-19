//
//  MLNAutoFitTableView.h
//  MLN
//
//  Created by tamer on 2019/11/19.
//

#import <UIKit/UIKit.h>
#import "MLNScrollViewDelegate.h"
#import "MLNTableViewAdapterProtocol.h"

NS_ASSUME_NONNULL_BEGIN
@class MLNAdapterCachesManager;
@class MLNBlock;
@interface MLNAutoresizingTableViewAdapter : MLNScrollViewDelegate <MLNTableViewAdapterProtocol>

@property (nonatomic, weak) UITableView *targetTableView;
@property (nonatomic, strong, readonly) NSMutableDictionary<NSString *, MLNBlock *> *initedCellCallbacks;
@property (nonatomic, strong, readonly) NSMutableDictionary<NSString *, MLNBlock *> *fillCellDataCallbacks;
@property (nonatomic, strong, readonly) NSMutableDictionary<NSString *, MLNBlock *> *heightForRowCallbacks;

// caches
@property (nonatomic, strong, readonly) MLNAdapterCachesManager *cachesManager;

- (NSString *)reuseIdAt:(NSIndexPath *)indexPath;
- (MLNBlock *)initedCellCallbackByReuseId:(NSString *)reuseId;
- (MLNBlock *)fillCellDataCallbackByReuseId:(NSString *)reuseId;


@end

NS_ASSUME_NONNULL_END
