//
//  ImageLoader.h
//  MovieMate
//
//  Created by Tadeusz Purtak on 09/10/2020.
//  Copyright © 2020 Litterae. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Types.h"

NS_ASSUME_NONNULL_BEGIN

@interface ImageLoader : NSObject
 
- (void)loadImageFromPath:(NSString *const)path forView:(UIImageView *)imageView;

@end

NS_ASSUME_NONNULL_END
