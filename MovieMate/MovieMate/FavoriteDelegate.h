//
//  FavoriteDelegate.h
//  MovieMate
//
//  Created by Tadeusz Purtak on 11/10/2020.
//  Copyright © 2020 Litterae. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Item.h"

NS_ASSUME_NONNULL_BEGIN

@protocol FavoriteDelegate <NSObject>

- (void)favoriteItem:(id<Item>)item addedOrRemoved:(BOOL)added;

@end

NS_ASSUME_NONNULL_END
