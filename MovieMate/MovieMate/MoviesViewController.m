//
//  MoviesViewController.m
//  MovieMate
//
//  Created by Tadeusz Purtak on 10/10/2020.
//  Copyright © 2020 Litterae. All rights reserved.
//

#import "MoviesViewController.h"
#import "MovieDetailsViewController.h"
#import "MoviesProvider.h"
#import "Types.h"
#import "Movies.h"
#import "Movie.h"
#import "ItemCell.h"
#import "UIStoryboardSegue+MovieDetails.h"
#import "TextProvider.h"

@interface MoviesViewController ()

@property (nonatomic, retain, readonly) MoviesProvider *itemsProvider;
@property (nonatomic) int totalPages;
@property (nonatomic, strong) UILabel *footerLabel;
@property (nonatomic, strong) UIActivityIndicatorView *activityIndicator;
@property (nonatomic, strong) UISearchController *searchController;

@end

@implementation MoviesViewController

@synthesize itemsProvider = _itemsProvider;

- (void)viewDidLoad {
    _itemsProvider = [[MoviesProvider alloc] init];
    [super viewDidLoad];
    [self setupTableViewFooter];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([sender isKindOfClass:[ItemCell class]]) {
        [segue feedWithBy:kMovie withElement:sender andProvider:[self itemsProvider]];
    }
}

#pragma mark - Implementation

- (void)setupTableViewFooter {
    // set up label
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    footerView.backgroundColor = [UIColor clearColor];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    label.font = [UIFont boldSystemFontOfSize:16];
    label.textColor = [UIColor lightGrayColor];
    label.textAlignment = NSTextAlignmentCenter;
    
    self.footerLabel = label;
    [footerView addSubview:label];
    
    // set up activity indicator
    UIActivityIndicatorView *activityIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    activityIndicatorView.center = CGPointMake(40, 22);
    activityIndicatorView.hidesWhenStopped = YES;

    self.activityIndicator = activityIndicatorView;
    [footerView addSubview:activityIndicatorView];
    self.tableView.tableFooterView = footerView;
}

@end
