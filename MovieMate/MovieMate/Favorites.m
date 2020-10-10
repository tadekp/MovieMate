//
//  Favorites.m
//  MovieMate
//
//  Created by Tadeusz Purtak on 10/10/2020.
//  Copyright © 2020 Litterae. All rights reserved.
//

#import "Favorites.h"

@implementation Favorites

@synthesize page = _page;
@synthesize totalPages = _totalPages;
@synthesize totalResults = _totalResults;
@synthesize items = _items;

- (NSInteger)count {
    return [[self items] count];
}

+ (id<Items> _Nonnull)createEmpty {
    return [[Favorites alloc] initEmpty];
}

- (id<Item> _Nullable)itemAt:(NSInteger)index {
    if (0 <= index && index < [[self items] count]) {
        return [[self items] objectAtIndex:index];
    } else {
        return nil;
    }
}

#pragma mark - Private initializer

- (instancetype)initEmpty {
    self = [super init];
    _page = 0;
    _totalPages = 1;
    _totalResults = 0;
    _items = @[];
    return self;
}

@end
