//
//  Movies.h
//  MovieMate
//
//  Created by Tadeusz Purtak on 07/10/2020.
//  Copyright © 2020 Litterae. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CommonTypes.h"
#import "Movie.h"

NS_ASSUME_NONNULL_BEGIN

@class ImageLoader;

@interface Movies : NSObject

@property (nonatomic, readonly) NSInteger page;
@property (nonatomic, readonly) NSInteger totalPages;
@property (nonatomic, readonly) NSInteger totalResults;
@property (nonatomic, strong, readonly) NSArray<Movie*> *items;

- (instancetype) initWith:(NSDictionary * _Nonnull)dictionary andImageLoader:(nonnull ImageLoader *)loader;

@end

NS_ASSUME_NONNULL_END
