//
//  SearchMoviesProvider.m
//  MovieMate
//
//  Created by Tadeusz Purtak on 12/10/2020.
//  Copyright © 2020 Litterae. All rights reserved.
//

#import "SearchMoviesProvider.h"
#import "Backend.h"

@implementation SearchMoviesProvider

@synthesize text = _text;
@synthesize errorMessage = _errorMessage;
@synthesize minCharacters = _minCharacters;
@synthesize secondsDelay = _secondsDelay;

- (instancetype)init {
    self = [super init];
    _minCharacters = 4;
    _secondsDelay = 3;
    return self;
}

- (void)setText:(NSString *)text {
    _text = text;
}

- (void)loadItemsForPage:(NSInteger)page result:(ItemsResult)result {
    if ([[self text] length] >= [self minCharacters]) {
        [[self backend] requestSearch:[self text] atPage:(int)page + 1 result:^(const Movies * _Nullable movies, NSString * _Nullable errorMessage) {
            self->_errorMessage = errorMessage;
            result(movies);
        }];
    }
}

@end
