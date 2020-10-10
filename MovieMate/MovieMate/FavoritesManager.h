//
//  FavoritesManager.h
//  MovieMate
//
//  Created by Tadeusz Purtak on 10/10/2020.
//  Copyright © 2020 Litterae. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class FavoritesProvider;

@interface FavoritesManager : NSObject

@property (nonatomic, strong, readonly) FavoritesProvider *provider;

+ (instancetype)shared;

- (BOOL)isFavorite:(NSInteger)itemIdentifier;
- (void)setFavorite:(NSInteger)itemIdentifier favorite:(BOOL)yes;
- (void)toggle:(NSInteger)itemIdentifier;

@end

NS_ASSUME_NONNULL_END
