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


@interface TicTacToeViewController : UIViewController {
	Grid *grid;
	int lastMove; //variable used to change turn. 0 = x, 1 = o;
}



@end

