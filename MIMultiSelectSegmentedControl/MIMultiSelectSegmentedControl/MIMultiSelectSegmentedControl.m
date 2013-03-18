//
//  MIMultiSelectSegmentedControl.m
//  MIMultiSelectSegmentedControl
//
//  Created by morph85 on 1/22/13.
//
//

#import "MIMultiSelectSegmentedControl.h"
#import <QuartzCore/QuartzCore.h>

@implementation MIMultiSelectSegmentedControl
@synthesize buttonLeft, buttonRight;
@synthesize stateEnabled;
@synthesize delegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initialize];
    }
    return self;
}

- (void)initialize
{
    stateEnabled = NO;
    
    self.backgroundColor = [UIColor darkGrayColor];
    self.layer.cornerRadius = 4;
    [self setUserInteractionEnabled:YES];
    
    float width = self.frame.size.width;
    float height = 29.0f; // fixed height
    float border_width = 0.0f;
    float border_height = 0.0f;
    
    buttonLeft = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    buttonLeft.frame = CGRectMake(-border_width, -border_height, width/2+border_width*2, height+border_height*2);
    [buttonLeft setTitle:@"Segment1" forState:UIControlStateNormal];
    [self initializeButtonUI:buttonLeft];
    [self initializeButtonBackgroundUI:buttonLeft withStateEnabled:stateEnabled andType:SEGMENT_TYPE_NAV_DARK];
    
    buttonRight = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    buttonRight.frame = CGRectMake(width/2-border_width+1, -border_height, width/2+border_width*2, height+border_height*2);
    [buttonRight setTitle:@"Segment2" forState:UIControlStateNormal];
    [self initializeButtonUI:buttonRight];
    [self initializeButtonBackgroundUI:buttonRight withStateEnabled:stateEnabled andType:SEGMENT_TYPE_NAV_DARK];
    
    [self addSubview:buttonLeft];
    [self addSubview:buttonRight];
}

