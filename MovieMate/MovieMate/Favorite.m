//
//  Favorite.m
//  MovieMate
//
//  Created by Tadeusz Purtak on 11/10/2020.
//  Copyright © 2020 Litterae. All rights reserved.
//

#import "Favorite.h"
#import "FavoriteRecord.h"

@implementation Favorite

@synthesize identifier = _identifier;
@synthesize title = _title;
@synthesize releaseDate = _releaseDate;
@synthesize voteAverage = _voteAverage;
@synthesize imagePath = _imagePath;

- (instancetype)initWithCoreDataRecord:(FavoriteRecord *)record {
    self = [super init];
    _identifier = [record identifier];
    _title = [record title];
    _releaseDate = [record releaseDate];
    _voteAverage = [NSNumber numberWithFloat:[record voteAverage]];
    _imagePath = [record imagePath];
    return self;
}

- (instancetype)initWithItem:(id<Item>)item {
    self = [super init];
    _identifier = [item identifier];
    _title = [item title];
    _releaseDate = [item releaseDate];
    _voteAverage = [item voteAverage];
    _imagePath = [item imagePath];
    return self;
}

@end
