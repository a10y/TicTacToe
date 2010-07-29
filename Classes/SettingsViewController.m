    //
//  SettingsViewController.m
//  TicTacToe
//
//  Created by Caryn Gerber-Duffy on 7/22/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//
#import "SettingsViewController.h"
#import "TicTacToeAppDelegate.h"
#import <QuartzCore/QuartzCore.h>


@implementation SettingsViewController

- (void)loadView {
	
	NSLog(@"Initializing view...");
	
	CGRect backFrame = CGRectMake(0.0, 20.0, 320.0, 460.0);
	
	UIView *back = [[UIView alloc] initWithFrame:backFrame];
	[back setBackgroundColor:[UIColor blueColor]];
	[self setView:back];
	
/*
	CGRect startButtonFrame = CGRectMake(50.0, 100.0, 100.0, 30.0);
	
	UIButton *startButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	[startButton setFrame:startButtonFrame];
	
	[startButton setBackgroundColor:[UIColor greenColor]];

	[startButton setTitle:@"Start Game" forState:UIControlStateNormal];

	[startButton addTarget:self action:@selector(startGame) forControlEvents:UIControlEventTouchUpInside];
	
	[back addSubview:startButton];
	[startButton autorelease];
*/
	 
}

-(void)startGame {
	NSLog(@"In -[SetingsViewController startGame]");
	
	TicTacToeAppDelegate *appDelegate = ((TicTacToeAppDelegate *)[[UIApplication sharedApplication] delegate]);
	[appDelegate.window addSubview:tttvc.view];
	[tttvc.view.window makeKeyAndVisible];
	[appDelegate release];
}

- (void)dealloc {
    [super dealloc];
}


@end
