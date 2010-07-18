//
//  BoardCells.h
//  TicTacToe
//
//  Created by Caryn Gerber-Duffy on 7/13/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//
/****************************
 Views in the board that detect tocuh
 ****************************/


#import <UIKit/UIKit.h>


@interface TouchCells : UIView {
	
}

@property (getter=isFilled, setter=fill)		BOOL				filled;

@property										Class				contains;

@property										int					xOrY;		//Either 0 (x) or 1 (y); 

-(id)initWithCell:(CGRect)cell;
- (id)initGrid:(UIView *)grid WithFrames:(NSArray *)frames;


@end