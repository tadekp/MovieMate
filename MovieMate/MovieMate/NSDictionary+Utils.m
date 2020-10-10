//
//  NSDictionary+Utils.m
//  MovieMate
//
//  Created by Tadeusz Purtak on 08/10/2020.
//  Copyright © 2020 Litterae. All rights reserved.
//

#import "NSDictionary+Utils.h"
#import "NSDateFormatter+Common.h"

@implementation NSDictionary (Utils)

- (NSString *)stringForKey:(NSString *)key {
    NSObject *value = [self objectForKey:key];
    NSString *string = nil;
    if (value != [NSNull null] && [value isKindOfClass:[NSString class]]) {
        string = (NSString *)value;
    }
    return string;
}

- (NSDate *)dateForKey:(NSString *)key {
    NSString *s = [self stringForKey:key];
    if (s != nil) {
        return [[NSDateFormatter common] dateFromString:s];
    } else {
        return nil;
    }
}

+ (NSDictionary * _Nullable)dictionaryFrom:(id _Nullable)object {
    if ([object isKindOfClass:[NSDictionary class]]) {
        NSDictionary *dict = object;
        return dict;
    } else {
        return nil;
    }
}

@end
