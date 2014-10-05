//
//  NNPIconView.m
//  NonaPics
//
//  Created by Dave Weston on 9/7/14.
//  Copyright (c) 2014 Dave Weston. All rights reserved.
//

#import "NNPIconView.h"

@interface NNPIconView ()

@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation NNPIconView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(2, 2, frame.size.width - 2, frame.size.height - 2)];
        [_imageView setContentMode:UIViewContentModeCenter];
        [_imageView setAutoresizingMask:UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth];
        [self setAutoresizesSubviews:YES];
        [self addSubview:self.imageView];
    }
    return self;
}

- (UIImage *)image
{
    return self.imageView.image;
}

- (void)setImage:(UIImage *)image
{
    [self.imageView setImage:image];
}

- (void)prepareForReuse
{
    self.image = nil;
}

@end
