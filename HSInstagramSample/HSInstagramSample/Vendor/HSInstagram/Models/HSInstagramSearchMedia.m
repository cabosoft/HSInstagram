//
//  HSInstagramSearchMedia.m
//  HSInstagramSample
//
//  Created by Harminder Sandhu on 12-01-20.
//  Copyright (c) 2012 Pushbits. All rights reserved.
//

#import "HSInstagramSearchMedia.h"
#import "HSInstagram.h"

@implementation HSInstagramSearchMedia

@synthesize thumbnailUrl = _thumbnailUrl;
@synthesize standardUrl = _standardUrl;
@synthesize likes = _likes;

- (id)initWithAttributes:(NSDictionary *)attributes {
    self = [super init];
    if (!self) {
        return nil;
    }
    self.thumbnailUrl = [[[attributes valueForKeyPath:@"images"] valueForKeyPath:@"thumbnail"] valueForKeyPath:@"url"];
    self.standardUrl = [[[attributes valueForKeyPath:@"images"] valueForKeyPath:@"standard_resolution"] valueForKeyPath:@"url"];
    self.likes = [[[attributes objectForKey:@"likes"] valueForKey:@"count"] integerValue];
    return self;
}

+ (void)getSearchMediaCoord:(CLLocationCoordinate2D)coord andDistance:(int) meters block:(void (^)(NSArray *records))block
{
	assert([HSInstagram sharedClient].clientId.length > 0);
	
    NSDictionary* params = [NSDictionary dictionaryWithObject:[HSInstagram sharedClient].clientId forKey:@"client_id"];
    NSString* path = [NSString stringWithFormat:kSerachMediaRecentEndpoint, coord.latitude, coord.longitude, meters];
    
    [[HSInstagram sharedClient] getPath:path
                             parameters:params
                                success:^(AFHTTPRequestOperation *operation, id responseObject) {
                                    NSMutableArray *mutableRecords = [NSMutableArray array];
                                    NSArray* data = [responseObject objectForKey:@"data"];
                                    for (NSDictionary* obj in data) {
                                        HSInstagramSearchMedia* media = [[HSInstagramSearchMedia alloc] initWithAttributes:obj];
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
