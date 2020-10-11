//
//  Favorite.h
//  MovieMate
//
//  Created by Tadeusz Purtak on 11/10/2020.
//  Copyright © 2020 Litterae. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Item.h"

NS_ASSUME_NONNULL_BEGIN

@class FavoriteRecord;

@interface Favorite : NSObject <Item>

#pragma mark - Item properties
@property (nonatomic, readonly) ItemType itemType;
@property (nonatomic, readonly) NSInteger identifier;
@property (nonatomic, strong, readonly) NSString *title;
@property (nonatomic, strong, readonly) NSDate *releaseDate;
@property (nonatomic, strong, readonly) NSNumber *voteAverage;
@property (nonatomic, strong, readonly) NSString *imagePath;

- (instancetype)initWithCoreDataRecord:(nonnull FavoriteRecord *)record;

@end

NS_ASSUME_NONNULL_END
