//
//  Movie.m
//  MovieMate
//
//  Created by Tadeusz Purtak on 07/10/2020.
//  Copyright © 2020 Litterae. All rights reserved.
//

#import "Movie.h"
#import "NSDictionary+Utils.h"

@implementation Movie

@synthesize identifier = _identifier;
@synthesize title = _title;
@synthesize releaseDate = _releaseDate;
@synthesize voteAverage = _voteAverage;
@synthesize imagePath = _imagePath;
@synthesize voteCount = _voteCount;
@synthesize overview = _overview;
@synthesize posterPath = _posterPath;
@synthesize backdropPath = _backdropPath;

- (instancetype)initWith:(NSDictionary *)dictionary {
    self = [super init];
    _identifier = [[dictionary valueForKey:@"id"] integerValue];
    _title = [dictionary stringForKey:@"title"];
    _releaseDate = [dictionary dateForKey:@"release_date"];
    _voteAverage = [dictionary objectForKey:@"vote_average"];
    _voteCount = [[dictionary valueForKey:@"vote_count"] integerValue];
    _overview = [dictionary stringForKey:@"overview"];
    _posterPath = [dictionary stringForKey:@"poster_path"];
    _backdropPath = [dictionary stringForKey:@"backdrop_path"];
    _imagePath = _posterPath;
    return self;
}

- (ItemType)itemType {
    return kMovie;
}

@end
