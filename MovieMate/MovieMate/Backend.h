//
//  Backend.h
//  MovieMate
//
//  Created by Tadeusz Purtak on 07/10/2020.
//  Copyright © 2020 Litterae. All rights reserved.
//

#ifndef Backend_h
#define Backend_h

#import "CommonTypes.h"

@interface Backend : NSObject

- (instancetype _Nonnull)init;
- (void)requestNowPlayingMoviesForPage:(int)page result:(MoviesResult _Nonnull)result;

@end

#endif /* Backend_h */
