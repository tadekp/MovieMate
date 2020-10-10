//
//  Favorites.h
//  MovieMate
//
//  Created by Tadeusz Purtak on 10/10/2020.
//  Copyright © 2020 Litterae. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Items.h"
#import "Favorite.h"

NS_ASSUME_NONNULL_BEGIN

@interface Favorites : NSObject <Items>

@property (nonatomic, readonly) NSInteger page;
@property (nonatomic, readonly) NSInteger totalPages;
@property (nonatomic, readonly) NSInteger totalResults;
@property (nonatomic, strong, readonly) NSArray<Favorite *> *items;

@end

NS_ASSUME_NONNULL_END
