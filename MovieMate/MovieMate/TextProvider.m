//
//  TextProvider.m
//  MovieMate
//
//  Created by Tadeusz Purtak on 10/10/2020.
//  Copyright © 2020 Litterae. All rights reserved.
//

#import "TextProvider.h"
#import "NSDateFormatter+Common.h"

@implementation TextProvider

+ (instancetype)shared {
    static TextProvider *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^ {
        sharedInstance = [[TextProvider alloc] init];
    });
    return sharedInstance;
}

- (NSString *)appTitle {
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"];
}

- (NSString *)titleFor:(ItemType)item {
    NSString *subtitle;
    switch (item) {
    case kMovie:
        subtitle = @"Now playing movies";
        break;
    case kFavorite:
        subtitle = @"Favorite movies";
        break;;
    }
    return [NSString stringWithFormat:@"%1$@ - %2$@", [self appTitle], subtitle];
}

- (NSString *)releaseInfoFrom:(NSDate * _Nonnull)date {
    return [NSString stringWithFormat:@"Released: %@", [[NSDateFormatter common] stringFromDate:date]];
}

@end
