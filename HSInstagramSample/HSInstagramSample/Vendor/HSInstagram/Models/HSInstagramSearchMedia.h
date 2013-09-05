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

@property (nonatomic, strong) NSString* thumbnailUrl;
@property (nonatomic, strong) NSString* standardUrl;
@property (nonatomic, assign) NSUInteger likes;

+ (void)getSearchMediaCoord:(CLLocationCoordinate2D)coord andDistance:(int) meters block:(void (^)(NSArray *records))block;

@end
