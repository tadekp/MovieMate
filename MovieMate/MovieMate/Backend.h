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

@class Movies;

typedef void (^MoviesResult)(Movies const* _Nullable, NSString * _Nullable);

@interface Backend : NSObject

- (instancetype _Nonnull)init;
- (void)requestNowPlayingMoviesForPage:(int)page result:(MoviesResult _Nonnull)result;

@end

#endif /* Backend_h */
