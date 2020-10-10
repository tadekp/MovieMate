//
//  Favorite.m
//  
//
//  Created by Tadeusz Purtak on 10/10/2020.
//
//

#import "Favorite.h"

@implementation Favorite

@dynamic fIdentifier;
@dynamic fImagePath;
@dynamic fReleaseDate;
@dynamic fTitle;
@dynamic fVoteAverage;

+ (NSFetchRequest<Favorite *> *)fetchRequest {
    return [NSFetchRequest fetchRequestWithEntityName:@"FavoriteItem"];
}

- (void)fillWithItem:(id<Item>)item {
    self.fIdentifier = (int32_t)[item identifier];
    self.fImagePath = [item imagePath];
    self.fReleaseDate = [item releaseDate];
    self.fTitle = [item title];
    self.fVoteAverage = [[self voteAverage] floatValue];
}

- (ItemType)itemType {
    return kFavorite;
}

- (NSInteger)identifier {
    return [self fIdentifier];
}

- (NSString *)imagePath {
    return [self fImagePath];
}

- (NSDate *)releaseDate {
    return [self fReleaseDate];
}

- (NSString *)title {
    return [self fTitle];
}

- (NSNumber *)voteAverage {
    return [NSNumber numberWithFloat:[self fVoteAverage]];
}

@end
