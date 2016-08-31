//
//  HSInstagramSearchMedia.m
//  HSInstagramSample
//
//  Created by Harminder Sandhu on 12-01-20.
//  Copyright (c) 2012 Pushbits. All rights reserved.
//

#import "HSInstagramSearchMedia.h"
#import "HSInstagramMediaResult.h"
#import "HSInstagram.h"

@implementation HSInstagramSearchMedia

+ (void)getSearchMediaCoord:(CLLocationCoordinate2D)coord
				andDistance:(NSUInteger) meters
					withAccessToken:(NSString*)accessToken
					  block:(void (^)(NSArray *records))block
{
	[HSInstagramSearchMedia getSearchMediaCoord:coord andDistance:meters photoCount:0 withAccessToken:accessToken block:block];
}

+ (void)getSearchMediaCoord:(CLLocationCoordinate2D)coord
				andDistance:(NSUInteger) meters
				 photoCount:(NSUInteger) count
					withAccessToken:(NSString*)accessToken
					  block:(void (^)(NSArray *records))block
{
	assert([HSInstagram sharedClient].clientId.length > 0);
	
    NSDictionary* params = (accessToken.length > 0) ?
			[NSDictionary dictionaryWithObject:accessToken forKey:@"access_token"] : 
				[NSDictionary dictionaryWithObject:[HSInstagram sharedClient].clientId forKey:@"client_id"];
	
    NSString* path = [NSString stringWithFormat:kSearchMediaRecentEndpoint, coord.latitude, coord.longitude, meters, count];
    
    [[HSInstagram sharedClient] GET:path
                             parameters:params
                                success:^(NSURLSessionDataTask *task, id responseObject) {
                                    NSMutableArray *mutableRecords = [NSMutableArray array];
                                    NSArray* data = [responseObject objectForKey:@"data"];
                                    for (NSDictionary* obj in data) {
                                        HSInstagramMediaResult* media = [[HSInstagramMediaResult alloc] initWithAttributes:obj];
                                        [mutableRecords addObject:media];
                                    }
                                    if (block) {
                                        block([NSArray arrayWithArray:mutableRecords]);
                                    }
                                }
                                failure:^(NSURLSessionDataTask *task, NSError *error) {
                                    NSLog(@"error: %@", error.localizedDescription);
                                    if (block) {
                                        block([NSArray array]);
                                    }
                                }];
}

@end
