//
//  Movies.h
//  MovieMate
//
//  Created by Tadeusz Purtak on 07/10/2020.
//  Copyright © 2020 Litterae. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Items.h"
#import "Movie.h"

NS_ASSUME_NONNULL_BEGIN

@interface Movies : NSObject <Items>

@property (nonatomic, readonly) NSInteger page;
@property (nonatomic, readonly) NSInteger totalPages;
@property (nonatomic, readonly) NSInteger totalResults;
@property (nonatomic, strong, readonly) NSArray<Movie *> *items;

- (instancetype) initWith:(NSDictionary * _Nonnull)dictionary;

@end

typedef void (^MoviesResult)(Movies* _Nullable, NSString * _Nullable);

NS_ASSUME_NONNULL_END
