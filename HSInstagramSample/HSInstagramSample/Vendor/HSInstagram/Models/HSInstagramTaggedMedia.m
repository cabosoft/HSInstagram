//
//  HSInstagramTaggedMedia.m
//  HSInstagramSample
//
//  Created by Harminder Sandhu on 12-01-20.
//  Copyright (c) 2012 Pushbits. All rights reserved.
//

#import "HSInstagramTaggedMedia.h"
#import "HSInstagramMediaResult.h"
#import "HSInstagram.h"

@implementation HSInstagramTaggedMedia

+ (void)getMediaWithTag:(NSString*)tag
					withAccessToken:(NSString*)accessToken
					  block:(void (^)(NSArray *records))block
{
	[HSInstagramTaggedMedia getMediaWithTag:tag photoCount:0 withAccessToken:accessToken block:block];
}

+ (void)getMediaWithTag:(NSString*)tag
				 photoCount:(int) count
					withAccessToken:(NSString*)accessToken
					  block:(void (^)(NSArray *records))block
{
	assert([HSInstagram sharedClient].clientId.length > 0);
	
    NSDictionary* params = (accessToken.length > 0) ?
			[NSDictionary dictionaryWithObject:accessToken forKey:@"access_token"] : 
				[NSDictionary dictionaryWithObject:[HSInstagram sharedClient].clientId forKey:@"client_id"];
	
    NSString* path = [NSString stringWithFormat:kTaggedMediaRecentEndpoint, tag, count];
    
    [[HSInstagram sharedClient] getPath:path
                             parameters:params
                                success:^(AFHTTPRequestOperation *operation, id responseObject) {
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
                                failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                    NSLog(@"error: %@", error.localizedDescription);
                                    if (block) {
                                        block([NSArray array]);
                                    }
                                }];
}

@end
