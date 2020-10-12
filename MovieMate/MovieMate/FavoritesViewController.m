//
//  FavoritesViewController.m
//  MovieMate
//
//  Created by Tadeusz Purtak on 10/10/2020.
//  Copyright © 2020 Litterae. All rights reserved.
//

#import "FavoritesViewController.h"
#import "FavoritesProvider.h"
#import "FavoritesManager.h"
#import "UIStoryboardSegue+MovieDetails.h"
#import "MoviesProvider.h"

@interface FavoritesViewController ()
@property (nonatomic, retain, readonly) FavoritesProvider *itemsProvider;
@end

@implementation FavoritesViewController

@synthesize itemsProvider = _itemsProvider;

- (void)viewDidLoad {
    _itemsProvider = [[FavoritesManager shared] provider];
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [[self tableView] reloadData];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [[FavoritesManager shared] setFavorite:[self itemAt:indexPath] favorite:NO];
        [self viewDidLoad];
        [self viewWillAppear:YES];
    }
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    [segue feedWithBy:kFavorite withElement:sender andProvider:[[MoviesProvider alloc] init]];
}

@end
