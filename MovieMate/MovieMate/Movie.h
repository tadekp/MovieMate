//
//  Movie.h
//  MovieMate
//
//  Created by Tadeusz Purtak on 07/10/2020.
//  Copyright © 2020 Litterae. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Item.h"

NS_ASSUME_NONNULL_BEGIN

@interface Movie : NSObject <Item>

#pragma mark - Item properties
@property (nonatomic, readonly) ItemType itemType;
@property (nonatomic, readonly) NSInteger identifier;
@property (nonatomic, strong, readonly) NSString *title;
@property (nonatomic, strong, readonly) NSDate *releaseDate;
@property (nonatomic, strong, readonly) NSNumber *voteAverage;
@property (nonatomic, strong, readonly) NSString *imagePath;

#pragma mark - Specific properties
@property (nonatomic, strong, readonly) NSString *posterPath;
@property (nonatomic, strong, readonly) NSString *backdropPath;
@property (nonatomic, readonly) NSInteger voteCount;
@property (nonatomic, strong, readonly) NSString *overview;

- (instancetype)initWith:(NSDictionary * _Nonnull)dictionary;

@end

NS_ASSUME_NONNULL_END
