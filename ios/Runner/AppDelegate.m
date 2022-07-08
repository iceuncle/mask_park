#import "AppDelegate.h"
#import "GeneratedPluginRegistrant.h"
#import "IMPlugin.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [GeneratedPluginRegistrant registerWithRegistry:self];
    [IMPlugin registerWithRegistrar:[self registrarForPlugin:@"im_plugin"]];
    return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

@end
