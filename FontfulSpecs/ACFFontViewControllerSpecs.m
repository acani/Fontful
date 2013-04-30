#import <SenTestingKit/SenTestingKit.h>
#import "ACFFontViewController.h"

@interface ACFFontViewControllerSpecs : SenTestCase @end

@implementation ACFFontViewControllerSpecs

- (void)specLaunch
{
    ACFFontViewController *fontViewController = (ACFFontViewController *)((UINavigationController *)[UIApplication sharedApplication].delegate.window.rootViewController).topViewController;

    STAssertEquals(fontViewController.navigationController.navigationBar.barStyle, UIBarStyleBlack,   @"Set navigationBar.barStyle to UIBarStyleBlack.");
    STAssertEquals(fontViewController.navigationController.navigationBar.translucent, YES,            @"Set navigationBar.translucent to YES.");

    STAssertEquals(fontViewController.tableView.rowHeight, 52.0f,                                     @"Set tableView.rowHeight to 52.");

    STAssertEquals([fontViewController.tableView numberOfSections], 1,                                @"Add 1 section.");
    STAssertEquals([fontViewController.tableView numberOfRowsInSection:0], 2,                         @"Add 2 rows");

    // TODO: Spec the rows.

    NSString *sectionHeaderTitle = [fontViewController tableView:fontViewController.tableView titleForHeaderInSection:0];
    STAssertEqualObjects(sectionHeaderTitle, @"Font",                                                 @"Set header title.");

    UILabel *titleLabel = (UILabel *)fontViewController.navigationItem.titleView;
    STAssertNotNil(titleLabel,                                                                        @"Create and set titleLabel.");
    STAssertTrue([titleLabel isMemberOfClass:[UILabel class]],                                        @"Make UILabel.");
    UIViewAutoresizing autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
    STAssertEquals(titleLabel.autoresizingMask, autoresizingMask,                                     @"Set autoresizingMask.");
    // TODO: Spec the other titleLabel properties.

    // TODO: Spec updateFont.

    // TODO: Create UI Automation tests for the steppers.
}

@end
