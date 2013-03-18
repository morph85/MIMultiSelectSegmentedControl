//
//  MIViewController.m
//  MIMultiSelectSegmentedControl
//
//  Created by morph85 on 3/18/13.
//  Copyright (c) 2013 Noctorus. All rights reserved.
//

#import "MIViewController.h"

@interface MIViewController ()

@end

@implementation MIViewController

- (id)init
{
    self = [super init];
    if (self)
    {
        if (!self.view)
        {
            self.view = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 100.0f, 100.0f)];
        }
        self.view.backgroundColor = [UIColor grayColor];
        
        MIMultiSelectSegmentedControl *multiSelectSegmentedControl = [[MIMultiSelectSegmentedControl alloc] initWithFrame:CGRectMake(10.0f, 10.0f, 120.0f, 29.0f)];
        [multiSelectSegmentedControl setDelegate:self];
        
        // with state
        [multiSelectSegmentedControl setStateEnabled:YES];
        
        // without state (static button)
        //[multiSelectSegmentedControl initializeButtonBackgroundUIWithButtonIndex:SEGMENT_LEFT withStateEnabled:NO andType:SEGMENT_TYPE_NAV_WHITE];
        
        [multiSelectSegmentedControl setTitle:@"Button1" forSegmentAtIndex:SEGMENT_LEFT];
        [multiSelectSegmentedControl setTitle:@"Button2" forSegmentAtIndex:SEGMENT_RIGHT];
        [self.view addSubview:multiSelectSegmentedControl];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark MIMultiSelectSegmentedControlDelegate

- (void)multiselectSegmentControl:(UIButton*)button touchDownWithSegmentAtIndex:(NSUInteger)segment pressedWithEnabledState:(BOOL)enabled
{
    NSLog(@"Touch down button %@ with segment %d %@.", button.titleLabel.text, segment, (enabled ? @"enabled" : @"disabled"));
}

- (void)multiselectSegmentControl:(UIButton*)button touchUpInsideWithSegmentAtIndex:(NSUInteger)segment pressedWithEnabledState:(BOOL)enabled
{
    NSLog(@"Touch up button %@ with segment %d %@.", button.titleLabel.text, segment, (enabled ? @"enabled" : @"disabled"));
}

@end
