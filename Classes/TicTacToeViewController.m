//
//  TicTacToeViewController.m
//  TicTacToe
//
//  Created by Caryn Gerber-Duffy on 6/30/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "TicTacToeViewController.h"
#import "Constants.h"
#import <QuartzCore/QuartzCore.h>


@implementation TicTacToeViewController


- (void)loadView {
	
		
	UIAlertView *alert = [[UIAlertView alloc] 
						  initWithTitle:@"Welcome" message:@"Welcome to TicTacToe, let's get started!" 
						  delegate:nil cancelButtonTitle:@"Start Game" otherButtonTitles:nil];
	[alert show];
	
	NSLog(@"Loading View...");
	firstTime = YES;
		
	g_bd.back = CGRectMake(0.0, 0.0, 320.0, 480.0);
	g_bd.color = [UIColor darkGrayColor];
	
	grid = [[Grid alloc] initWithFrame:g_bd.back];				//Init the TTT Grid
	[grid setBackgroundColor:g_bd.color];		
	[self setView:grid];									//Making grid superview in the app
	
	grid.moveCount = 0;
	
	nextTurn = X_TURN;
	
}

-(void)resetGame {
	firstTime = YES;
	nextTurn = X_TURN;
	[grid release];
	
	grid = [[Grid alloc] initWithFrame:g_bd.back];
	[grid setBackgroundColor:g_bd.color];

	[self setView:grid];
	grid.moveCount = 0;
}


/****************************************************************
 ----------------------------------------------------------------
 In this section, Touch Events and Win Checking will be delt with
 ----------------------------------------------------------------
 ****************************************************************/
 

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	
	NSLog(@"Touch!");
			
	UITouch *tap = [touches anyObject];									//Grab any tap, set it as the view that was tapped (makes sense)
	grid.tapView = tap.view;
			
		
	if ([grid.tapView isKindOfClass:[TouchCells class]]) {				//Only execute following commands if the view that was tapped is a cell
		
			
		CGRect tapFrame = CGRectMake(grid.tapView.frame.origin.x,
							  grid.tapView.frame.origin.y,
							  100, 120);
		 

		if (nextTurn == X_TURN) {
		
			XView *x = [[XView alloc] initWithFrame:tapFrame];
			NSLog(@"X alloced\n");
			[grid addSubview:x];
            if([grid.tapView isKindOfClass:[TouchCells class]]) {								// This should always be true.
                [((TouchCells *)grid.tapView) fill:YES];										// Make sure the view you tapped is cast to TouchCells to avoid warnings with -[TouchCells fill:(BOOL)]
				[((TouchCells *)grid.tapView) setFiller:X];
				NSLog(@"filler: [%d]", [((TouchCells *)grid.tapView) filler]);
				 
				[x release]; 
				NSLog(@"X Released\n");		
			
			nextTurn = O_TURN;																		// Next move will be O
			grid.moveCount++;
			
			}
		}
		else {

			OView *o = [[OView alloc] initWithFrame:tapFrame];
			NSLog(@"O alloced\n");
			[grid addSubview:o];
            
			if([grid.tapView isKindOfClass:[TouchCells class]])	{				// This should always be true.
            
				[((TouchCells *)grid.tapView) fill:YES];
				
				[((TouchCells *)grid.tapView) setFiller:O];
				
				NSLog(@"filler: [%d]", [((TouchCells *)grid.tapView) filler]);
			
					[o release];
					NSLog(@"O Released\n");
			
				nextTurn = X_TURN;																			// Next move will be X
				grid.moveCount++;

			}
		}
	}
}


