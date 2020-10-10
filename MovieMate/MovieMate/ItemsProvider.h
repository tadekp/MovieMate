//
//  ItemsProvider.h
//  MovieMate
//
//  Created by Tadeusz Purtak on 10/10/2020.
//  Copyright © 2020 Litterae. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Items.h"

NS_ASSUME_NONNULL_BEGIN

typedef void (^ItemsResult)(id<Items> const _Nullable);

@protocol ItemsProvider <NSObject>

@required

@property (nonatomic, readonly) ItemType itemType;
@property (nonatomic, nonnull, retain, readonly) NSString *errorMessage;

- (void)loadItemsForPage:(NSInteger)page result:(ItemsResult _Nonnull)result;
- (id<Items> _Nonnull)createEmpty;

@end

NS_ASSUME_NONNULL_END
