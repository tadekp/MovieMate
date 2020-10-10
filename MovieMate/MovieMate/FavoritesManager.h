//
//  FavoritesManager.h
//  MovieMate
//
//  Created by Tadeusz Purtak on 10/10/2020.
//  Copyright © 2020 Litterae. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Item.h"

NS_ASSUME_NONNULL_BEGIN

@class FavoritesProvider;

@interface FavoritesManager : NSObject

@property (readonly, strong) NSPersistentContainer *persistentContainer;
@property (nonatomic, strong, readonly) FavoritesProvider *provider;

+ (instancetype)shared;

- (BOOL)isFavorite:(id<Item>)item;
- (void)setFavorite:(id<Item>)item favorite:(BOOL)yes;
- (void)toggle:(id<Item>)item;

@end

NS_ASSUME_NONNULL_END
