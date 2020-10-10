//
//  NSDateFormatter+Common.m
//  MovieMate
//
//  Created by Tadeusz Purtak on 10/10/2020.
//  Copyright © 2020 Litterae. All rights reserved.
//

#import "NSDateFormatter+Common.h"

static NSString * const defaultDayFormatString = @"yyyy-MM-dd";
static NSDateFormatter *_dayFormatter = nil;

@implementation NSDateFormatter (Common)

+ (NSDateFormatter *)common {
    if (_dayFormatter == nil) {
        _dayFormatter = [[NSDateFormatter alloc] init];
        [_dayFormatter setDateFormat:defaultDayFormatString];
    }
    return _dayFormatter;
}

@end
