//
//  MovieDetailsViewController.m
//  MovieMate
//
//  Created by Tadeusz Purtak on 10/10/2020.
//  Copyright © 2020 Litterae. All rights reserved.
//

#import "MovieDetailsViewController.h"
#import "MovieDetails.h"
#import "MoviesProvider.h"
#import "TextProvider.h"

@interface MovieDetailsViewController ()
@property (nonatomic, nullable, retain) MoviesProvider *moviesProvider;
@property (nonatomic) ItemType callerItemType;
@property (nonatomic, nonnull, retain, readonly) MovieDetails *movieDetails;
@end

@implementation MovieDetailsViewController

@synthesize moviesProvider;
@synthesize callerItemType;
@synthesize movieDetails = _movieDetails;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:[[TextProvider shared] detailsTitle]];
    [[[self navigationItem] leftBarButtonItem] setTitle:[[TextProvider shared] shortTitleFor:[self callerItemType]]];
}

- (void)initializeBy:(ItemType)callerItemType forMovie:(NSInteger)movieIdentifier withProvider:(MoviesProvider *)moviesProvider {
    self.callerItemType = callerItemType;
    if (moviesProvider != nil) {
        self.moviesProvider = moviesProvider;
    } else {
        self.moviesProvider = [[MoviesProvider alloc] init];
    }
    [self.moviesProvider loadMovieDetailsFor:movieIdentifier result:^(const MovieDetails * _Nullable movieDetails, NSString * _Nullable errorMessage) {
        
    }];
}

- (void)setMovieDetails:(MovieDetails * _Nonnull)movieDetails {
    _movieDetails = movieDetails;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
