//
//  Movies.m
//  MovieMate
//
//  Created by Tadeusz Purtak on 07/10/2020.
//  Copyright © 2020 Litterae. All rights reserved.
//

#import "Movies.h"
#import "NSArray+Utils.h"

@implementation Movies

@synthesize page = _page;
@synthesize totalPages = _totalPages;
@synthesize totalResults = _totalResults;
@synthesize items = _items;

- (instancetype) initWith:(NSDictionary *)dictionary andImageLoader:(nonnull ImageLoader *)loader {
    self = [super init];
    _page = [[dictionary valueForKey:@"page"] integerValue];
    _totalPages = [[dictionary valueForKey:@"total_pages"] integerValue];
    _totalResults = [[dictionary valueForKey:@"total_results"] integerValue];
    NSArray *movieArray = [NSArray arrayFrom:[dictionary objectForKey:@"results"]];
    if (movieArray != nil) {
        NSMutableArray *theItems = [[NSMutableArray alloc] initWithCapacity:[movieArray count]];
        for (id movieDict in movieArray) {
            Movie *movie = [[Movie alloc] initWith:movieDict andImageLoader:loader];
            [theItems addObject:movie];
        }
        _items = theItems;
    } else {
        _items = [[NSArray alloc] init];
    }
    return self;
}

@end
