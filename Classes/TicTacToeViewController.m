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
	
	const CGRect back = CGRectMake(0.0, 0.0, 320.0, 480.0);		//Background frame
	
	grid = [[Grid alloc] initWithFrame:back];
	
	[grid setBackgroundColor:[UIColor darkGrayColor]];
	[self setView:grid];
	
	moveCount = 0;
}




// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	
	if ([self isViewLoaded]) {
    [super viewDidLoad];
	NSLog(@"Hello View!\n");
	
	}
}
		



/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}



/*In this section, touch events and win checking will be delt with
 */

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	
	NSLog(@"Touch!");
			
			/*
			UITouch *tapB00 = [[event touchesForView:grid.b00] anyObject];
			UITouch *tapB01 = [[event touchesForView:grid.b01] anyObject];
			UITouch *tapB02 = [[event touchesForView:grid.b02] anyObject];
			UITouch *tapB10 = [[event touchesForView:grid.b10] anyObject];
			UITouch *tapB11 = [[event touchesForView:grid.b11] anyObject];
			UITouch *tapB12 = [[event touchesForView:grid.b12] anyObject];
			UITouch *tapB20 = [[event touchesForView:grid.b20] anyObject];
			UITouch *tapB21 = [[event touchesForView:grid.b21] anyObject];
			UITouch *tapB22 = [[event touchesForView:grid.b22] anyObject];
			 */
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
		[grid setUserInteractionEnabled:NO];
		if ([self xWon]) {
			NSLog(@"\n\n\nX Won!!\n\n\n");
		}
		if ([self oWon]) {
			NSLog(@"\n\n\nO Won!!\n\n\n");
		}
	}
	else if (moveCount == 9) {
		[grid setUserInteractionEnabled:NO];
		NSLog(@"\n\n\nDraw! (As in Tie)\n\n\n");
	}
}


-(BOOL)someoneWon {
	if ([self xWon] || [self oWon]) return YES;
	else return NO;
}
	
-(BOOL)xWon {
	if (
		(([grid.b00 xOrO] == -1) && ([grid.b01 xOrO] == -1) && ([grid.b02 xOrO] == -1)) ||		//Across Top
		
		(([grid.b10 xOrO] == -1) && ([grid.b11 xOrO] == -1) && ([grid.b12 xOrO] == -1)) ||		//Across Middle
		
		(([grid.b20 xOrO] == -1) && ([grid.b21 xOrO] == -1) && ([grid.b22 xOrO] == -1)) ||		//Across Bottom
		
		(([grid.b00 xOrO] == -1) && ([grid.b10 xOrO] == -1) && ([grid.b20 xOrO] == -1)) ||		//Down Left
		
		(([grid.b01 xOrO] == -1) && ([grid.b11 xOrO] == -1) && ([grid.b21 xOrO] == -1)) ||		//Down Middle
		
		(([grid.b02 xOrO] == -1) && ([grid.b12 xOrO] == -1) && ([grid.b22 xOrO] == -1)) ||		//Down Right
		
		(([grid.b00 xOrO] == -1) && ([grid.b11 xOrO] == -1) && ([grid.b22 xOrO] == -1)) ||		//Diagonal Left to Right
		
		(([grid.b02 xOrO] == -1) && ([grid.b11 xOrO] == -1) && ([grid.b20 xOrO] == -1))		//Diagonal Right to Left

		) {
		return YES;
	}
	else return NO;
}

-(BOOL)oWon {
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
		return YES;
	}
	else return NO;
}





@end
