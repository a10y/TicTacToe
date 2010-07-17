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



/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/



- (void)loadView {
	printf("Hello!");
	//Background
	
	const CGRect back = CGRectMake(0.0, 0.0, 320.0, 480.0);
	
	grid = [[Grid alloc] initWithFrame:back];
	
	/*
	CGRect rect = CGRectMake(20, 95, 70, 70);
	XView *x = [[XView alloc] initWithFrame:rect];
	
	CGRect orect = CGRectMake(125, 215, 70, 70);
	OView *o = [[OView alloc] initWithFrame:orect];
	
	CGRect o2 = CGRectMake(225, 330, 70, 70);
	XView *x2 = [[XView alloc] initWithFrame:o2];
	*/
	
	[grid setBackgroundColor:[UIColor darkGrayColor]];
	[self setView:grid];
	/*
	[grid addSubview:x];
	[grid addSubview:o];
	[grid addSubview:x2];
	*/
	

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

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}



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
		 
		 
			
	//if (![grid.tapView isFilled]) {
			
		if (lastMove == 0) {
			NSLog(@"[%@ %s] tap view: %@", NSStringFromClass([self class]), _cmd, tap.view);
			
			XView *x = [[XView alloc] initWithFrame:tapFrame];
			[grid addSubview:x];
            if([grid.tapView isKindOfClass:[TouchCells class]])	// This should always be true.
                [((TouchCells *)grid.tapView) fill:YES];
			[x release];
			
			lastMove = 1;
		}
		else {
			NSLog(@"[%@ %s] tap view: %@", NSStringFromClass([self class]), _cmd, tap.view);
			
			OView *o = [[OView alloc] initWithFrame:tapFrame];
			[grid addSubview:o];
            if([grid.tapView isKindOfClass:[TouchCells class]])	// This should always be true.
                [((TouchCells *)grid.tapView) fill:YES];
			[o release];
			
			lastMove = 0;
		}
	  //}
	}
}

/*
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	if ([) {
		
	}
*/		
			









- (void)dealloc {
    [super dealloc];
}



@end
