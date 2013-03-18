# MIMultiSelectSegmentedControl

MIMultiSelectSegmentedControl is an iOS class that displays segmented control with multiple select state. It is meant as a replacement for the segmented control (default control) without multiple select state function. 

## Requirements

MIMultiSelectSegmentedControl works on any iOS version and is compatible with only ARC project. It depends on the following Apple frameworks, which should already be included with most Xcode templates:

* Foundation.framework
* UIKit.framework

## Adding MIMultiSelectSegmentedControl to your project

### Source files

Alternatively you can directly add the `MIMultiSelectSegmentedControl.h` and `MIMultiSelectSegmentedControl.m` source files to your project.

1. Download the [latest code version](https://github.com/matej/MIMultiSelectSegmentedControl/archive/master.zip) or add the repository as a git submodule to your git-tracked project. 
2. Open your project in Xcode, than drag and drop `MIMultiSelectSegmentedControl.h`, `MIMultiSelectSegmentedControl.m` and required images onto your project (use the "Product Navigator view"). Make sure to select Copy items when asked if you extracted the code archive outside of your project. 
3. Include MIMultiSelectSegmentedControl wherever you need it with `#import "MIMultiSelectSegmentedControl.h"`.

## Usage

```objective-c
MIMultiSelectSegmentedControl *multiSelectSegmentedControl = [[MIMultiSelectSegmentedControl alloc] initWithFrame:CGRectMake(10.0f, 10.0f, 120.0f, 29.0f)];
[multiSelectSegmentedControl setDelegate:self];

// with state
[multiSelectSegmentedControl setStateEnabled:YES];

// without state (static button)
//[multiSelectSegmentedControl initializeButtonBackgroundUIWithButtonIndex:SEGMENT_LEFT withStateEnabled:NO andType:SEGMENT_TYPE_NAV_WHITE];

[multiSelectSegmentedControl setTitle:@"Button1" forSegmentAtIndex:SEGMENT_LEFT];
[multiSelectSegmentedControl setTitle:@"Button2" forSegmentAtIndex:SEGMENT_RIGHT];
[self.view addSubview:multiSelectSegmentedControl];
```


## License

This code is distributed under the terms and conditions of the [MIT license](LICENSE). 

## Change-log

**Version 0.1** @ 18.3.13

- Initial release.