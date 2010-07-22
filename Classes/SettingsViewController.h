//
//  SettingsViewController.h
//  TicTacToe
//
//  Created by Caryn Gerber-Duffy on 7/22/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef struct _Scroll_Attrib {
	CGRect frame;
} Scroll_Attribs;

@interface SettingsViewController : UIViewController {
	Scroll_Attribs colorPickerAttribs;
}

@end
