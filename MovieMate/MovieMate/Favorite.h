//
//  Favorite+CoreDataClass.h
//  
//
//  Created by Tadeusz Purtak on 10/10/2020.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Item.h"

NS_ASSUME_NONNULL_BEGIN

@interface Favorite : NSManagedObject <Item>

+ (NSFetchRequest<Favorite *> *)fetchRequest;

@property (nonatomic) int32_t fIdentifier;
@property (nullable, nonatomic, copy) NSString *fImagePath;
@property (nullable, nonatomic, copy) NSDate *fReleaseDate;
@property (nullable, nonatomic, copy) NSString *fTitle;
@property (nonatomic) float fVoteAverage;

- (void)fillWithItem:(id<Item>)item;

@end

NS_ASSUME_NONNULL_END
