#import <SenTestingKit/SenTestingKit.h>
#import "ACFAppDelegate.h"
#import "ACFFontViewController.h"

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

    UIViewController *rootViewController = window.rootViewController;
    STAssertNotNil(rootViewController,                                                                @"Create and set rootViewController.");
    STAssertTrue([rootViewController isMemberOfClass:[UINavigationController class]],                 @"Make UINavigationController.");

    ACFFontViewController *topViewController = (ACFFontViewController *)((UINavigationController *)rootViewController).topViewController;
    STAssertNotNil(topViewController,                                                                 @"Create and set topViewController.");
    STAssertTrue([topViewController isMemberOfClass:[ACFFontViewController class]],                   @"Make ACFFontViewController.");
    STAssertEquals(topViewController.tableView.style, UITableViewStyleGrouped,                        @"Set tableView.style to grouped.");
}

@end
