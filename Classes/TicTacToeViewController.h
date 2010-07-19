//
//  TicTacToeViewController.h
//  TicTacToe
//
//  Created by Caryn Gerber-Duffy on 6/30/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XView.h"
#import "OView.h"
#import "Grid.h"
#import "WinViewController.h"

typedef struct _Grid_BG {
	CGRect back ;
	UIColor *color;
} Grid_BG;

@interface TicTacToeViewController : UIViewController {

	Grid *grid;
	int lastMove; //variable used to change turn. -1 = x, 1 = o;
	int moveCount;
	
	WinViewController *wvc;
	
	Grid_BG g_bd;

}


	

-(BOOL)xWon;
-(BOOL)oWon;
-(BOOL)someoneWon;
-(void)resetGame;

@end

