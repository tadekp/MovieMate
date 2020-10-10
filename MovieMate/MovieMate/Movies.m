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

- (instancetype) initWith:(NSDictionary *)dictionary {
    self = [super init];
    _page = [[dictionary valueForKey:@"page"] integerValue];
    _totalPages = [[dictionary valueForKey:@"total_pages"] integerValue];
    _totalResults = [[dictionary valueForKey:@"total_results"] integerValue];
    NSArray *movieArray = [NSArray arrayFrom:[dictionary objectForKey:@"results"]];
    if (movieArray != nil) {
        NSMutableArray *theItems = [[NSMutableArray alloc] initWithCapacity:[movieArray count]];
        for (id movieDict in movieArray) {
            Movie *movie = [[Movie alloc] initWith:movieDict];
            [theItems addObject:movie];
        }
        _items = theItems;
    } else {
        _items = [[NSArray alloc] init];
    }
    return self;
}

+ (id<Items> _Nonnull)createEmpty {
    return [[Movies alloc] initEmpty];
}

- (NSInteger)count {
    return [[self items] count];
}

- (id<Item> _Nullable)itemAt:(NSInteger)index {
    if (0 <= index && index < [[self items] count]) {
        return [[self items] objectAtIndex:index];
    } else {
        return nil;
    }
}

#pragma mark - Private initializer

- (instancetype)initEmpty {
    self = [super init];
    _page = 0;
    _totalPages = 1;
    _totalResults = 0;
    _items = @[];
    return self;
}

@end
