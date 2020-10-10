//
//  TextProvider.h
//  MovieMate
//
//  Created by Tadeusz Purtak on 10/10/2020.
//  Copyright © 2020 Litterae. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Item.h"

NS_ASSUME_NONNULL_BEGIN

@interface TextProvider : NSObject

@property (nonatomic, readonly) NSString * const appTitle;

+ (instancetype)shared;

- (NSString *)titleFor:(ItemType)itemType;
- (NSString *)releaseInfoFrom:(NSDate * _Nonnull)date;

@end

NS_ASSUME_NONNULL_END
