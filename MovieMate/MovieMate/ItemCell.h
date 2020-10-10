//
//  ItemCell.h
//  MovieMate
//
//  Created by Tadeusz Purtak on 10/10/2020.
//  Copyright © 2020 Litterae. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Item.h"

NS_ASSUME_NONNULL_BEGIN

@class ImageLoader;

@interface ItemCell : UITableViewCell

+ (NSString *)identifier;

- (void)setupFor:(id<Item>)item havingFavoriteMark:(BOOL)hasFavoriteMark withImageLoader:(ImageLoader *)imageLoader;

@end

NS_ASSUME_NONNULL_END
