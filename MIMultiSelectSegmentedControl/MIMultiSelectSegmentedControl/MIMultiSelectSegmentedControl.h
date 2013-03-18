//
//  MIMultiSelectSegmentedControl.h
//  MIMultiSelectSegmentedControl
//
//  Created by morph85 on 1/22/13.
//
//

#import <UIKit/UIKit.h>

typedef enum {
    SEGMENT_LEFT = 0,
    SEGMENT_RIGHT = 1,
    SEGMENT_NONE = -1
} MIMultiSelectSegment;

typedef enum {
    SEGMENT_TYPE_NAV_WHITE = 1,
    SEGMENT_TYPE_NAV_DARK
} MIMultiSelectSegmentType;

@protocol MIMultiSelectSegmentedControlDelegate <NSObject>
@optional
- (void)multiselectSegmentControl:(UIButton*)button touchDownWithSegmentAtIndex:(NSUInteger)segment pressedWithEnabledState:(BOOL)enabled;
- (void)multiselectSegmentControl:(UIButton*)button touchUpInsideWithSegmentAtIndex:(NSUInteger)segment pressedWithEnabledState:(BOOL)enabled;
@end

@interface MIMultiSelectSegmentedControl : UILabel
@property (strong, nonatomic) UIButton *buttonLeft;
@property (strong, nonatomic) UIButton *buttonRight;
@property (assign, nonatomic) BOOL stateEnabled;
@property (strong, nonatomic) id <MIMultiSelectSegmentedControlDelegate> delegate;
- (void)setTitle:(NSString *)title forSegmentAtIndex:(NSUInteger)segment;
- (void)setSelected:(BOOL)selected forSegmentAtIndex:(NSUInteger)segment;
- (void)initializeButtonBackgroundUIWithButtonIndex:(MIMultiSelectSegment)index withStateEnabled:(BOOL)isStateEnabled andType:(MIMultiSelectSegmentType)segmentType;
@end
