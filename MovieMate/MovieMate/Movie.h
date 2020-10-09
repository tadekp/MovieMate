//
//  Movie.h
//  MovieMate
//
//  Created by Tadeusz Purtak on 07/10/2020.
//  Copyright © 2020 Litterae. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "CommonTypes.h"

NS_ASSUME_NONNULL_BEGIN

@class ImageLoader;

@interface Movie : NSObject

@property (nonatomic, readonly) NSInteger identifier;
@property (nonatomic, strong, readonly) NSString *title;
@property (nonatomic, strong, readonly) NSDate *releaseDate;
@property (nonatomic, strong, readonly) NSNumber *voteAverage;
@property (nonatomic, readonly) NSInteger voteCount;
@property (nonatomic, strong, readonly) NSString *overview;
@property (nonatomic, strong, readonly) NSString *posterPath;
@property (nonatomic, strong, readonly) NSString *backdropPath;

@property (nonatomic, strong, readonly) UIImage const *posterImage;
@property (nonatomic, strong, readonly) UIImage const *backdropImage;

@property (nonatomic, weak, readonly) ImageLoader *imageLoader;

- (instancetype)initWith:(NSDictionary * _Nonnull)dictionary andImageLoader:(ImageLoader *)loader;

- (void)loadPosterImage:(Completed _Nonnull)completed;
- (void)loadBackdropImage:(Completed _Nonnull)completed;

@end

NS_ASSUME_NONNULL_END
