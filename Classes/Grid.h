//
//  Grid.h
//  TicTacToe
//
//  Created by Caryn Gerber-Duffy on 7/7/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TouchCells.h"


@interface Grid : UIView {
	
			
}

@property (readwrite, assign)	UIView		*tapView;

@property (readwrite, assign)	TouchCells		*b00;
@property (readwrite, assign)	TouchCells		*b01;
@property (readwrite, assign)	TouchCells		*b02;
@property (readwrite, assign)	TouchCells		*b10;
@property (readwrite, assign)	TouchCells		*b11;
@property (readwrite, assign)	TouchCells		*b12;
@property (readwrite, assign)	TouchCells		*b20;
@property (readwrite, assign)	TouchCells		*b21;
@property (readwrite, assign)	TouchCells		*b22;

//-(void)resetBoard;

@end