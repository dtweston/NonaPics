//
//  NNPIconGenerator.h
//  NonaPics
//
//  Created by Dave Weston on 8/28/14.
//  Copyright (c) 2014 Binocracy Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "platform-support.h"

@class NNPIconParameters;

@interface NNPIconGenerator : NSObject

+ (instancetype)generatorWithParams:(NNPIconParameters *)params;
+ (NSArray *)imageKeys;
- (NNPImage *)imageWithKey:(NSString *)key;

@end
