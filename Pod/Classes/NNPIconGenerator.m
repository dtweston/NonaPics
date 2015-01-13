//
//  BCYGithubIcon.m
//  CodeReviewer
//
//  Created by Dave Weston on 8/28/14.
//  Copyright (c) 2014 Binocracy Inc. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <CoreText/CoreText.h>

#import "NNPIconGenerator.h"
#import "NNPIconParameters.h"

static NSDictionary *icons;

@interface NNPIconGenerator ()

@property (nonatomic, strong) NNPIconParameters *params;

@end

@implementation NNPIconGenerator

+ (void)initialize
{
    [self setupMap];
    [self loadFont];
}

+ (void)setupMap
{
    icons = @{
              @"alert": @"\uf02d",
              @"alignment-align": @"\uf08a",
              @"alignment-align-to": @"\uf08e",
              @"alignment-unalign": @"\uf08b",
              @"arrow-down": @"\uf03f",
              @"arrow-left": @"\uf040",
              @"arrow-right": @"\uf03e",
              @"arrow-small-down": @"\uf0a0",
              @"arrow-small-left": @"\uf0a1",
              @"arrow-small-right": @"\uf071",
              @"arrow-small-up": @"\uf09f",
              @"arrow-up": @"\uf03d",
              @"beer": @"\uf069",
              @"book": @"\uf007",
              @"bookmark": @"\uf07b",
              @"briefcase": @"\uf0d3",
              @"broadcast": @"\uf048",
              @"browser": @"\uf0c5",
              @"bug": @"\uf091",
              @"calendar": @"\uf068",
              @"check": @"\uf03a",
              @"checklist": @"\uf076",
              @"chevron-down": @"\uf0a3",
              @"chevron-left": @"\uf0a4",
              @"chevron-right": @"\uf078",
              @"chevron-up": @"\uf0a2",
              @"circle-slash": @"\uf084",
              @"circuit-board": @"\uf0d6",
              @"clippy": @"\uf035",
              @"clock": @"\uf046",
              @"cloud-download": @"\uf00b",
              @"cloud-upload": @"\uf00c",
              @"code": @"\uf05f",
              @"color-mode": @"\uf065",
              @"comment": @"\uf02b",
              @"comment-discussion": @"\uf04f",
              @"credit-card": @"\uf045",
              @"dash": @"\uf0ca",
              @"dashboard": @"\uf07d",
              @"database": @"\uf096",
              @"device-camera": @"\uf056",
              @"device-camera-video": @"\uf057",
              @"device-desktop": @"\uf27c",
              @"device-mobile": @"\uf038",
              @"diff": @"\uf04d",
              @"diff-added": @"\uf06b",
              @"diff-ignored": @"\uf099",
              @"diff-modified": @"\uf06d",
              @"diff-removed": @"\uf06c",
              @"diff-renamed": @"\uf06e",
              @"ellipsis": @"\uf09a",
              @"eye": @"\uf04e",
              @"file-binary": @"\uf094",
              @"file-code": @"\uf010",
              @"file-directory": @"\uf016",
              @"file-media": @"\uf012",
              @"file-pdf": @"\uf014",
              @"file-submodule": @"\uf017",
              @"file-symlink-directory": @"\uf0b1",
              @"file-symlink-file": @"\uf0b0",
              @"file-text": @"\uf011",
              @"file-zip": @"\uf013",
              @"flame": @"\uf0d2",
              @"fold": @"\uf0cc",
              @"gear": @"\uf02f",
              @"gift": @"\uf042",
              @"gist": @"\uf00e",
              @"gist-secret": @"\uf08c",
              @"git-branch": @"\uf020",
              @"git-commit": @"\uf01f",
              @"git-compare": @"\uf0ac",
              @"git-merge": @"\uf023",
              @"git-pull-request": @"\uf009",
              @"globe": @"\uf0b6",
              @"graph": @"\uf043",
              @"heart": @"\u2665",
              @"history": @"\uf07e",
              @"home": @"\uf08d",
              @"horizontal-rule": @"\uf070",
              @"hourglass": @"\uf09e",
              @"hubot": @"\uf09d",
              @"inbox": @"\uf0cf",
              @"info": @"\uf059",
              @"issue-closed": @"\uf028",
              @"issue-opened": @"\uf026",
              @"issue-reopened": @"\uf027",
              @"jersey": @"\uf019",
              @"jump-down": @"\uf072",
              @"jump-left": @"\uf0a5",
              @"jump-right": @"\uf0a6",
              @"jump-up": @"\uf073",
              @"key": @"\uf049",
              @"keyboard": @"\uf00d",
              @"law": @"\uf0d8",
              @"light-bulb": @"\uf000",
              @"link": @"\uf05c",
              @"link-external": @"\uf07f",
              @"list-ordered": @"\uf062",
              @"list-unordered": @"\uf061",
              @"location": @"\uf060",
              @"lock": @"\uf06a",
              @"logo-github": @"\uf092",
              @"mail": @"\uf03b",
              @"mail-read": @"\uf03c",
              @"mail-reply": @"\uf051",
              @"mark-github": @"\uf00a",
              @"markdown": @"\uf0c9",
              @"megaphone": @"\uf077",
              @"mention": @"\uf0be",
              @"microscope": @"\uf089",
              @"milestone": @"\uf075",
              @"mirror": @"\uf024",
              @"mortar-board": @"\uf0d7",
              @"move-down": @"\uf0a8",
              @"move-left": @"\uf074",
              @"move-right": @"\uf0a9",
              @"move-up": @"\uf0a7",
              @"mute": @"\uf080",
              @"no-newline": @"\uf09c",
              @"octoface": @"\uf008",
              @"organization": @"\uf037",
              @"package": @"\uf0c4",
              @"paintcan": @"\uf0d1",
              @"pencil": @"\uf058",
              @"person": @"\uf018",
              @"pin": @"\uf041",
              @"playback-fast-forward": @"\uf0bd",
              @"playback-pause": @"\uf0bb",
              @"playback-play": @"\uf0bf",
              @"playback-rewind": @"\uf0bc",
              @"plug": @"\uf0d4",
              @"plus": @"\uf05d",
              @"podium": @"\uf0af",
              @"primitive-dot": @"\uf052",
              @"primitive-square": @"\uf053",
              @"pulse": @"\uf085",
              @"puzzle": @"\uf0c0",
              @"question": @"\uf02c",
              @"quote": @"\uf063",
              @"radio-tower": @"\uf030",
              @"repo": @"\uf001",
              @"repo-clone": @"\uf04c",
              @"repo-force-push": @"\uf04a",
              @"repo-forked": @"\uf002",
              @"repo-pull": @"\uf006",
              @"repo-push": @"\uf005",
              @"rocket": @"\uf033",
              @"rss": @"\uf034",
              @"ruby": @"\uf047",
              @"screen-full": @"\uf066",
              @"screen-normal": @"\uf067",
              @"search": @"\uf02e",
              @"server": @"\uf097",
              @"settings": @"\uf07c",
              @"sign-in": @"\uf036",
              @"sign-out": @"\uf032",
              @"split": @"\uf0c6",
              @"squirrel": @"\uf0b2",
              @"star": @"\uf02a",
              @"steps": @"\uf0c7",
              @"stop": @"\uf08f",
              @"sync": @"\uf087",
              @"tag": @"\uf015",
              @"telescope": @"\uf088",
              @"terminal": @"\uf0c8",
              @"three-bars": @"\uf05e",
              @"tools": @"\uf031",
              @"trashcan": @"\uf0d0",
              @"triangle-down": @"\uf05b",
              @"triangle-left": @"\uf044",
              @"triangle-right": @"\uf05a",
              @"triangle-up": @"\uf0aa",
              @"unfold": @"\uf039",
              @"unmute": @"\uf0ba",
              @"versions": @"\uf064",
              @"x": @"\uf081",
              @"zap": @"\u26a1",
              };
}

