//
//  ItemsViewController.m
//  MovieMate
//
//  Created by Tadeusz Purtak on 10/10/2020.
//  Copyright © 2020 Litterae. All rights reserved.
//

#import "ItemsViewController.h"
#import "TextProvider.h"
#import "ItemCell.h"
#import "ImageLoader.h"
#import "FavoritesManager.h"
#import "Items.h"

@interface ItemsViewController ()
@property (nonatomic, nonnull, strong) ImageLoader *imageLoader;
@property (nonatomic, nonnull, strong) NSMutableArray<id<Item>> *items;
@end

@implementation ItemsViewController

@synthesize imageLoader;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.items = [NSMutableArray array];
    self.currentPage = 0;
    self.imageLoader = [[ImageLoader alloc] init];
    self.navigationItem.title = [[TextProvider shared] titleFor:[self itemType]];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self setCurrentPage:0];
    [self flush];
    [self reload];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [[FavoritesManager shared] addDelegate:self];
}

- (void)viewWillDisappear:(BOOL)animated {
    [[FavoritesManager shared] removeDelegate:self];
    [super viewWillDisappear:animated];
}

- (void)reload {
    [[self itemsProvider] loadItemsForPage:[self currentPage] result:^(id<Items> _Nullable const loadedItems) {
        [[self items] addObjectsFromArray:[loadedItems items]];
        [[self tableView] reloadData];
    }];
}

- (void)flush {
    [[self items] removeAllObjects];
    [[self tableView] reloadData];
}

- (ItemType)itemType {
    return [[self itemsProvider] itemType];
}

- (void)favoriteItem:(nonnull id<Item>)item addedOrRemoved:(BOOL)added {
    [[self tableView] reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[self items] count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ItemCell *cell = (ItemCell *)[tableView dequeueReusableCellWithIdentifier:[ItemCell identifier] forIndexPath:indexPath];
    [cell setupFor:[self itemAt:indexPath] havingFavoriteMark:[self itemType] != kFavorite withImageLoader:[self imageLoader]];
    if ([self itemType] == kMovie && [indexPath row] == [[self items] count] - 1) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self setCurrentPage:[self currentPage] + 1];
            [self reload];
        });
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
}

- (id<Item>)itemAt:(NSIndexPath *)indexPath {
    return [[self items] objectAtIndex:[indexPath row]];
}

@end
