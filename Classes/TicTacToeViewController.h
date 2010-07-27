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


typedef enum _turn {
	X_TURN= 1,
	O_TURN
} turn;



@interface TicTacToeViewController : UIViewController {

	Grid *grid;
	int lastMove; //variable used to change turn. -1 = x, 1 = o;
	Grid_BG g_bd;
	BOOL firstTime;
	turn nextTurn;
}


	

-(BOOL)xWon;
-(BOOL)oWon;
-(BOOL)gameOver;
-(void)resetGame;

@end

