//
//  TicTacToeAppDelegate.m
//  TicTacToe
//
//  Created by David Webb on 6/30/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "TicTacToeAppDelegate.h"


@implementation TicTacToeAppDelegate

@synthesize window;
@synthesize SettingsVC;
@synthesize viewController;
@synthesize navigationController;

#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    // Override point for customization after application launch.
	[application setStatusBarStyle:UIStatusBarStyleBlackTranslucent];
    
	SettingsVC = [[SettingsViewController alloc] init];
	
	navigationController = [[TicTacToeNavigationController alloc] initWithRootViewController:SettingsVC];
	
	/*
	NSArray *viewControllers = [[NSArray alloc] initWithObjects:SettingsVC, viewController,nil];
	[navigationController setViewControllers:viewControllers];
	*/
	
    [window addSubview:navigationController.view];
	[window makeKeyAndVisible];
	
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {

    [navigationController popViewControllerAnimated:NO];
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
	//[application setStatusBarStyle:UIStatusBarStyleDefault];
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, called instead of applicationWillTerminate: when the user quits.
     */
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of  transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
	[application setStatusBarStyle:UIStatusBarStyleBlackTranslucent];
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}


- (void)applicationWillTerminate:(UIApplication *)application {

	/*
     Called when the application is about to terminate.
     See also applicationDidEnterBackground:.
     */
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}

- (void)dealloc {
    [viewController release];
	[SettingsVC release];
	[navigationController release];
    [window release];
	viewController = nil;
	sViewController = nil;
	window = nil;
	    
	//Call super dealloc 
	[super dealloc];
}


@end
