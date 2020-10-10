//
//  ImageLoader.m
//  MovieMate
//
//  Created by Tadeusz Purtak on 09/10/2020.
//  Copyright © 2020 Litterae. All rights reserved.
//

#import <UIImageView+AFNetworking.h>
#import "ImageLoader.h"

static NSString * const baseURLString = @"http://image.tmdb.org/t/p/w500";

@interface ImageLoader ()
@property (nonatomic, nonnull, strong, readonly) UIImage *waitImage;
@end

#pragma mark - Public interface implememntation

@implementation ImageLoader

@synthesize waitImage = _waitImage;

- (instancetype)init {
    self = [super init];
    _waitImage = [UIImage imageNamed:@"chaplin"];
    return self;
}

- (void)loadImageFromPath:(NSString * const)path forView:(nonnull UIImageView *)imageView {
    NSString *urlString = [NSString stringWithFormat:@"%1$@%2$@", baseURLString, path];
    NSURL *url = [NSURL URLWithString:urlString];
    [imageView setImageWithURL:url placeholderImage:[self waitImage]];
}

- (NSURL * const)urlForImagePath:(NSString * const)path {
    return [NSURL URLWithString:path relativeToURL:[self baseURL]];
}

- (NSURL * const)baseURL {
    return [NSURL URLWithString:baseURLString];
}

@end