-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	
	if ([self gameOver] && firstTime){								//Check if anybody won, and execute only if someone won
		
		firstTime = NO;
		
		[grid.b00 setUserInteractionEnabled:NO];
		[grid.b01 setUserInteractionEnabled:NO];
		[grid.b02 setUserInteractionEnabled:NO];
		[grid.b10 setUserInteractionEnabled:NO];
		[grid.b11 setUserInteractionEnabled:NO];
		[grid.b12 setUserInteractionEnabled:NO];
		[grid.b20 setUserInteractionEnabled:NO];
		[grid.b21 setUserInteractionEnabled:NO];
		[grid.b22 setUserInteractionEnabled:NO];
		
		
				
		CGRect popupFrame	= CGRectMake(15.0, 
										 153.0,
										 290.0, 
										 153.0);
		
		CGRect buttonFrame	= CGRectMake(65.0, 
										 113.0,
										 160.0, 
										 30.0);
		
		CGRect labelFrame	= CGRectMake(80.0,
										 60.0, 
										 160.0,
										 50.0);
		
		
		UIView *popup = [[UIView alloc] initWithFrame:popupFrame]; 
		[[popup layer] setCornerRadius:20.0];
		[popup setBackgroundColor:[UIColor purpleColor]];
		
		[popup setAlpha:0.8];
		
		UIButton *playAgain = [[UIButton alloc] initWithFrame:buttonFrame];
		playAgain.layer.cornerRadius = 4.0;
		[playAgain setTitle:@"Play Again" forState:UIControlStateNormal];
		[playAgain setBackgroundColor:[UIColor greenColor]];
		
		
		[playAgain addTarget:self action:@selector(resetGame) forControlEvents:UIControlEventTouchUpInside];
		
		UILabel *winLabel = [[UILabel alloc] initWithFrame:labelFrame];
		[winLabel setBackgroundColor:[UIColor clearColor]];
		[winLabel setFont:[UIFont systemFontOfSize:36.0]];
		[winLabel setTextColor:[UIColor whiteColor]];

		CGPoint point = CGPointMake(playAgain.center.x, playAgain.center.y - 40.0);
		
		
		[popup addSubview:winLabel];
		[popup addSubview:playAgain];
		
		[grid addSubview:popup];
				
		
		if ([self xWon]) {
			[winLabel setText:@"X Wins!"];
			[winLabel sizeToFit];
			[winLabel setCenter:point];
		}
		else if ([self oWon]) {
			[winLabel setText:@"O Wins!"];
			[winLabel sizeToFit];
			[winLabel setCenter:point];
		}
	
		else {
			[winLabel setText:@"Draw!"];
			[winLabel sizeToFit];
			[winLabel setCenter:point];
		}
		
		[winLabel release];
		[playAgain release];
		[popup release];
	}
}


-(BOOL)gameOver {
	if ([self xWon] || [self oWon] || grid.moveCount == 9) return YES;
	else return NO;
}



-(BOOL)xWon {	//Checks for X																	//If...
	if (
		(([grid.b00 filler] == X) && ([grid.b01 filler] == X) && ([grid.b02 filler] == X)) ||		//Across Top
		
		(([grid.b10 filler] == X) && ([grid.b11 filler] == X) && ([grid.b12 filler] == X)) ||		//Across Middle
		
		(([grid.b20 filler] == X) && ([grid.b21 filler] == X) && ([grid.b22 filler] == X)) ||		//Across Bottom
		
		(([grid.b00 filler] == X) && ([grid.b10 filler] == X) && ([grid.b20 filler] == X)) ||		//Down Left
		
		(([grid.b01 filler] == X) && ([grid.b11 filler] == X) && ([grid.b21 filler] == X)) ||		//Down Middle
		
		(([grid.b02 filler] == X) && ([grid.b12 filler] == X) && ([grid.b22 filler] == X)) ||		//Down Right
		
		(([grid.b00 filler] == X) && ([grid.b11 filler] == X) && ([grid.b22 filler] == X)) ||		//Diagonal Left to Right
		
		(([grid.b02 filler] == X) && ([grid.b11 filler] == X) && ([grid.b20 filler] == X))			//Diagonal Right to Left

		) {
		return YES;																				//Then X Won
	}
	else return NO;																				//Else it didn't win (yet) 
}




-(BOOL)oWon {	//Checks for O																//If...
	if (
		(([grid.b00 filler] == O) && ([grid.b01 filler] == O) && ([grid.b02 filler] == O)) ||		//Across Top
		
		(([grid.b10 filler] == O) && ([grid.b11 filler] == O) && ([grid.b12 filler] == O)) ||		//Across Middle
		
		(([grid.b20 filler] == O) && ([grid.b21 filler] == O) && ([grid.b22 filler] == O)) ||		//Across Bottom
		
		(([grid.b00 filler] == O) && ([grid.b10 filler] == O) && ([grid.b20 filler] == O)) ||		//Down Left

		(([grid.b01 filler] == O) && ([grid.b11 filler] == O) && ([grid.b21 filler] == O)) ||		//Down Middle
		
		(([grid.b02 filler] == O) && ([grid.b12 filler] == O) && ([grid.b22 filler] == O)) ||		//Down Right
		
		(([grid.b00 filler] == O) && ([grid.b11 filler] == O) && ([grid.b22 filler] == O)) ||		//Diagonal Left to Right
		
		(([grid.b02 filler] == O) && ([grid.b11 filler] == O) && ([grid.b20 filler] == O))		//Diagonal Right to Left

		) {
		return YES;																			//Then O Won
	}
	else return NO;																			//Else it didn't win (yet)
}

-(void)dealloc {
	
	[grid.b00 release];
	[grid.b10 release];
	[grid.b20 release];
	[grid.b00 release];
	[grid.b01 release];
	[grid.b02 release];
	[grid.b00 release];
	[grid.b02 release];
	
	[super dealloc];
}	


@end
