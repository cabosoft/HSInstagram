//
//  HSInstagramSearchMedia.h
//  HSInstagramSample
//
//  Created by Harminder Sandhu on 12-01-20.
//  Copyright (c) 2012 Pushbits. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface HSInstagramSearchMedia : NSObject

// On success returns instagram's defualt result count (20 or less) of HSInstagramMediaResult objects
// If accessToken is nill then the client-id will be passed in it's stead.
+ (void)getSearchMediaCoord:(CLLocationCoordinate2D)coord
				andDistance:(int) meters
					withAccessToken:(NSString*)accessToken
					  block:(void (^)(NSArray *records))block;

// On success returns 'count' (or less) of HSInstagramMediaResult objects  
// If accessToken is nill then the client-id will be passed in it's stead.
+ (void)getSearchMediaCoord:(CLLocationCoordinate2D)coord
				andDistance:(int) meters
				 photoCount:(int) count
					withAccessToken:(NSString*)accessToken
					  block:(void (^)(NSArray *records))block;

@end
