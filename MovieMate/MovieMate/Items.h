//
//  Items.h
//  MovieMate
//
//  Created by Tadeusz Purtak on 10/10/2020.
//  Copyright © 2020 Litterae. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Item.h"

NS_ASSUME_NONNULL_BEGIN

@protocol Items <NSObject>

@required

@property (nonatomic, readonly) NSInteger page;
@property (nonatomic, readonly) NSInteger totalPages;
@property (nonatomic, readonly) NSInteger totalResults;
@property (nonatomic, strong, readonly) NSArray<id<Item>> *items;

+ (id<Items> _Nonnull)createEmpty;

- (NSInteger)count;
- (id<Item> _Nullable)itemAt:(NSInteger)index;

@end

NS_ASSUME_NONNULL_END
