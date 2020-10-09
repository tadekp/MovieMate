//
//  Backend.m
//  MovieMate
//
//  Created by Tadeusz Purtak on 07/10/2020.
//  Copyright © 2020 Litterae. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>
#import "NSDictionary+Utils.h"
#import "Backend.h"
#import "ImageLoader.h"
#import "Movies.h"

static NSString * const baseURLString = @"https://api.themoviedb.org/3/movie/";
static NSString * const apiKey = @"3e335cb24512bbdd8b2535248dc9a143";

#pragma mark - Private properties

@interface Backend ()

@property (nonatomic, retain) AFHTTPSessionManager * _Nonnull manager;
@property (nonatomic, strong) ImageLoader * _Nonnull imageLoader;

@end

#pragma mark - Public interface implememntation

@implementation Backend

- (instancetype)init {
    self = [super init];
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    self.manager = [[AFHTTPSessionManager alloc]initWithSessionConfiguration:configuration];
    self.manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    self.imageLoader = [[ImageLoader alloc] initWith:configuration];
    return self;
}

- (void)requestNowPlayingMoviesForPage:(int)page result:(MoviesResult)result {
    dispatch_queue_t fetchQ = dispatch_queue_create("Backend-Fetcher", NULL);
    dispatch_async(fetchQ, ^{
        [[self manager] GET:[[self nowPlayingURLForPage:page] absoluteString]
                 parameters:nil
                    headers:nil
                   progress:
         ^(NSProgress * _Nonnull downloadProgress) {
            // TODO: implement progress
            NSLog(@"progress");
        }
                    success:
         ^(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject) {
            Movies const *movies;
            NSString const *errorMessage;
            NSDictionary *dictionary = [NSDictionary dictionaryFrom:responseObject];
            if (dictionary != nil) {
                movies = [[Movies alloc] initWith:dictionary andImageLoader:[self imageLoader]];
                errorMessage = nil;
            } else {
                movies = nil;
                errorMessage = @"Incorrect movies data from backend";
            }
            dispatch_async(dispatch_get_main_queue(), ^{
                result(movies, errorMessage);
            });
        }
                    failure:
         ^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                result(nil, [error localizedFailureReason]);
            });
        }];
    });
}

#pragma mark - Private helpers

- (NSURL * const)nowPlayingURLForPage:(int)page {
    NSString *urlString = [NSString stringWithFormat:@"now_playing?api_key=%@&page=%d", apiKey, page];
    return [NSURL URLWithString:urlString relativeToURL:[self baseURL]];
}

- (NSURL * const)baseURL {
    return [NSURL URLWithString:baseURLString];
}

@end

/*
 NSURLRequest *request = [[NSURLRequest alloc]initWithURL:[NSURL URLWithString:"YOUR URL OF IMAGE HERE"];
     ["YOUR IMAGEVIEW" setImageWithURLRequest:request placeholderImage:"YOUR PLACEHOLDER IMAGE" success:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, UIImage * _Nonnull image) {
         "YOUR IMAGEVIEW".image = image;
     } failure:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, NSError * _Nonnull error) {
         NSLog(@"%@",error);
     }];
 */
