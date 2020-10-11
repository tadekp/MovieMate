//
//  MovieDetailsViewController.h
//  MovieMate
//
//  Created by Tadeusz Purtak on 10/10/2020.
//  Copyright © 2020 Litterae. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Item.h"
#import "FavoriteDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@class MoviesProvider;

@interface MovieDetailsViewController : UIViewController <FavoriteDelegate>

- (void)setupBy:(ItemType)callerItemType forItem:(id<Item>)item withProvider:(MoviesProvider *)moviesProvider;

@end

NS_ASSUME_NONNULL_END
