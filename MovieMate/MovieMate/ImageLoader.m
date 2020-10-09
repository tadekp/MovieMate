//
//  ImageLoader.m
//  MovieMate
//
//  Created by Tadeusz Purtak on 09/10/2020.
//  Copyright © 2020 Litterae. All rights reserved.
//

#import <AFImageDownloader.h>
#import "ImageLoader.h"

static NSString * const baseURLString = @"http://image.tmdb.org/t/p/w500";

#pragma mark - Private properties

@interface ImageLoader ()

@property (nonatomic, retain) AFImageDownloader *downloader;

@end

#pragma mark - Public interface implememntation

@implementation ImageLoader

- (instancetype _Nonnull)initWith:(NSURLSessionConfiguration *)configuration {
    self = [super init];
    self.downloader = [[AFImageDownloader alloc] initWithSessionConfiguration:configuration];
    return self;
}

- (void)loadImageFromPath:(NSString * const)path result:(ImageResult)result {
    dispatch_queue_t downloadQ = dispatch_queue_create([self uniqueQueueName], NULL);
    dispatch_async(downloadQ, ^{
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString: [[self urlForImagePath:path] absoluteString]]];
            [[self downloader] downloadImageForURLRequest:request
                                                  success:
             ^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, UIImage * _Nonnull responseObject) {
                NSLog(@"Succes download image");
            }
                                                  failure:
             ^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, NSError * _Nonnull error) {
                NSLog(@"Error download image");
            }];
    });
}

#pragma mark - Private helpers

- (const char *)uniqueQueueName {
    NSString *uuid = [[NSUUID UUID] UUIDString];
    NSString *name = [NSString stringWithFormat:@"Image-Downloader-%@", uuid];
    return [name cStringUsingEncoding:NSASCIIStringEncoding];
}

- (NSURL * const)urlForImagePath:(NSString * const)path {
    return [NSURL URLWithString:path relativeToURL:[self baseURL]];
}


- (NSURL * const)baseURL {
    return [NSURL URLWithString:baseURLString];
}

@end
