//
//  MoviesViewController.m
//  MovieMate
//
//  Created by Tadeusz Purtak on 06/10/2020.
//  Copyright © 2020 Litterae. All rights reserved.
//

#import "MoviesViewController.h"
#import "Backend.h"
#import "Movies.h"
#import "Movie.h"

@interface MoviesViewController ()

@property (nonatomic, strong) Backend const* backend;
@property (nonatomic) int totalPages;

@end

@implementation MoviesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.backend = [[Backend alloc] init];
    [self.backend requestNowPlayingMoviesForPage:1 result:^(const Movies * _Nullable movies, const NSString * _Nullable errorMessage) {
        Movie *movie = [[movies items] objectAtIndex:0];
        [movie loadPosterImage:^(BOOL successfully, const NSString * _Nullable errorMessage) {
            NSLog(@"A kuku");
        }];
//        if (movies != nil) {
//        } else {
//        }
    }];
}

@end
