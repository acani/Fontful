#import <SenTestingKit/SenTestingKit.h>
#import "ACFAppDelegate.h"
#import "ACFFontViewController.h"

@interface ACFAppDelegateSpecs : SenTestCase @end

@implementation ACFAppDelegateSpecs

- (void)specLaunch
{
    ACFAppDelegate *appDelegate = (ACFAppDelegate *)[UIApplication sharedApplication].delegate;
    STAssertNotNil(appDelegate,                                                                       @"Create appDelegate.");
    STAssertTrue([appDelegate isMemberOfClass:[ACFAppDelegate class]],                                @"Make ACFAppDelegate.");

    UIWindow *window = appDelegate.window;
    STAssertNotNil(window,                                                                            @"Create window.");
    STAssertEquals(window.frame, [[UIScreen mainScreen] bounds],                                      @"Set frame to main-screen bounds.");
    STAssertEquals(window, [UIApplication sharedApplication].keyWindow,                               @"Make key.");
    STAssertFalse (window.hidden,                                                                     @"Make visible.");

    UIViewController *rootViewController = window.rootViewController;
    STAssertNotNil(rootViewController,                                                                @"Create rootViewController.");
    STAssertTrue([rootViewController isMemberOfClass:[UINavigationController class]],                 @"Make UINavigationController.");

    ACFFontViewController *topViewController = (ACFFontViewController *)((UINavigationController *)rootViewController).topViewController;
    STAssertNotNil(topViewController,                                                                 @"Create topViewController.");
    STAssertTrue([topViewController isMemberOfClass:[ACFFontViewController class]],                   @"Make ACFFontViewController.");
}

@end
