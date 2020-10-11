//
//  FavoriteRecord.h
//  
//
//  Created by Tadeusz Purtak on 10/10/2020.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

@interface FavoriteRecord : NSManagedObject

+ (NSFetchRequest<FavoriteRecord *> *)fetchRequest;

@property (nonatomic) int32_t identifier;
@property (nullable, nonatomic, copy) NSString *imagePath;
@property (nullable, nonatomic, copy) NSDate *releaseDate;
@property (nullable, nonatomic, copy) NSString *title;
@property (nonatomic) float voteAverage;

@end

NS_ASSUME_NONNULL_END
