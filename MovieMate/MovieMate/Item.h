//
//  Item.h
//  MovieMate
//
//  Created by Tadeusz Purtak on 10/10/2020.
//  Copyright © 2020 Litterae. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum {
    kMovie,
    kFavorite
} ItemType;

//typedef void (^ItemsResult)(Movies const* _Nullable, NSString const* _Nullable);

@protocol Item <NSObject>

@required
@property (nonatomic, readonly) ItemType itemType;
@property (nonatomic, readonly) NSInteger identifier;
@property (nonatomic, strong, readonly) NSString *title;
@property (nonatomic, strong, readonly) NSString *imagePath;
@property (nonatomic, strong, readonly) NSDate *releaseDate;
@property (nonatomic, strong, readonly) NSNumber *voteAverage;

@end

NS_ASSUME_NONNULL_END
