//
//  MovieDetailsViewController.h
//  MovieMate
//
//  Created by Tadeusz Purtak on 10/10/2020.
//  Copyright © 2020 Litterae. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Item.h"

NS_ASSUME_NONNULL_BEGIN

@class MoviesProvider;

@interface MovieDetailsViewController : UIViewController

- (void)initializeBy:(ItemType)callerItemType forMovie:(NSInteger)movieIdentifier withProvider:(MoviesProvider *)moviesProvider;

@end

NS_ASSUME_NONNULL_END
