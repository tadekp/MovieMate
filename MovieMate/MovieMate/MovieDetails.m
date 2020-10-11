//
//  MovieDetails.m
//  MovieMate
//
//  Created by Tadeusz Purtak on 10/10/2020.
//  Copyright © 2020 Litterae. All rights reserved.
//

#import "MovieDetails.h"
#import "NSDictionary+Utils.h"

@implementation MovieDetails

@synthesize homepage = _homepage;

- (instancetype)initWith:(NSDictionary *)dictionary {
    self = [super initWith:dictionary];
    _homepage = [dictionary stringForKey:@"homepage"];
    return self;
}

@end
