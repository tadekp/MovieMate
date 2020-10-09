//
//  NSDictionary+Utils.m
//  MovieMate
//
//  Created by Tadeusz Purtak on 08/10/2020.
//  Copyright © 2020 Litterae. All rights reserved.
//

#import "NSDictionary+Utils.h"

static NSString * const defaultDayFormatString = @"yyyy-MM-dd";
static NSString * const defaultDayTimeFormatString = @"yyyy-MM-dd HH:mm";
static NSDateFormatter *_dayFormatter = nil;

@implementation NSDictionary (Utils)

- (NSString *)stringForKey:(NSString *)key {
    NSObject *value = [self objectForKey:key];
    NSString *string = nil;
    if (value != [NSNull null] && [value isKindOfClass:[NSString class]]) {
        string = (NSString *)value;
    }
    return string;
}

- (NSDate *)dateForKey:(NSString *)key formattedAs:(NSString *)format {
    NSString *s = [self stringForKey:key];
    if (s != nil) {
        return [[self dateFormatterWith:format] dateFromString:s];
    } else {
        return nil;
    }
}

- (NSDate *)dateForKey:(NSString *)key {
    return [self dateForKey:key formattedAs:defaultDayFormatString];
}

+ (NSDictionary * _Nullable)dictionaryFrom:(id _Nullable)object {
    if ([object isKindOfClass:[NSDictionary class]]) {
        NSDictionary *dict = object;
        return dict;
    } else {
        return nil;
    }
}

#pragma mark - Implementation details

- (NSDateFormatter *)dateFormatterWith:(NSString * _Nonnull)format {
    if ([format isEqualToString:defaultDayFormatString]) {
        return [self dayFormatter];
    } else {
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:format];
        return formatter;
    }
}

- (NSDateFormatter *)dayFormatter {
    if (_dayFormatter == nil) {
        _dayFormatter = [[NSDateFormatter alloc] init];
        [_dayFormatter setDateFormat:defaultDayFormatString];
    }
    return _dayFormatter;
}

@end
