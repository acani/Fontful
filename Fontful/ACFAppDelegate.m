#import "ACFAppDelegate.h"
#import "ACFFontViewController.h"

@implementation ACFAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [[UINavigationBar appearance] setTintColor:[UIColor colorWithRed:217/255.0 green:153/255.0 blue:166/255.0 alpha:1]];

    _window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    _window.rootViewController = [[UINavigationController alloc] initWithRootViewController:[[ACFFontViewController alloc] initWithStyle:UITableViewStyleGrouped]];;
    [_window makeKeyAndVisible];

    return YES;
}

@end
