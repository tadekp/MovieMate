//
//  MoviesProvider.m
//  MovieMate
//
//  Created by Tadeusz Purtak on 10/10/2020.
//  Copyright © 2020 Litterae. All rights reserved.
//

#import "MoviesProvider.h"
#import "Movies.h"
#import "Backend.h"

@interface MoviesProvider ()
@end

@implementation MoviesProvider

@synthesize itemType = _itemType;
@synthesize errorMessage = _errorMessage;
@synthesize backend = _backend;

- (instancetype)init {
    self = [super init];
    _backend = [[Backend alloc] init];
    _itemType = kMovie;
    return self;
}

- (void)loadItemsForPage:(NSInteger)page result:(ItemsResult)result {
    [self.backend requestNowPlayingMoviesForPage:(int)page + 1
                                          result:
     ^(const Movies * _Nullable movies, NSString * _Nullable errorMessage) {
        self->_errorMessage = errorMessage;
        result(movies);
    }];
}

- (void)loadMovieDetailsFor:(NSInteger)movieIdentifier result:(MovieDetailsResult)result {
    [self.backend requestMovieDetailsOf:movieIdentifier
                                 result:
     ^(MovieDetails * _Nullable movieDetails, NSString * _Nullable errorMessage) {
        self->_errorMessage = errorMessage;
        result(movieDetails, errorMessage);
    }];
}

- (id<Items> _Nonnull)createEmpty {
    return [Movies createEmpty];
}

@end
