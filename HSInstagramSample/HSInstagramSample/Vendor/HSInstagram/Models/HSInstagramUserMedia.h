//
//  HSInstagramUserMedia.h
//  HSInstagramSample
//
//  Created by Harminder Sandhu on 12-05-01.
//  Copyright (c) 2012 Pushbits. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HSInstagramUserMedia : NSObject

// On success returns instagram's defualt result count (20 or less) of HSInstagramMediaResult objects
// Requires an accessToken.
+ (void)getUserMediaWithId:(NSString*)userId
           withAccessToken:(NSString*)accessToken
                     block:(void (^)(NSArray *records))block;

// On success returns 'count' (or less) of HSInstagramMediaResult objects
// Authorized call - requires an accessToken.
+ (void)getUserMediaWithId:(NSString*)userId
			photoCount:(int) count
           		withAccessToken:(NSString*)accessToken
                     block:(void (^)(NSArray *records))block;

@end
