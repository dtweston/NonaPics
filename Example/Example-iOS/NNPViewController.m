//
//  NNPViewController.m
//  NonaPics
//
//  Created by Dave Weston on 09/03/2014.
//  Copyright (c) 2014 Dave Weston. All rights reserved.
//

#import "NNPViewController.h"

#import "NNPIconView.h"

#import <NonaPics/NonaPics.h>

static const CGFloat minSize = 40;
static const CGFloat maxSize = 300;

@interface NNPViewController ()<UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UICollectionViewFlowLayout *flowLayout;
@property (nonatomic, strong) NNPIconGenerator *generator;
@property (nonatomic, strong) NSArray *imageKeys;

@end

@implementation NNPViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    self.imageKeys = [NNPIconGenerator imageKeys];
    
    self.generator = [NNPIconGenerator generatorWithParams:[NNPIconParameters defaultParameters]];
    
    self.flowLayout = [[UICollectionViewFlowLayout alloc] init];
    self.flowLayout.minimumInteritemSpacing = 5;
    self.flowLayout.minimumLineSpacing = 5;
    self.flowLayout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
    self.flowLayout.itemSize = CGSizeMake(40, 40);
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:self.flowLayout];
    [self.collectionView setAutoresizingMask:UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth];
    [self.collectionView setContentInset:UIEdgeInsetsMake(0, 0, 44, 0)];
    [self.collectionView setScrollIndicatorInsets:UIEdgeInsetsMake(0, 0, 44, 0)];
    [self.view setAutoresizesSubviews:YES];
    self.collectionView.dataSource = self;
    
    [self.view addSubview:self.collectionView];
    [self.collectionView registerClass:[NNPIconView class] forCellWithReuseIdentifier:@"a"];
    
    UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(self.view.bounds) - 44, CGRectGetWidth(self.view.bounds), 44)];
    UISlider *slider = [[UISlider alloc] init];
    [slider addTarget:self action:@selector(changeSize:) forControlEvents:UIControlEventValueChanged];
    UIBarButtonItem *sliderItem = [[UIBarButtonItem alloc] initWithCustomView:slider];
    UIBarButtonItem *flexSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    [toolbar setAutoresizingMask:UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleTopMargin];
    [toolbar setItems:@[flexSpace, sliderItem, flexSpace]];
    
    [self.view addSubview:toolbar];
    
    [self.collectionView setBackgroundColor:[UIColor whiteColor]];
}

#pragma  - mark

- (void)changeSize:(id)sender
{
    static CGFloat lastValue = 0;
    UISlider *slider = (UISlider *)sender;
    if (fabs(slider.value - lastValue) > 0.01) {
        lastValue = slider.value;
        NSLog(@"New value: %f", slider.value);
        NNPMutableIconParameters *params = [NNPMutableIconParameters defaultParameters];
        
        CGFloat itemSize = ceilf((maxSize - minSize) * slider.value + minSize);
        self.flowLayout.itemSize = CGSizeMake(itemSize, itemSize);
        params.imageSize = itemSize - 10;
        params.iconSize = itemSize - 12;
        self.generator = [NNPIconGenerator generatorWithParams:params];
        
        [self.collectionView reloadData];
    }
}

#pragma mark - Collection view data source methods

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.imageKeys count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NNPIconView *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"a" forIndexPath:indexPath];
    
    NSString *imageKey = self.imageKeys[indexPath.row];
    
    cell.image = [self.generator imageWithKey:imageKey];
    
    return cell;
}


@end
