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
#import "ImageLoader.h"
#import "FavoritesManager.h"

static UIImage *_starON = nil;
static UIImage *_starOFF = nil;

@interface MovieDetailsViewController ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *detailsImageView;
@property (weak, nonatomic) IBOutlet UIImageView *starImageView;
@property (weak, nonatomic) IBOutlet UILabel *releaseLabel;
@property (weak, nonatomic) IBOutlet UILabel *voteLabel;
@property (weak, nonatomic) IBOutlet UILabel *overviewLabel;

@property (nonatomic, nullable, retain) MoviesProvider *moviesProvider;
@property (nonatomic) ItemType callerItemType;
@property (nonatomic, nonnull, retain, readonly) MovieDetails *movieDetails;
@property (nonatomic, strong) ImageLoader *imageLoader;

@end

@implementation MovieDetailsViewController

@synthesize moviesProvider;
@synthesize callerItemType;
@synthesize movieDetails = _movieDetails;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:[[TextProvider shared] detailsTitle]];
    [[[self navigationItem] leftBarButtonItem] setTitle:[[TextProvider shared] shortTitleFor:[self callerItemType]]];
    [self setImageLoader:[[ImageLoader alloc] init]];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [[FavoritesManager shared] addDelegate:self];
}

- (void)viewWillDisappear:(BOOL)animated {
    [[FavoritesManager shared] removeDelegate:self];
    [super viewWillDisappear:animated];
}

- (void)setupBy:(ItemType)callerItemType forItem:(id<Item>)item withProvider:(MoviesProvider *)moviesProvider {
    self.callerItemType = callerItemType;
    if (moviesProvider != nil) {
        self.moviesProvider = moviesProvider;
    } else {
        self.moviesProvider = [[MoviesProvider alloc] init];
    }
    [self.moviesProvider loadMovieDetailsFor:[item identifier] result:^(const MovieDetails * _Nullable movieDetails, NSString * _Nullable errorMessage) {
        NSLog(@"%@", [movieDetails overview]);
        [self setMovieDetails:movieDetails];
    }];
}

- (void)setMovieDetails:(MovieDetails * _Nonnull)movieDetails {
    _movieDetails = movieDetails;
    [[self titleLabel] setText:[movieDetails title]];
    [[self imageLoader] loadImageFromPath:[movieDetails backdropPath] forView:[self detailsImageView]];
    [[self releaseLabel] setText:[[TextProvider shared] releaseInfoFrom:[movieDetails releaseDate]]];
    [[self voteLabel] setText:[NSString stringWithFormat:@"%.01f", [[movieDetails voteAverage] doubleValue]]];
    
    [self makeStarTappable];
    [self refreshStar];

    [[self overviewLabel] setText:[movieDetails overview]];
}

#pragma mark - Star behavior fileprivate implementation

- (void)refreshStar {
    BOOL isFavorite = [[FavoritesManager shared] isFavorite:[self movieDetails]];
    [[self starImageView] setImage:(isFavorite ? [self starON] : [self starOFF])];
}

- (void)makeStarTappable {
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapDetected)];
    singleTap.numberOfTapsRequired = 1;
    [[self starImageView] setUserInteractionEnabled:YES];
    [[self starImageView] addGestureRecognizer:singleTap];
}

- (void)tapDetected {
    [[FavoritesManager shared] toggle:[self movieDetails]];
}

- (UIImage *)starON {
    if (_starON == nil) {
        _starON = [self makeStarImageForFavorite:YES];
    }
    return _starON;
}

- (UIImage *)starOFF {
    if (_starOFF == nil) {
        _starOFF = [self makeStarImageForFavorite:NO];
    }
    return _starOFF;
}

- (UIImage *)makeStarImageForFavorite:(BOOL)favorite {
    NSString *name = favorite ? @"star-on" : @"star-off";
    return [UIImage imageNamed:name];
}

#pragma mark - Delegates

- (void)favoriteItem:(id<Item>)item addedOrRemoved:(BOOL)added {
    if ([item identifier] == [[self movieDetails] identifier]) {
        [self refreshStar];
    }
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
