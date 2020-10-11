//
//  FavoriteRecord.m
//  
//
//  Created by Tadeusz Purtak on 10/10/2020.
//
//

#import "FavoriteRecord.h"

@implementation FavoriteRecord

@dynamic identifier;
@dynamic imagePath;
@dynamic releaseDate;
@dynamic title;
@dynamic voteAverage;

+ (NSFetchRequest<FavoriteRecord *> *)fetchRequest {
    return [NSFetchRequest fetchRequestWithEntityName:@"FavoriteItem"];
}

@end
