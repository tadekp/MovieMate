//
//  MoviesViewController.h
//  MovieMate
//
//  Created by Tadeusz Purtak on 10/10/2020.
//  Copyright © 2020 Litterae. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <NMPaginator/NMPaginator.h>
#import "ItemsViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface MoviesViewController : ItemsViewController<NMPaginatorDelegate>

@end

NS_ASSUME_NONNULL_END
