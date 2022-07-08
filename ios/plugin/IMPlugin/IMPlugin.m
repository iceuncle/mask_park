//
//  NSObject+IMPlugin.m
//  Runner
//
//  Created by tianyang on 2020/5/14.
//  Copyright © 2020 The Chromium Authors. All rights reserved.
//

#import "IMPlugin.h"

@interface IMPlugin ()
@property (strong, nonatomic) FlutterResult result;
@end
@implementation IMPlugin
+ (void)registerWithRegistrar:(NSObject <FlutterPluginRegistrar> *)registrar {
    FlutterMethodChannel *channel = [FlutterMethodChannel methodChannelWithName:@"im_plugin" binaryMessenger:[registrar messenger] ];
    IMPlugin* instance =[IMPlugin new];
    [registrar addMethodCallDelegate:instance channel:channel];
}
- (void)handleMethodCall:(FlutterMethodCall *)call result:(FlutterResult)result {
    if ([@"sendMessage" isEqualToString:call.method]) {
        NSLog(@"aaa sendMessage");
        self.result = result;
        NSDictionary *dictionry = call.arguments;
        NSLog(@"dictionry %@", dictionry[@"a"]);
        result([NSString stringWithFormat:@"MethodChannelPlugin收到：%@",call.arguments]);//返回结果给Dart);
    }else if ([@"hello" isEqualToString:call.method]) {
        NSLog(@"hello");
    }else{
        result(FlutterMethodNotImplemented);
    }
}
@end
