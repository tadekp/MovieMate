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
#import "Movies.h"
#import "MovieDetails.h"

static NSString * const baseURLString = @"https://api.themoviedb.org/3/movie/";
static NSString * const baseSearchURLString = @"https://api.themoviedb.org/3/search/";
static NSString * const apiKey = @"3e335cb24512bbdd8b2535248dc9a143";
static const char* queueName = "Backend-Fetcher";

#pragma mark - Private properties

@interface Backend ()

@property (nonatomic, retain) AFHTTPSessionManager * _Nonnull manager;

@end

#pragma mark - Public interface implememntation

@implementation Backend

- (instancetype)init {
    self = [super init];
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    self.manager = [[AFHTTPSessionManager alloc]initWithSessionConfiguration:configuration];
    self.manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    return self;
}

- (void)requestNowPlayingMoviesForPage:(int)page result:(MoviesResult)result {
    dispatch_queue_t fetchQ = dispatch_queue_create(queueName, NULL);
    dispatch_async(fetchQ, ^{
        [[self manager] GET:[[self nowPlayingURLForPage:page] absoluteString]
                 parameters:nil
                    headers:nil
                   progress:
         ^(NSProgress * _Nonnull downloadProgress) {
            // TODO: implement progress
        }
                    success:
         ^(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject) {
            Movies *movies;
            NSString *errorMessage;
            NSDictionary *dictionary = [NSDictionary dictionaryFrom:responseObject];
            if (dictionary != nil) {
                movies = [[Movies alloc] initWith:dictionary];
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

- (void)requestSearch:(NSString *)text atPage:(int)page result:(MoviesResult)result {
    dispatch_queue_t fetchQ = dispatch_queue_create(queueName, NULL);
    dispatch_async(fetchQ, ^{
        [[self manager] GET:[[self searchURLForQuery:text onPage:page] absoluteString]
                 parameters:nil
                    headers:nil
                   progress:
         ^(NSProgress * _Nonnull downloadProgress) {
            // TODO: implement progress
        }
                    success:
         ^(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject) {
            Movies *movies;
            NSString *errorMessage;
            NSDictionary *dictionary = [NSDictionary dictionaryFrom:responseObject];
            if (dictionary != nil) {
                movies = [[Movies alloc] initWith:dictionary];
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

- (void)requestMovieDetailsOf:(NSInteger)movieIdentifier result:(MovieDetailsResult)result {
    dispatch_queue_t fetchQ = dispatch_queue_create(queueName, NULL);
    dispatch_async(fetchQ, ^{
        [[self manager] GET:[[self detailsURLForMovieIdentifier:movieIdentifier] absoluteString]
                 parameters:nil
                    headers:nil
                   progress:
         ^(NSProgress * _Nonnull progress) {
            // TODO: implement progress
        } success:
         ^(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject) {
            MovieDetails *movieDetails;
            NSString *errorMessage;
            NSDictionary *dictionary = [NSDictionary dictionaryFrom:responseObject];
            if (dictionary != nil) {
                movieDetails = [[MovieDetails alloc] initWith:dictionary];
                errorMessage = nil;
            } else {
                movieDetails = nil;
                errorMessage = @"Incorrect movie details data from backend";
            }
            dispatch_async(dispatch_get_main_queue(), ^{
                result(movieDetails, errorMessage);
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

- (NSURL * const)detailsURLForMovieIdentifier:(NSInteger)movieIdentifier {
    NSString *urlString = [NSString stringWithFormat:@"%ld?api_key=%@", movieIdentifier, apiKey];
    return [NSURL URLWithString:urlString relativeToURL:[self baseURL]];
}

- (NSURL * const)searchURLForQuery:(NSString *)query onPage:(int)page {
    NSString *encodedQuery = [query stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    NSString *urlString = [NSString stringWithFormat:@"movie?api_key=%1$@&page=%2$@&query=%3$@", apiKey, [NSString stringWithFormat:@"%d", page], encodedQuery];
    return [NSURL URLWithString:urlString relativeToURL:[NSURL URLWithString:baseSearchURLString]];
}

- (NSURL * const)nowPlayingURLForPage:(int)page {
    NSString *urlString = [NSString stringWithFormat:@"now_playing?api_key=%@&page=%d", apiKey, page];
    return [NSURL URLWithString:urlString relativeToURL:[self baseURL]];
}

- (NSURL * const)baseURL {
    return [NSURL URLWithString:baseURLString];
}

@end
