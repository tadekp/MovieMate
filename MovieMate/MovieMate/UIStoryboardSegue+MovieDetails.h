//
//  UIStoryboardSegue+MovieDetails.h
//  MovieMate
//
//  Created by Tadeusz Purtak on 11/10/2020.
//  Copyright © 2020 Litterae. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Item.h"

NS_ASSUME_NONNULL_BEGIN

@class MoviesProvider;

@interface UIStoryboardSegue (MovieDetails)

- (void)feedWithBy:(ItemType)itemType withElement:(id)sender andProvider:(MoviesProvider *)provider;

@end

NS_ASSUME_NONNULL_END
