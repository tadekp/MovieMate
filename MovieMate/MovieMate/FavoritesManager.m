//
//  FavoritesManager.m
//  MovieMate
//
//  Created by Tadeusz Purtak on 10/10/2020.
//  Copyright © 2020 Litterae. All rights reserved.
//

#import "FavoritesManager.h"
#import "FavoriteRecord.h"
#import "FavoritesManager+CRUD.h"
#import "FavoritesProvider.h"

@interface FavoritesManager ()
@property (nonatomic, nonnull, strong) NSMutableSet<id<FavoriteDelegate>> *delegates;
@property (nonatomic, nonnull, strong) NSMutableSet<NSNumber *> *identifiers;
@end

@implementation FavoritesManager

@synthesize provider = _provider;

+ (instancetype)shared {
    static FavoritesManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^ {
        sharedInstance = [[FavoritesManager alloc] init];
        [sharedInstance setup];
    });
    return sharedInstance;
}

- (void)addDelegate:(id<FavoriteDelegate>)delegate {
    [[self delegates] addObject:delegate];
}

- (void)removeDelegate:(id<FavoriteDelegate>)delegate {
    [[self delegates] removeObject:delegate];
}

- (BOOL)isFavorite:(id<Item>)item {
    return [[self identifiers] containsObject:[NSNumber numberWithInteger:[item identifier]]];
}

- (void)setFavorite:(id<Item>)item favorite:(BOOL)yes {
    NSNumber *number = [NSNumber numberWithInteger:[item identifier]];
    if (yes) {
        if (![self isFavorite:item]) {
            if ([self createRecord:item]) {
                [[self identifiers] addObject:number];
                [self broadcastInfoAbout:item asAdded:YES];
            } else {
                // TODO: implement failure in DB record creation
            }
        }
    } else {
        if ([self isFavorite:item]) {
            if ([self deleteRecord:item]) {
                [[self identifiers] removeObject:number];
                [self broadcastInfoAbout:item asAdded:NO];
            } else {
                // TODO: implement failure in DB record deletion
            }
        }
    }
}

- (void)toggle:(id<Item>)item {
    [self setFavorite:item favorite:![self isFavorite:item]];
}

#pragma mark - Implementation details

- (void)setup {
    _provider = [[FavoritesProvider alloc] init];
    [self setDelegates:[NSMutableSet set]];
    [self setIdentifiers:[NSMutableSet set]];
    NSArray<id<Item>> *savedFavoriteItems = [self readRecords];
    for (id<Item> item in savedFavoriteItems) {
        [[self identifiers] addObject:[NSNumber numberWithInteger:[item identifier]]];
    }
}

- (void)broadcastInfoAbout:(id<Item>)item asAdded:(BOOL)added {
    for (id<FavoriteDelegate> delegate in [self delegates]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [delegate favoriteItem:item addedOrRemoved:added];
        });
    }
}

#pragma mark - Core Data stack

@synthesize persistentContainer = _persistentContainer;

- (NSPersistentContainer *)persistentContainer {
    // The persistent container for the application. This implementation creates and returns a container, having loaded the store for the application to it.
    @synchronized (self) {
        if (_persistentContainer == nil) {
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"MovieMate"];
            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
                if (error != nil) {
                    // Replace this implementation with code to handle the error appropriately.
                    // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                    
                    /*
                     Typical reasons for an error here include:
                     * The parent directory does not exist, cannot be created, or disallows writing.
                     * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                     * The device is out of space.
                     * The store could not be migrated to the current model version.
                     Check the error message to determine what the actual problem was.
                    */
                    NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                    abort();
                }
            }];
        }
    }
    
    return _persistentContainer;
}

- (void)saveContext {
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    NSError *error = nil;
    if ([context hasChanges] && ![context save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}

@end
