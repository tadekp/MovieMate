//
//  Backend.h
//  MovieMate
//
//  Created by Tadeusz Purtak on 07/10/2020.
//  Copyright © 2020 Litterae. All rights reserved.
//

#ifndef Backend_h
#define Backend_h

#import "Types.h"
#import "Movies.h"
#import "MovieDetails.h"

@class Movies;
@class MovieDetails;

@interface Backend : NSObject

- (instancetype _Nonnull)init;
- (void)requestNowPlayingMoviesForPage:(int)page result:(nonnull MoviesResult)result;
- (void)requestSearch:(nonnull NSString *)text atPage:(int)page result:(nonnull MoviesResult)result;
- (void)requestMovieDetailsOf:(NSInteger)movieIdentifier result:(nonnull MovieDetailsResult)result;

@end

#endif /* Backend_h */
