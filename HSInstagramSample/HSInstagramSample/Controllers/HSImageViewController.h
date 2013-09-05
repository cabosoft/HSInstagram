//
//  HSImageViewController.h
//  HSInstagramSample
//
//  Created by Harminder Sandhu on 12-01-21.
//  Copyright (c) 2012 Pushbits. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HSInstagramMediaResult;

@interface HSImageViewController : UIViewController

@property (nonatomic, strong) UIImageView* imageView;
@property (nonatomic, strong) HSInstagramMediaResult* media;

- (id)initWithMedia:(HSInstagramMediaResult*)media;

@end
