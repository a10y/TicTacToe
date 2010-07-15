//
//  TicTacToeAppDelegate.h
//  TicTacToe
//
//  Created by Caryn Gerber-Duffy on 6/30/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TicTacToeViewController.h"



@class TicTacToeViewController;

@interface TicTacToeAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    TicTacToeViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet TicTacToeViewController *viewController;

@end

