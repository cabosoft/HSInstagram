//
//  HSInstagramMediaResult.h
//  GeoQuestApp
//
//  Created by Jim Boyd on 9/5/13.
//
//

#import <Foundation/Foundation.h>

@interface HSInstagramMediaResult : NSObject

- (id)initWithAttributes:(NSDictionary *)attributes;

@property (nonatomic, strong) NSString* thumbnailUrl;
@property (nonatomic, assign) CGSize thumbnailSize;

@property (nonatomic, strong) NSString* standardUrl;
@property (nonatomic, assign) CGSize standardSize;

@property (nonatomic, strong) NSString* lowResolutionUrl;
@property (nonatomic, assign) CGSize lowResolutionSize;

@property (nonatomic, strong) NSString* caption;
@property (nonatomic, strong) NSString* userName;
@property (nonatomic, assign) NSUInteger likes;


@end
