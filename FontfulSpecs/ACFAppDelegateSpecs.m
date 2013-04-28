#import <SenTestingKit/SenTestingKit.h>
#import "ACFAppDelegate.h"

@interface ACFAppDelegateSpecs : SenTestCase @end

@implementation ACFAppDelegateSpecs

- (void)specLaunch
{
    ACFAppDelegate *appDelegate = (ACFAppDelegate *)[UIApplication sharedApplication].delegate;
    STAssertNotNil(appDelegate,                                                                       @"Create and set appDelegate.");
    STAssertTrue([appDelegate isMemberOfClass:[ACFAppDelegate class]],                                @"Make ACFAppDelegate.");

    UIWindow *window = appDelegate.window;
    STAssertNotNil(window,                                                                            @"Create window.");
    STAssertEquals(window.frame, [[UIScreen mainScreen] bounds],                                      @"Set frame to main-screen bounds.");
    STAssertEquals(window, [UIApplication sharedApplication].keyWindow,                               @"Make key.");
    STAssertFalse (window.hidden,                                                                     @"Make visible.");
}

@end
