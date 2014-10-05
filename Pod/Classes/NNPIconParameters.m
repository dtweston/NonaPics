//
//  NNPIconParameters.m
//  NonaPics
//
//  Created by Dave Weston on 8/28/14.
//  Copyright (c) 2014 Binocracy Inc. All rights reserved.
//

#import "NNPIconParameters.h"

static NSDictionary *icons;

@implementation NNPIconParameters

+ (instancetype)defaultParameters
{
    NNPIconParameters *params = [[self alloc] init];
    params->_imageSize = 30;
    params->_iconSize = 28;
    params->_color = [NNPColor blackColor];
    params->_backgroundColor = [NNPColor clearColor];
    return params;
}

- (id)mutableCopyWithZone:(NSZone *)zone
{
    NNPMutableIconParameters *instance = [[NNPMutableIconParameters allocWithZone:zone] init];
    instance.imageSize = self.imageSize;
    instance.iconSize = self.iconSize;
    instance.color = self.color;
    instance.backgroundColor = self.backgroundColor;
    
    return instance;
}

- (id)copyWithZone:(NSZone *)zone
{
    NNPIconParameters *params = [[NNPIconParameters alloc] init];
    params->_imageSize = self.imageSize;
    params->_iconSize = self.iconSize;
    params->_color = self.color;
    params->_backgroundColor = self.backgroundColor;
    return params;
}

@end

@implementation NNPMutableIconParameters

- (void)setImageSize:(CGFloat)imageSize
{
    _imageSize = imageSize;
}

- (void)setIconSize:(CGFloat)iconSize
{
    _iconSize = iconSize;
}

- (void)setColor:(NNPColor *)color
{
    _color = color;
}

- (void)setBackgroundColor:(NNPColor *)backgroundColor
{
    _backgroundColor = backgroundColor;
}

@end
