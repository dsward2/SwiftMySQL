//
//  AppDelegate.m
//  SwiftMySQL
//
//  Created by Douglas Ward on 11/19/15.
//  Copyright © 2015 ArkPhone LLC. All rights reserved.
//

#import "AppDelegate.h"
#import "SwiftMySQL-Swift.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    
    // Here is the test code, set a breakpoint here to trace it -
    
    SwiftMySQLTest * swiftMySQLTest = [[SwiftMySQLTest alloc] init];
    
    [swiftMySQLTest mysqlTest];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

@end
