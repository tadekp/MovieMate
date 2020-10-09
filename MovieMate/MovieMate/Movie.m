//
//  Movie.m
//  MovieMate
//
//  Created by Tadeusz Purtak on 07/10/2020.
//  Copyright © 2020 Litterae. All rights reserved.
//

#import "Movie.h"
#import "NSDictionary+Utils.h"
#import "ImageLoader.h"

@implementation Movie

@synthesize identifier = _identifier;
@synthesize title = _title;
@synthesize releaseDate = _releaseDate;
@synthesize voteAverage = _voteAverage;
@synthesize voteCount = _voteCount;
@synthesize overview = _overview;
@synthesize posterPath = _posterPath;
@synthesize backdropPath = _backdropPath;
@synthesize posterImage = _posterImage;
@synthesize backdropImage = _backdropImage;
@synthesize imageLoader = _imageLoader;

- (instancetype)initWith:(NSDictionary *)dictionary andImageLoader:(nonnull ImageLoader *)loader {
    self = [super init];
    _imageLoader = loader;
    _identifier = [[dictionary valueForKey:@"id"] integerValue];
    _title = [dictionary stringForKey:@"title"];
    _releaseDate = [dictionary dateForKey:@"release_date"];
    _voteAverage = [dictionary objectForKey:@"vote_average"];
    _voteCount = [[dictionary valueForKey:@"vote_count"] integerValue];
    _overview = [dictionary stringForKey:@"overview"];
    _posterPath = [dictionary stringForKey:@"poster_path"];
    _backdropPath = [dictionary stringForKey:@"backdrop_path"];
    return self;
}

- (void)loadPosterImage:(Completed)completed {
    if (_posterImage != nil) {
        [self notifyUI:completed withSuccess:YES orError:nil];
    } else {
        [self loadImageFrom:[self posterPath] with:^(UIImage * const _Nullable image, NSString * const _Nullable errorMessage) {
            [self completeLoadingWith:completed andImage:image orError:errorMessage closedBy:^{
                self->_posterImage = image;
            }];
        }];
    }
}

- (void)loadBackdropImage:(Completed)completed {
    if (_backdropImage != nil) {
        [self notifyUI:completed withSuccess:YES orError:nil];
    } else {
        [self loadImageFrom:[self backdropPath] with:^(UIImage * const _Nullable image, NSString * const _Nullable errorMessage) {
            [self completeLoadingWith:completed andImage:image orError:errorMessage closedBy:^{
                self->_backdropImage = image;
            }];
        }];
    }
}

#pragma mark - Private implementation messages

- (void)loadImageFrom:(NSString * const)path with:(ImageResult _Nonnull)result {
    [[self imageLoader] loadImageFromPath:path result:result];
}

- (void)notifyUI:(Completed _Nonnull)completed withSuccess:(BOOL)success orError:(NSString const *)errorMessage {
    dispatch_async(dispatch_get_main_queue(), ^{
        completed(success, errorMessage);
    });
}

- (void)completeLoadingWith:(Completed)completed andImage:(UIImage * const _Nullable)image orError:(NSString * const _Nullable)errorMessage closedBy:(Lambda)lambda {
    if (image != nil) {
        lambda();
        [self notifyUI:completed withSuccess:YES orError:nil];
    } else {
        NSString *info = errorMessage;
        if (info == nil) {
            info = @"Cannot load image from the Movies backend.";
        }
        [self notifyUI:completed withSuccess:NO orError:info];
    }
}

@end
