//
//  FavoritesManager+CRUD.h
//  MovieMate
//
//  Created by Tadeusz Purtak on 11/10/2020.
//  Copyright © 2020 Litterae. All rights reserved.
//

#import "FavoritesManager.h"
#import "Item.h"

NS_ASSUME_NONNULL_BEGIN

@interface FavoritesManager (CRUD)

- (BOOL)createRecord:(id<Item>)item;
- (nonnull NSArray<id<Item>> *)readRecords;
- (BOOL)updateRecord:(id<Item>)item;
- (BOOL)deleteRecord:(id<Item>)item;

@end

NS_ASSUME_NONNULL_END
