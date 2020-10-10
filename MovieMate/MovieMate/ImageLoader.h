//
//  ImageLoader.h
//  MovieMate
//
//  Created by Tadeusz Purtak on 09/10/2020.
//  Copyright © 2020 Litterae. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Types.h"

NS_ASSUME_NONNULL_BEGIN

@interface ImageLoader : NSObject

- (instancetype _Nonnull)initWith:(NSURLSessionConfiguration *)configuration;
- (void)loadImageFromPath:(NSString * const)path result:(ImageResult _Nonnull)result;

@end

NS_ASSUME_NONNULL_END
