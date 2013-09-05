//
//  HSInstagramUserMedia.m
//  HSInstagramSample
//
//  Created by Harminder Sandhu on 12-05-01.
//  Copyright (c) 2012 Pushbits. All rights reserved.
//

#import "HSInstagramUserMedia.h"
#import "HSInstagramMediaResult.h"
#import "HSInstagram.h"

@implementation HSInstagramUserMedia

+ (void)getUserMediaWithId:(NSString*)userId
           withAccessToken:(NSString *)accessToken
                     block:(void (^)(NSArray *records))block
{
	[HSInstagramUserMedia getUserMediaWithId:userId photoCount:0 withAccessToken:accessToken block:block];
}

+ (void)getUserMediaWithId:(NSString*)userId
				photoCount:(int) count
				withAccessToken:(NSString*)accessToken
				block:(void (^)(NSArray *records))block
{
	assert(accessToken.length > 0);

    NSDictionary* params = [NSDictionary dictionaryWithObject:accessToken forKey:@"access_token"];
    NSString* path = [NSString stringWithFormat:kUserMediaRecentEndpoint, userId, count];
    
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
