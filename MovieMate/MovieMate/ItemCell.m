//
//  ItemCell.m
//  MovieMate
//
//  Created by Tadeusz Purtak on 10/10/2020.
//  Copyright © 2020 Litterae. All rights reserved.
//

#import "ItemCell.h"
#import "TextProvider.h"
#import "FavoritesManager.h"

static NSString *_identifier = @"item-cell";

@interface ItemCell ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *ItemImageView;
@property (weak, nonatomic) IBOutlet UIImageView *starImageView;
@property (weak, nonatomic) IBOutlet UILabel *leftInfoLabel;
@property (weak, nonatomic) IBOutlet UILabel *rightInfoLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *starImageWidth;

@end

@implementation ItemCell

@synthesize item = _item;
@synthesize hasFavoriteMark = _hasFavoriteMark;

+ (NSString *)identifier {
    return _identifier;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

- (void)setItem:(id<Item>)item {
    _item = item;
    [[self titleLabel] setText:[item title]];
    [[self leftInfoLabel] setText:[[TextProvider shared] releaseInfoFrom:[item releaseDate]]];
    [[self rightInfoLabel] setText:[NSString stringWithFormat:@"%.01f", [[item voteAverage] doubleValue]]];
    if ([self hasFavoriteMark]) {
        [[self starImageView] setHighlighted:[[FavoritesManager shared] isFavorite:[item identifier]]];
    }
    // TODO: fill remaining properties
}

- (void)setHasFavoriteMark:(BOOL)hasFavoriteMark {
    _hasFavoriteMark = hasFavoriteMark;
    [[self starImageWidth] setConstant:hasFavoriteMark ? 44 : 0];
}

@end
