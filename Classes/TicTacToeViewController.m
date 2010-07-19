//
//  TicTacToeViewController.m
//  TicTacToe
//
//  Created by Caryn Gerber-Duffy on 6/30/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "TicTacToeViewController.h"
#import "Constants.h"

@implementation TicTacToeViewController


- (void)loadView {
	NSLog(@"Loading View...");
	
	g_bd.back = CGRectMake(0.0, 0.0, 320.0, 480.0);
	g_bd.color = [UIColor darkGrayColor];
	
	grid = [[Grid alloc] initWithFrame:g_bd.back];				//Init the TTT Grid
	[grid setBackgroundColor:[UIColor darkGrayColor]];		
	[self setView:grid];									//Making grid superview in the app
	
	moveCount = 0;
}

-(void)resetGame {
	[grid release];
	grid = nil;
	Grid * newGrid = [[Grid alloc] initWithFrame:g_bd.back];
	[newGrid setBackgroundColor:[UIColor darkGrayColor]];

	[self setView:newGrid];
}


/****************************************************************
 ----------------------------------------------------------------
 In this section, Touch Events and Win Checking will be delt with
 ----------------------------------------------------------------
 ****************************************************************/
 

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	
	NSLog(@"Touch!");
			
	UITouch *tap = [touches anyObject];
	grid.tapView = tap.view;
			
		
	if ([grid.tapView isKindOfClass:[TouchCells class]]) {
		
			
		CGRect tapFrame = CGRectMake(grid.tapView.frame.origin.x,
							  grid.tapView.frame.origin.y,
							  100, 120);
		 

		if (lastMove == -1) {
			NSLog(@"[%@ %s] tap view: %@", NSStringFromClass([self class]), _cmd, tap.view);
			
			XView *x = [[XView alloc] initWithFrame:tapFrame];
			[grid addSubview:x];
            if([grid.tapView isKindOfClass:[TouchCells class]]) {								// This should always be true.
                [((TouchCells *)grid.tapView) fill:YES];
				[((TouchCells *)grid.tapView) setXOrO:-1];
				NSLog(@"xOrO: [%d]", [((TouchCells *)grid.tapView) xOrO]);
				 
			[x release];
			
			lastMove = 1;
			moveCount++;
			
			}
		}
		else {
			NSLog(@"[%@ %s] tap view: %@", NSStringFromClass([self class]), _cmd, [tap.view description]);
			
			OView *o = [[OView alloc] initWithFrame:tapFrame];
			[grid addSubview:o];
            if([grid.tapView isKindOfClass:[TouchCells class]])	{// This should always be true.
                [((TouchCells *)grid.tapView) fill:YES];
				[((TouchCells *)grid.tapView) setXOrO:1];
				NSLog(@"xOrO: [%d]", [((TouchCells *)grid.tapView) xOrO]);
			[o release];
			
			lastMove = -1;
			moveCount++;

			}
		}
	}
}


-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	
	if ([self someoneWon]){
		[self presentModalViewController:wvc animated:YES];
		[grid setUserInteractionEnabled:NO];
		if ([self xWon]) {
			NSLog(@"\n\n\nX Won!!\n\n\n");
			[self resetGame];
		}
		if ([self oWon]) {
			NSLog(@"\n\n\nO Won!!\n\n\n");
			[self resetGame];
		}
	}
	else if (moveCount == 9) {
		[grid setUserInteractionEnabled:NO];
		NSLog(@"\n\n\nDraw! (As in Tie)\n\n\n");
		[self resetGame];
	}
}


-(BOOL)someoneWon {
	if ([self xWon] || [self oWon]) return YES;
	else return NO;
}
	
-(BOOL)xWon {	//Checks for X																	//If...
	if (
		(([grid.b00 xOrO] == -1) && ([grid.b01 xOrO] == -1) && ([grid.b02 xOrO] == -1)) ||		//Across Top
		
		(([grid.b10 xOrO] == -1) && ([grid.b11 xOrO] == -1) && ([grid.b12 xOrO] == -1)) ||		//Across Middle
		
		(([grid.b20 xOrO] == -1) && ([grid.b21 xOrO] == -1) && ([grid.b22 xOrO] == -1)) ||		//Across Bottom
		
		(([grid.b00 xOrO] == -1) && ([grid.b10 xOrO] == -1) && ([grid.b20 xOrO] == -1)) ||		//Down Left
		
		(([grid.b01 xOrO] == -1) && ([grid.b11 xOrO] == -1) && ([grid.b21 xOrO] == -1)) ||		//Down Middle
		
		(([grid.b02 xOrO] == -1) && ([grid.b12 xOrO] == -1) && ([grid.b22 xOrO] == -1)) ||		//Down Right
		
		(([grid.b00 xOrO] == -1) && ([grid.b11 xOrO] == -1) && ([grid.b22 xOrO] == -1)) ||		//Diagonal Left to Right
		
		(([grid.b02 xOrO] == -1) && ([grid.b11 xOrO] == -1) && ([grid.b20 xOrO] == -1))			//Diagonal Right to Left

		) {
		return YES;																				//Then X Won
	}
	else return NO;																				//Else it didn't win (yet) 
}

-(BOOL)oWon {	//Checks for O																//If...
	if (
		(([grid.b00 xOrO] == 1) && ([grid.b01 xOrO] == 1) && ([grid.b02 xOrO] == 1)) ||		//Across Top
		
		(([grid.b10 xOrO] == 1) && ([grid.b11 xOrO] == 1) && ([grid.b12 xOrO] == 1)) ||		//Across Middle
		
		(([grid.b20 xOrO] == 1) && ([grid.b21 xOrO] == 1) && ([grid.b22 xOrO] == 1)) ||		//Across Bottom
		
		(([grid.b00 xOrO] == 1) && ([grid.b10 xOrO] == 1) && ([grid.b20 xOrO] == 1)) ||		//Down Left

		(([grid.b01 xOrO] == 1) && ([grid.b11 xOrO] == 1) && ([grid.b21 xOrO] == 1)) ||		//Down Middle
		
		(([grid.b02 xOrO] == 1) && ([grid.b12 xOrO] == 1) && ([grid.b22 xOrO] == 1)) ||		//Down Right
		
		(([grid.b00 xOrO] == 1) && ([grid.b11 xOrO] == 1) && ([grid.b22 xOrO] == 1)) ||		//Diagonal Left to Right
		
		(([grid.b02 xOrO] == 1) && ([grid.b11 xOrO] == 1) && ([grid.b20 xOrO] == 1))		//Diagonal Right to Left

		) {
		return YES;																			//Then O Won
	}
	else return NO;																			//Else it didn't win (yet)
}





@end
