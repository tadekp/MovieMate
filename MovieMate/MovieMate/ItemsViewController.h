//
//  ItemsViewController.h
//  MovieMate
//
//  Created by Tadeusz Purtak on 10/10/2020.
//  Copyright © 2020 Litterae. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Item.h"
#import "ItemsProvider.h"
#import "FavoriteDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface ItemsViewController : UITableViewController <FavoriteDelegate>

@property (nonatomic, readonly) ItemType itemType;
@property (nonatomic, retain, readonly) id<ItemsProvider> itemsProvider;
@property (nonatomic) NSInteger currentPage;

- (void)reload;
- (void)flush;
- (id<Item>)itemAt:(NSIndexPath *)indexPath;

@end

NS_ASSUME_NONNULL_END
