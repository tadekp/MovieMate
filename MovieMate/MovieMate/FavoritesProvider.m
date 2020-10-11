//
//  FavoritesProvider.m
//  MovieMate
//
//  Created by Tadeusz Purtak on 10/10/2020.
//  Copyright © 2020 Litterae. All rights reserved.
//

#import "FavoritesProvider.h"
#import "Favorites.h"
#import "Item.h"

@interface FavoritesProvider ()
@property (nonatomic, strong) NSMutableDictionary<NSString*, id<Item>> *items;
@end

@implementation FavoritesProvider

@synthesize itemType = _itemType;
@synthesize errorMessage = _errorMessage;

- (instancetype)init {
    self = [super init];
    [self setItems:[[NSMutableDictionary alloc] init]];
    _itemType = kFavorite;
    return self;
}

- (id<Items> _Nonnull)createEmpty {
    return [Favorites createEmpty];
}

- (void)add:(id<Item>)item {
    [[self items] setObject:item forKey:[self stringIdentifierOf:item]];
}

- (void)remove:(id<Item>)item {
    [[self items] removeObjectForKey:[self stringIdentifierOf:item]];
}

- (void)loadItemsForPage:(NSInteger)page result:(ItemsResult _Nonnull)result {
    Favorites *favorites = [[Favorites alloc] initWith:[[self items] allValues]];
    result(favorites);
}

- (NSString *)stringIdentifierOf:(id<Item>)item {
    return [NSString stringWithFormat:@"%ld", [item identifier]];
}

@end
