//
//  ItemsViewController.h
//  MovieMate
//
//  Created by Tadeusz Purtak on 10/10/2020.
//  Copyright © 2020 Litterae. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Item.h"
#import "Items.h"
#import "ItemsProvider.h"

NS_ASSUME_NONNULL_BEGIN

@interface ItemsViewController : UITableViewController

@property (nonatomic, readonly) ItemType itemType;
@property (nonatomic, retain, readonly) id<ItemsProvider> itemsProvider;

@property (nonatomic, retain) id<Items> currentItems;

@end

NS_ASSUME_NONNULL_END
