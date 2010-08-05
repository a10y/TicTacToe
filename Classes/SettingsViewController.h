//
//  SettingsViewController.h
//  TicTacToe
//
//  Created by David Webb on 7/22/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TicTacToeViewController.h"
#import "Grid.h"
#import "TicTacToeNavigationController.h"

typedef struct _Scroll_Attrib {
	CGRect frame;
} Scroll_Attribs;

@interface SettingsViewController : UIViewController {
	Scroll_Attribs colorPickerAttribs;
	TicTacToeViewController *tttvc;
}
-(void)startGame;
@end
