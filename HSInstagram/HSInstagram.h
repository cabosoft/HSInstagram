//
//  HSInstagram.h
//  HSInstagram
//
//  Created by Harminder Sandhu on 12-01-18.
//  Copyright (c) 2012 Pushbits. All rights reserved.
//

#import <Foundation/Foundation.h>
@import AFNetworking;

extern NSString * const kInstagramBaseURLString;

// Endpoints
extern NSString * const kLocationsEndpoint;
extern NSString * const kLocationsMediaRecentEndpoint;
extern NSString * const kUserMediaRecentEndpoint;
extern NSString * const kSearchMediaRecentEndpoint;
extern NSString * const kTaggedMediaRecentEndpoint;
extern NSString * const kAuthenticationEndpoint;

@interface HSInstagram : AFHTTPSessionManager

+ (HSInstagram *)sharedClient;
- (id)initWithBaseURL:(NSURL *)url;

//Include your client id from instagr.am
@property (nonatomic, strong) NSString* clientId;

//Include your redirect uri from instagr.am
@property (nonatomic, strong) NSString* redirectUri;

@end
