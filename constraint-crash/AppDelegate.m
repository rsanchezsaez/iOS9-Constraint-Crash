//
//  AppDelegate.m
//  constraint-crash
//
//  Created by Ricardo Sánchez-Sáez on 07/08/2015.
//  Copyright © 2015 Ricardo Sánchez-Sáez. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    self.window.rootViewController = [ViewController new];
    
    return YES;
}

@end
