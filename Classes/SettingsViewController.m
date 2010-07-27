    //
//  SettingsViewController.m
//  TicTacToe
//
//  Created by Caryn Gerber-Duffy on 7/22/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//
#import "SettingsViewController.h"
#import <QuartzCore/QuartzCore.h>


@implementation SettingsViewController




- (void)loadView {
	
	CGRect backFrame = CGRectMake(0.0, 0.0, 320.0, 408.0);
	UIView *back = [[UIView alloc] initWithFrame:backFrame];
	/*
	colorPickerAttribs.frame = CGRectMake(0.0, 0.0, 320.0, 480.0);
	UIView *colorPicker = [[UIScrollView alloc] initWithFrame:colorPickerAttribs.frame];
	[self setView:colorPicker];
	*/
	[self setView:back];
	CGRect startButtonFrame = CGRectMake(50.0, 100.0, 100.0, 30.0);
	
	UIButton *startButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	[startButton setFrame:startButtonFrame];
	[startButton setBackgroundColor:[UIColor greenColor]];

	[startButton setTitle:@"Start Game" forState:UIControlStateNormal];

	[startButton addTarget:self action:@selector(startGame) forControlEvents:UIControlEventTouchUpInside];
	
	[back addSubview:startButton];
}

-(void)startGame {
	tttvc = [[TicTacToeViewController alloc] init];
	[self setView:tttvc.view];
}
													 
												 
/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

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
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
