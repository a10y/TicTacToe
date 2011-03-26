//
//  TicTacToeAppDelegate.h
//  TicTacToe
//
//  Created by David Webb on 6/30/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TicTacToeViewController.h"
#import "SettingsViewController.h"
#import "TicTacToeNavigationController.h"
#import "Demo.h"


@class TicTacToeViewController;

@interface TicTacToeAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
//    SettingsViewController  *sViewController;
	TicTacToeViewController *viewController;
	TicTacToeNavigationController *navigationController;
}

@property (nonatomic, retain) IBOutlet UIWindow								*window;
@property (nonatomic, retain) IBOutlet SettingsViewController				*SettingsVC;
@property (nonatomic, retain) IBOutlet TicTacToeViewController				*viewController;
@property (nonatomic, retain) IBOutlet TicTacToeNavigationController		*navigationController;


@end

