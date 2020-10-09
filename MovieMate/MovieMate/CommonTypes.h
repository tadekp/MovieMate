//
//  CommonTypes.h
//  MovieMate
//
//  Created by Tadeusz Purtak on 08/10/2020.
//  Copyright © 2020 Litterae. All rights reserved.
//

#ifndef CommonTypes_h
#define CommonTypes_h

#import <UIKit/UIKit.h>

@class Movies;

typedef void (^Lambda)(void);
typedef void (^MoviesResult)(Movies const* _Nullable, NSString const* _Nullable);
typedef void (^ImageResult)(UIImage const* _Nullable, NSString const* _Nullable);
typedef void (^Completed)(BOOL successfully, NSString const* _Nullable);

#endif /* CommonTypes_h */
