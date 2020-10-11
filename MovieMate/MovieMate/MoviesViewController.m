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

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    [segue feedWithBy:kMovie withElement:sender andProvider:[self itemsProvider]];
}

@end
