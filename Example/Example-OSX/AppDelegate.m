//
//  AppDelegate.m
//  OSX Example
//
//  Created by Dave Weston on 9/16/14.
//  Copyright (c) 2014 Dave Weston. All rights reserved.
//

#import "AppDelegate.h"

#import <NonaPics/NonaPics.h>

@interface AppDelegate ()<NSToolbarDelegate,NSTableViewDataSource,NSTableViewDelegate>

@property (weak) IBOutlet NSWindow *window;
@property (strong) NNPIconGenerator *generator;
@property (strong) NSArray *titles;

@end

@implementation AppDelegate

- (NSView *)buildTableView
{
    NSScrollView *tableContainer = [[NSScrollView alloc] initWithFrame:[[self.window contentView] frame]];
    NSTableView *tableView = [[NSTableView alloc] initWithFrame:NSMakeRect(0, 0, tableContainer.frame.size.width, 10000)];
    NSTableColumn *col1 = [[NSTableColumn alloc] initWithIdentifier:@"image"];
    NSTableColumn *col2 = [[NSTableColumn alloc] initWithIdentifier:@"name"];
    [col1.headerCell setStringValue:@"Image"];
    [col2.headerCell setStringValue:@"Name"];
    [col1 setWidth:150];
    [col2 setWidth:900];
    [tableView addTableColumn:col1];
    [tableView addTableColumn:col2];
    [tableView setDataSource:self];
    [tableView setDelegate:self];
    [tableView reloadData];
    
    [tableContainer setDocumentView:tableView];
    [tableContainer setHasVerticalRuler:YES];
    
    [tableContainer setAutoresizingMask:NSViewWidthSizable|NSViewHeightSizable];
    
    return tableContainer;
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    self.titles = [NNPIconGenerator imageKeys];
    
    NNPMutableIconParameters *params = [[NNPIconParameters defaultParameters] mutableCopy];
    params.iconSize = 45;
    params.imageSize = 50;
    
    self.generator = [NNPIconGenerator generatorWithParams:params];
    
    NSView *mainView = [self buildTableView];
    [[[self window] contentView] addSubview:mainView];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

#pragma mark - Table view data source methods

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView
{
    return [self.titles count];
}

- (CGFloat)tableView:(NSTableView *)tableView heightOfRow:(NSInteger)row
{
    return 100;
}

- (NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
    NSView *view;
    
    NSString *key = self.titles[row];
    
    if ([tableColumn.identifier isEqualToString:@"image"]) {
        NSImageView *imageView = [tableView makeViewWithIdentifier:tableColumn.identifier owner:self];
        if (!imageView) {
            imageView = [[NSImageView alloc] initWithFrame:NSMakeRect(0, 0, tableColumn.width, 100)];
            imageView.identifier = tableColumn.identifier;
        }

        imageView.image = [self.generator imageWithKey:key];
        view = imageView;
    }
    else if ([tableColumn.identifier isEqualToString:@"name"]) {
        NSTextField *textField = [tableView makeViewWithIdentifier:tableColumn.identifier owner:self];
        if (!textField) {
            textField = [[NSTextField alloc] initWithFrame:NSMakeRect(0, 0, tableColumn.width, 100)];
            [textField setFont:[NSFont systemFontOfSize:28]];
        }
        
        textField.stringValue = key;
        view = textField;
    }
    
    return view;
}

@end
