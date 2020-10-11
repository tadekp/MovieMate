//
//  FavoritesManager+CRUD.m
//  MovieMate
//
//  Created by Tadeusz Purtak on 11/10/2020.
//  Copyright © 2020 Litterae. All rights reserved.
//

#import "FavoritesManager+CRUD.h"
#import "Favorite.h"
#import "FavoriteRecord.h"

@implementation FavoritesManager (CRUD)

- (BOOL)createRecord:(id<Item>)item {
    //NSManagedObjectContext *context = [[self persistentContainer] viewContext];
    //NSEntityDescription *entity = [NSEntityDescription entityForName:@"FavoriteItem" inManagedObjectContext:context];
    //Favorite *newFavorite = [[Favorite alloc] initWithEntity:entity insertIntoManagedObjectContext:context];
    
    NSManagedObjectContext *context = [self context];
    FavoriteRecord *favoriteRecord = [NSEntityDescription insertNewObjectForEntityForName:@"FavoriteItem" inManagedObjectContext:context];
    [self fillRecord:favoriteRecord withItem:item];
    //[newFavorite setFTitle:@"aaa"];
    //[newFavorite fillWithItem:item];
    
    //NSEntityDescription *entity = [NSEntityDescription insertNewObjectForEntityForName:@"FavoriteItem" inManagedObjectContext:context];
    //[entity setManagedObjectClassName:];
    NSError *error = nil;
    if ([context save:&error]) {
        return YES;
    } else {
        NSLog(@"%@", [error localizedDescription]);
        return NO;
    }
}

- (nonnull NSArray<id<Item>> *)readRecords {
    NSError *error = nil;
    NSArray *results = [[self context] executeFetchRequest:[FavoriteRecord fetchRequest] error:&error];
    if (error == nil) {
        NSMutableArray<id<Item>> *items = [NSMutableArray arrayWithCapacity:[results count]];
        for (id record in results) {
            Favorite *favorite = [[Favorite alloc] initWithCoreDataRecord:record];
            [items addObject:favorite];
        }
        return items;
    } else {
        NSLog(@"%@", [error localizedDescription]);
        return @[];
    }
}

- (BOOL)updateRecord:(id<Item>)item {
    // UPDATE operation not needed
    return NO;
}

- (BOOL)deleteRecord:(id<Item>)item {
    NSFetchRequest *fetchRequest = [FavoriteRecord fetchRequest];
    [fetchRequest setPredicate:[NSPredicate predicateWithFormat:@"identifier = %ld", [item identifier]]];
    NSBatchDeleteRequest *deleteRequest = [[NSBatchDeleteRequest alloc] initWithFetchRequest:fetchRequest];
    NSError *error = nil;
    if ([[self context] executeRequest:deleteRequest error:&error]) {
        return YES;
    } else {
        NSLog(@"%@", [error localizedDescription]);
        return NO;
    }
}

#pragma mark - Implementation helpers

- (NSManagedObjectContext *)context {
    return [[self persistentContainer] viewContext];
}

- (void)fillRecord:(FavoriteRecord *)record withItem:(id<Item>)item {
    [record setIdentifier:(int32_t)[item identifier]];
    [record setTitle:[item title]];
    [record setImagePath:[item imagePath]];
    [record setReleaseDate:[item releaseDate]];
    [record setVoteAverage:[[item voteAverage] floatValue]];
}

@end
