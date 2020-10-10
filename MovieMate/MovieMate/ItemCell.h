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

@interface ItemCell : UITableViewCell

@property (nonatomic, retain, nonnull) id<Item> item;
@property (nonatomic) BOOL hasFavoriteMark;

+ (NSString *)identifier;

@end

NS_ASSUME_NONNULL_END
