//
//  NNPIconParameters.h
//  NonaPics
//
//  Created by Dave Weston on 8/28/14.
//  Copyright (c) 2014 Binocracy Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "platform-support.h"

@interface NNPIconParameters : NSObject<NSMutableCopying,NSCopying>
{
    CGFloat _iconSize;
    CGFloat _imageSize;
    NNPColor *_color;
    NNPColor *_backgroundColor;
}

+ (instancetype)defaultParameters;

@property (readonly) CGFloat imageSize;
@property (readonly) CGFloat iconSize;
@property (readonly) NNPColor *color;
@property (readonly) NNPColor *backgroundColor;

@end

@interface NNPMutableIconParameters : NNPIconParameters

@property (readwrite) CGFloat imageSize;
@property (readwrite) CGFloat iconSize;
@property (readwrite) NNPColor *color;
@property (readwrite) NNPColor *backgroundColor;

@end
