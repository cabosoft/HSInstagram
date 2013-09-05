//
//  HSInstagramMediaResult.m
//  GeoQuestApp
//
//  Created by Jim Boyd on 9/5/13.
//
//

#import "HSInstagramMediaResult.h"

@implementation HSInstagramMediaResult
@synthesize thumbnailUrl = _thumbnailUrl;
@synthesize thumbnailSize = _thumbnailSize;

@synthesize standardUrl = _standardUrl;
@synthesize standardSize = _standardSize;

@synthesize lowResolutionUrl = _lowResolutionUrl;
@synthesize lowResolutionSize = _lowResolutionSize;

@synthesize likes = _likes;
@synthesize caption = _caption;
@synthesize userName = _userName;

- (id)initWithAttributes:(NSDictionary *)attributes {
    self = [super init];
    if (!self) {
        return nil;
    }
    self.thumbnailUrl = [[[attributes valueForKeyPath:@"images"] valueForKeyPath:@"thumbnail"] valueForKeyPath:@"url"];
	self.thumbnailSize = CGSizeMake(150, 150);
	
	id height = [[[attributes valueForKeyPath:@"images"] valueForKeyPath:@"thumbnail"] valueForKeyPath:@"height"];
	id width = [[[attributes valueForKeyPath:@"images"] valueForKeyPath:@"thumbnail"] valueForKeyPath:@"width"];
	if ([height isKindOfClass:[NSNumber class]] && [width isKindOfClass:[NSNumber class]] )
	{
		self.thumbnailSize = CGSizeMake([width floatValue], [height floatValue]);
	}
	
    self.standardUrl = [[[attributes valueForKeyPath:@"images"] valueForKeyPath:@"standard_resolution"] valueForKeyPath:@"url"];
	self.standardSize = CGSizeMake(612, 612);
	
	height = [[[attributes valueForKeyPath:@"images"] valueForKeyPath:@"standard_resolution"] valueForKeyPath:@"height"];
	width = [[[attributes valueForKeyPath:@"images"] valueForKeyPath:@"standard_resolution"] valueForKeyPath:@"width"];
	if ([height isKindOfClass:[NSNumber class]] && [width isKindOfClass:[NSNumber class]] )
	{
		self.standardSize = CGSizeMake([width floatValue], [height floatValue]);
	}
	
    self.lowResolutionUrl = [[[attributes valueForKeyPath:@"images"] valueForKeyPath:@"low_resolution"] valueForKeyPath:@"url"];
	self.lowResolutionSize = CGSizeMake(306, 306);
	
	height = [[[attributes valueForKeyPath:@"images"] valueForKeyPath:@"low_resolution"] valueForKeyPath:@"height"];
	width = [[[attributes valueForKeyPath:@"images"] valueForKeyPath:@"low_resolution"] valueForKeyPath:@"width"];
	if ([height isKindOfClass:[NSNumber class]] && [width isKindOfClass:[NSNumber class]] )
	{
		self.lowResolutionSize = CGSizeMake([width floatValue], [height floatValue]);
	}
	
	self.caption = [[attributes valueForKeyPath:@"caption"] valueForKeyPath:@"text"];
	self.userName = [[[attributes valueForKeyPath:@"caption"] valueForKeyPath:@"from"] valueForKeyPath:@"full_name"];
	
    self.likes = [[[attributes objectForKey:@"likes"] valueForKey:@"count"] integerValue];
    return self;
}

@end
