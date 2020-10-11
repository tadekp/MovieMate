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
#import "FavoritesManager.h"
#import "ItemCell.h"

@interface MoviesViewController ()

@property (nonatomic, retain, readonly) MoviesProvider *itemsProvider;
@property (nonatomic) int totalPages;

@end

@implementation MoviesViewController

@synthesize itemsProvider = _itemsProvider;

- (void)viewDidLoad {
    _itemsProvider = [[MoviesProvider alloc] init];
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [[FavoritesManager shared] addDelegate:self];
}

- (void)viewWillDisappear:(BOOL)animated {
    [[FavoritesManager shared] removeDelegate:self];
    [super viewWillDisappear:animated];
}

#pragma mark - Delegates

- (void)favoriteItem:(nonnull id<Item>)item addedOrRemoved:(BOOL)added {
    [[self tableView] reloadData];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    ItemCell *cell = (ItemCell *)sender;
    id<Item> selectedItem = [cell item];
    MovieDetailsViewController *detailsViewController = (MovieDetailsViewController *)[segue destinationViewController];
    [detailsViewController setupBy:kMovie forItem:selectedItem withProvider:[self itemsProvider]];
}

@end
