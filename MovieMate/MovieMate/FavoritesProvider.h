//
//  FavoritesProvider.h
//  MovieMate
//
//  Created by Tadeusz Purtak on 10/10/2020.
//  Copyright © 2020 Litterae. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ItemsProvider.h"
#import "Item.h"

NS_ASSUME_NONNULL_BEGIN

@interface FavoritesProvider : NSObject <ItemsProvider>

- (void)add:(nonnull id<Item>)item;
- (void)remove:(nonnull id<Item>)item;

@end

NS_ASSUME_NONNULL_END