- (void)initializeButtonUI:(UIButton *)button
{
    button.titleLabel.font = [UIFont boldSystemFontOfSize:12.0f];
    //button.titleLabel.textColor = [UIColor darkGrayColor];
    //button.titleLabel.shadowColor = [UIColor grayColor];
    button.titleLabel.shadowOffset = CGSizeMake(0.0f, -1.0f);
    
    [button setUserInteractionEnabled:YES];
    [button setAdjustsImageWhenDisabled:NO];
    [button setAdjustsImageWhenHighlighted:NO];
    
    [button addTarget:self action:@selector(touchDown:) forControlEvents:UIControlEventTouchDown];
    [button addTarget:self action:@selector(touchUpInside:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)initializeButtonBackgroundUIWithButtonIndex:(MIMultiSelectSegment)index withStateEnabled:(BOOL)isStateEnabled andType:(MIMultiSelectSegmentType)segmentType
{
    UIButton *button = [self getButtonFromSegmentIndex:index];
    if (button != nil)
    {
        [self initializeButtonBackgroundUI:button withStateEnabled:isStateEnabled andType:segmentType];
    }
    else
    {
        NSLog(@"Invalid button");
    }
}

- (void)initializeButtonBackgroundUI:(UIButton *)button withStateEnabled:(BOOL)isStateEnabled andType:(MIMultiSelectSegmentType)segmentType
{
    UIColor *titleColor = [UIColor whiteColor];
    UIColor *titleShadowColor = [UIColor darkGrayColor];
    if (button == buttonLeft)
    {
        switch (segmentType)
        {
            case SEGMENT_TYPE_NAV_WHITE:
                [button setBackgroundImage:[UIImage imageNamed:@"segment_nav_white_left.png"] forState:UIControlStateNormal];
                break;
            case SEGMENT_TYPE_NAV_DARK:
                [button setBackgroundImage:[UIImage imageNamed:@"segment_nav_dark_left.png"] forState:UIControlStateNormal];
                break;
            default:
                NSLog(@"Invalid segment type");
                break;
        }
    }
    else if (button == buttonRight)
    {
        switch (segmentType)
        {
            case SEGMENT_TYPE_NAV_WHITE:
                [button setBackgroundImage:[UIImage imageNamed:@"segment_nav_white_right.png"] forState:UIControlStateNormal];
                break;
            case SEGMENT_TYPE_NAV_DARK:
                [button setBackgroundImage:[UIImage imageNamed:@"segment_nav_dark_right.png"] forState:UIControlStateNormal];
                break;
            default:
                NSLog(@"Invalid segment type");
                break;
        }
    }
    
    if (isStateEnabled)
    {
        if (button == buttonLeft)
        {
            switch (segmentType)
            {
                case SEGMENT_TYPE_NAV_WHITE:
                    [button setBackgroundImage:[UIImage imageNamed:@"segment_nav_dark_left.png"] forState:UIControlStateHighlighted];
                    [button setBackgroundImage:[UIImage imageNamed:@"segment_nav_dark_left.png"] forState:UIControlStateSelected];
                    break;
                case SEGMENT_TYPE_NAV_DARK:
                    [button setBackgroundImage:[UIImage imageNamed:@"segment_nav_white_left.png"] forState:UIControlStateHighlighted];
                    [button setBackgroundImage:[UIImage imageNamed:@"segment_nav_white_left.png"] forState:UIControlStateSelected];
                    break;
                default:
                    NSLog(@"Invalid segment type");
                    break;
            }
        }
        else if (button == buttonRight)
        {
            switch (segmentType)
            {
                case SEGMENT_TYPE_NAV_WHITE:
                    [button setBackgroundImage:[UIImage imageNamed:@"segment_nav_dark_right.png"] forState:UIControlStateHighlighted];
                    [button setBackgroundImage:[UIImage imageNamed:@"segment_nav_dark_right.png"] forState:UIControlStateSelected];
                    break;
                case SEGMENT_TYPE_NAV_DARK:
                    [button setBackgroundImage:[UIImage imageNamed:@"segment_nav_white_right.png"] forState:UIControlStateHighlighted];
                    [button setBackgroundImage:[UIImage imageNamed:@"segment_nav_white_right.png"] forState:UIControlStateSelected];
                    break;
                default:
                    NSLog(@"Invalid segment type");
                    break;
            }
        }
    }
    if (titleColor != nil)
    {
        [button setTitleColor:titleColor forState:UIControlStateNormal];
        [button setTitleColor:titleColor forState:UIControlStateHighlighted];
        [button setTitleColor:titleColor forState:UIControlStateSelected];
    }
    
    if (titleShadowColor != nil)
    {
        [button setTitleShadowColor:titleShadowColor forState:UIControlStateNormal];
        [button setTitleShadowColor:titleShadowColor forState:UIControlStateHighlighted];
        [button setTitleShadowColor:titleShadowColor forState:UIControlStateSelected];
    }
}

- (MIMultiSelectSegment)getSegmentIndexFromButton:(UIButton *)button
{
    if (button == buttonLeft)
    {
        return SEGMENT_LEFT;
    }
    else if (button == buttonRight)
    {
        return SEGMENT_RIGHT;
    }
    return SEGMENT_NONE;
}

- (UIButton *)getButtonFromSegmentIndex:(MIMultiSelectSegment)index
{
    switch (index)
    {
        case SEGMENT_LEFT:
            return buttonLeft;
        case SEGMENT_RIGHT:
            return buttonRight;
        case SEGMENT_NONE:
        default:
            return nil;
            
    }
}

- (IBAction)touchDown:(id)sender
{
    if ([[sender class] isSubclassOfClass:[UIButton class]])
    {
        UIButton *button = sender;
        if (stateEnabled)
        {
            NSLog(@"Revert state");
            [button setSelected:!button.selected];
        }
        if ([delegate respondsToSelector:@selector(multiselectSegmentControl:touchDownWithSegmentAtIndex:pressedWithEnabledState:)])
        {
            [delegate multiselectSegmentControl:button touchDownWithSegmentAtIndex:[self getSegmentIndexFromButton:button] pressedWithEnabledState:button.enabled];
        }
    }
}

- (IBAction)touchUpInside:(id)sender
{
    if ([[sender class] isSubclassOfClass:[UIButton class]])
    {
        UIButton *button = sender;
        if ([delegate respondsToSelector:@selector(multiselectSegmentControl:touchUpInsideWithSegmentAtIndex:pressedWithEnabledState:)])
        {
            [delegate multiselectSegmentControl:button touchUpInsideWithSegmentAtIndex:[self getSegmentIndexFromButton:button] pressedWithEnabledState:button.enabled];
        }
    }
}

- (void)setTitle:(NSString *)title forSegmentAtIndex:(NSUInteger)segment
{
    if (segment == SEGMENT_LEFT)
    {
        [buttonLeft setTitle:title forState:UIControlStateNormal];
    }
    else if (segment == SEGMENT_RIGHT)
    {
        [buttonRight setTitle:title forState:UIControlStateNormal];
    }
}

- (void)setSelected:(BOOL)selected forSegmentAtIndex:(NSUInteger)segment
{
    if (segment == SEGMENT_LEFT)
    {
        [buttonLeft setSelected:selected];
    }
    else if (segment == SEGMENT_RIGHT)
    {
        [buttonRight setSelected:selected];
    }
}

- (void)setStateEnabled:(BOOL)isStateEnabled
{
    if (stateEnabled != isStateEnabled)
    {
        NSLog(@"set state enabled: %d", isStateEnabled);
        stateEnabled = isStateEnabled;
        [self initializeButtonBackgroundUI:buttonLeft withStateEnabled:isStateEnabled andType:SEGMENT_TYPE_NAV_DARK];
        [self initializeButtonBackgroundUI:buttonRight withStateEnabled:isStateEnabled andType:SEGMENT_TYPE_NAV_DARK];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
