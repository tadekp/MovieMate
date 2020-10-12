//
//  SearchMoviesProvider.h
//  MovieMate
//
//  Created by Tadeusz Purtak on 12/10/2020.
//  Copyright © 2020 Litterae. All rights reserved.
//

#import "MoviesProvider.h"

NS_ASSUME_NONNULL_BEGIN

@interface SearchMoviesProvider : MoviesProvider

@property (nonatomic, strong) NSString *text;
@property (nonatomic, readonly) NSInteger minCharacters;
@property (nonatomic, readonly) NSInteger secondsDelay;

@end

NS_ASSUME_NONNULL_END
