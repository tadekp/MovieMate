//
//  Types.h
//  MovieMate
//
//  Created by Tadeusz Purtak on 08/10/2020.
//  Copyright © 2020 Litterae. All rights reserved.
//

#ifndef Types_h
#define Types_h

#import <UIKit/UIKit.h>

typedef void (^Lambda)(void);
typedef void (^ImageResult)(UIImage const* _Nullable, NSString const* _Nullable);
typedef void (^Completed)(BOOL successfully, NSString const* _Nullable);

#endif /* Types_h */
