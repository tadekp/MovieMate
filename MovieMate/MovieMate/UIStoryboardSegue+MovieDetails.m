//
//  UIStoryboardSegue+MovieDetails.m
//  MovieMate
//
//  Created by Tadeusz Purtak on 11/10/2020.
//  Copyright © 2020 Litterae. All rights reserved.
//

#import "UIStoryboardSegue+MovieDetails.h"
#import "ItemCell.h"
#import "MovieDetailsViewController.h"

@implementation UIStoryboardSegue (MovieDetails)

- (void)feedWithBy:(ItemType)itemType withElement:(id)sender andProvider:(nonnull MoviesProvider *)provider {
    ItemCell *cell = (ItemCell *)sender;
    id<Item> selectedItem = [cell item];
    MovieDetailsViewController *detailsViewController = (MovieDetailsViewController *)[self destinationViewController];
    [detailsViewController setupBy:itemType forItem:selectedItem withProvider:provider];
}

@end
