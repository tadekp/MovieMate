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
#import "ImageLoader.h"

static NSString *_identifier = @"item-cell";
static UIImage *_starON = nil;
static UIImage *_starOFF = nil;

@interface ItemCell ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *ItemImageView;
@property (weak, nonatomic) IBOutlet UIImageView *starImageView;
@property (weak, nonatomic) IBOutlet UILabel *leftInfoLabel;
@property (weak, nonatomic) IBOutlet UILabel *rightInfoLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *starImageWidth;

@property (nonatomic, retain, nonnull, readonly) id<Item> item;

@end

@implementation ItemCell

@synthesize item = _item;

+ (NSString *)identifier {
    return _identifier;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

- (void)setupFor:(id<Item>)item havingFavoriteMark:(BOOL)hasFavoriteMark withImageLoader:(ImageLoader *)imageLoader {
    [[self starImageWidth] setConstant:hasFavoriteMark ? 50 : 0];
    _item = item;
    [[self titleLabel] setText:[item title]];
    [[self leftInfoLabel] setText:[[TextProvider shared] releaseInfoFrom:[item releaseDate]]];
    [[self rightInfoLabel] setText:[NSString stringWithFormat:@"%.01f", [[item voteAverage] doubleValue]]];
    if (hasFavoriteMark) {
        BOOL isFavorite = [[FavoritesManager shared] isFavorite:item];
        [[self starImageView] setImage:(isFavorite ? [self starON] : [self starOFF])];
        [self makeStarTappable];
    }
    [imageLoader loadImageFromPath:[item imagePath] forView:[self ItemImageView]];
}

- (void)makeStarTappable {
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapDetected)];
    singleTap.numberOfTapsRequired = 1;
    [[self starImageView] setUserInteractionEnabled:YES];
    [[self starImageView] addGestureRecognizer:singleTap];
}

- (void)tapDetected {
    [[FavoritesManager shared] toggle:[self item]];
}

- (UIImage *)starON {
    if (_starON == nil) {
        _starON = [self makeStarImageForFavorite:YES];
    }
    return _starON;
}

- (UIImage *)starOFF {
    if (_starOFF == nil) {
        _starOFF = [self makeStarImageForFavorite:NO];
    }
    return _starOFF;
}

- (UIImage *)makeStarImageForFavorite:(BOOL)favorite {
    NSString *name = favorite ? @"small-star-on" : @"small-star-off";
    return [UIImage imageNamed:name];
}

@end
