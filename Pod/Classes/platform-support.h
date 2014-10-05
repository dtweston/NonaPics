//
//  platform-support.h
//  NonaPics
//
//  Created by Dave Weston on 9/16/14.
//

#if TARGET_OS_IPHONE

#import <UIKit/UIKit.h>

#define NNPColor UIColor
#define NNPImage UIImage
#define NNPBundleName @"NonaPics-iOS"

#else

#import <AppKit/AppKit.h>

#define NNPColor NSColor
#define NNPImage NSImage
#define NNPBundleName @"NonaPics-OSX"

#endif
