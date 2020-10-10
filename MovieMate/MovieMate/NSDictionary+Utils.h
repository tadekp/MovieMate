//
//  NSDictionary+Utils.h
//  MovieMate
//
//  Created by Tadeusz Purtak on 08/10/2020.
//  Copyright © 2020 Litterae. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary (Utils)

- (NSString *)stringForKey:(NSString *)key;
- (NSDate *)dateForKey:(NSString *)key;

+ (NSDictionary * _Nullable)dictionaryFrom:(id _Nullable)object;

@end

NS_ASSUME_NONNULL_END
