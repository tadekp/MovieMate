//
//  MovieDetails.h
//  MovieMate
//
//  Created by Tadeusz Purtak on 10/10/2020.
//  Copyright © 2020 Litterae. All rights reserved.
//

#import "Movie.h"

NS_ASSUME_NONNULL_BEGIN

@interface MovieDetails : Movie

@property (nonatomic, strong, readonly) NSString *homepage;

@end

typedef void (^MovieDetailsResult)(MovieDetails const* _Nullable, NSString * _Nullable);

NS_ASSUME_NONNULL_END
