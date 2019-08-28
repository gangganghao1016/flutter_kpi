#include "AppDelegate.h"
#include "GeneratedPluginRegistrant.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  [GeneratedPluginRegistrant registerWithRegistry:self];
  // Override point for customization after application launch.
    // 创建命名方法通道
    FlutterMethodChannel* channel = [FlutterMethodChannel methodChannelWithName:@"fang/untils" binaryMessenger:(FlutterViewController *)self.window.rootViewController];
    // 往方法通道注册方法调用处理回调
    [channel setMethodCallHandler:^(FlutterMethodCall* call, FlutterResult result) {
        // 方法名称一致
        if ([@"openAppMarket" isEqualToString:call.method]) {
            // 打开 App Store(本例打开微信的 URL)
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"itms-apps://itunes.apple.com/xy/app/foo/id414478124"]];
            // 返回方法处理结果
            result(@1);
        } else {
            // 找不到被调用的方法
            result(FlutterMethodNotImplemented);
        }
    }];
  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}


@end
