//
//  NSArray+Utils.m
//  MovieMate
//
//  Created by Tadeusz Purtak on 09/10/2020.
//  Copyright © 2020 Litterae. All rights reserved.
//

#import "NSArray+Utils.h"

@implementation NSArray (Utils)

+ (NSArray * _Nullable)arrayFrom:(id _Nullable)object {
    if ([object isKindOfClass:[NSArray class]]) {
        NSArray *array = object;
        return array;
    } else {
        return nil;
    }
}

@end
