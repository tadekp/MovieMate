//
//  FavoritesProvider.m
//  MovieMate
//
//  Created by Tadeusz Purtak on 10/10/2020.
//  Copyright © 2020 Litterae. All rights reserved.
//

#import "FavoritesProvider.h"

@implementation FavoritesProvider

@synthesize itemType = _itemType;
@synthesize errorMessage = _errorMessage;

- (instancetype)init {
    self = [super init];
    _itemType = kFavorite;
    return self;
}

- (id<Items> _Nonnull)createEmpty {
    return nil;
}

- (void)loadItemsForPage:(NSInteger)page result:(ItemsResult _Nonnull)result {
}

@end
