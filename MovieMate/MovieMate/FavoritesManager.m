//
//  FavoritesManager.m
//  MovieMate
//
//  Created by Tadeusz Purtak on 10/10/2020.
//  Copyright © 2020 Litterae. All rights reserved.
//

#import "FavoritesManager.h"

@interface FavoritesManager ()

@property (nonatomic, nonnull) NSMutableSet<NSNumber *> *identifiers;

@end

@implementation FavoritesManager

+ (instancetype)shared {
    static FavoritesManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^ {
        sharedInstance = [[FavoritesManager alloc] init];
    });
    return sharedInstance;
}

- (BOOL)isFavorite:(NSInteger)itemIdentifier {
    return [[self identifiers] containsObject:[NSNumber numberWithInteger:itemIdentifier]];
}

- (void)setFavorite:(NSInteger)itemIdentifier favorite:(BOOL)yes {
    NSNumber *number = [NSNumber numberWithInteger:itemIdentifier];
    if (yes) {
        [[self identifiers] addObject:number];
    } else {
        if ([self isFavorite:itemIdentifier]) {
            [[self identifiers] removeObject:number];
        }
    }
}

- (void)toggle:(NSInteger)itemIdentifier {
    [self setFavorite:itemIdentifier favorite:![self isFavorite:itemIdentifier]];
}

@end
