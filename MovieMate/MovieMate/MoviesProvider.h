//
//  MoviesProvider.h
//  MovieMate
//
//  Created by Tadeusz Purtak on 10/10/2020.
//  Copyright © 2020 Litterae. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ItemsProvider.h"
#import "MovieDetails.h"

NS_ASSUME_NONNULL_BEGIN

@interface MoviesProvider : NSObject <ItemsProvider>

- (instancetype)init;

- (void)loadMovieDetailsFor:(NSInteger)movieIdentifier result:(MovieDetailsResult _Nonnull)result;

@end

NS_ASSUME_NONNULL_END