+ (void)loadFont
{
    NSString *bundlePath = [[NSBundle mainBundle] pathForResource:NNPBundleName ofType:@"bundle"];
    
    NSBundle *bundle = [NSBundle bundleWithPath:bundlePath];
    NSURL *fontUrl = [bundle URLForResource:@"octicons" withExtension:@"ttf"];
    CFErrorRef cfError = nil;
    BOOL success = CTFontManagerRegisterFontsForURL((CFURLRef)fontUrl, kCTFontManagerScopeProcess, &cfError);
    if (!success) {
        NSError *error = CFBridgingRelease(cfError);
        NSLog(@"Unable to load font: %@", error);
    }
}

+ (NSArray *)imageKeys
{
    return [[icons allKeys] sortedArrayUsingSelector:@selector(localizedCompare:)];
}

+ (instancetype)generatorWithParams:(NNPIconParameters *)params
{
    NNPIconGenerator *generator = [[self alloc] initWithParams:params];
    generator.params = params;
    
    return generator;
}

+ (NNPImage *)imageWithKey:(NSString *)text params:(NNPIconParameters *)params
{
#if TARGET_OS_IPHONE
    CGSize imageSize = CGSizeMake(params.imageSize, params.imageSize);
    UIGraphicsBeginImageContextWithOptions(imageSize, NO, [[UIScreen mainScreen] scale]);
    
    [params.backgroundColor setFill];
    CGContextFillRect(UIGraphicsGetCurrentContext(), (CGRect){.origin = CGPointZero, .size = imageSize});
    
    NSDictionary *attribs = @{NSFontAttributeName:[UIFont fontWithName:@"octicons" size:params.iconSize], NSForegroundColorAttributeName:params.color};
    CGSize reqSize = [text sizeWithAttributes:attribs];
    [text drawInRect:CGRectMake((params.imageSize - reqSize.width) / 2, (params.imageSize - reqSize.height) / 2, reqSize.width, reqSize.height) withAttributes:attribs];
    NNPImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
#else
    NSSize imageSize = NSMakeSize(params.imageSize, params.imageSize);
    NNPImage *image = [[NNPImage alloc] initWithSize:imageSize];
    [image lockFocusFlipped:YES];
    
    [params.backgroundColor setFill];
    [NSBezierPath fillRect:(NSRect){.origin = NSZeroPoint, .size = imageSize}];
    
    NSDictionary *attribs = @{NSFontAttributeName:[NSFont fontWithName:@"octicons" size:params.iconSize], NSForegroundColorAttributeName: params.color};
    
    CGSize reqSize = [text sizeWithAttributes:attribs];
    [text drawInRect:NSMakeRect((params.imageSize - reqSize.width) / 2, (params.imageSize - reqSize.height) / 2, reqSize.width, reqSize.height) withAttributes:attribs];
    
    [image unlockFocus];
    return image;
#endif
}

- (instancetype)initWithParams:(NNPIconParameters *)params
{
    self = [super init];
    if (self) {
        _params = [params copy];
    }
    
    return self;
}

- (id)init
{
    return [self initWithParams:[NNPIconParameters defaultParameters]];
}

- (NNPImage *)imageWithKey:(NSString *)key
{
    return [self.class imageWithKey:icons[key] params:self.params];
}

@end
