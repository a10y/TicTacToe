    //
//  SettingsViewController.m
//  TicTacToe
//
//  Created by David Webb on 7/22/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//
#import "SettingsViewController.h"
#import "TicTacToeAppDelegate.h"
#import <QuartzCore/QuartzCore.h>


@implementation SettingsViewController

-(void)loadView {
	[self retain];
	
	NSLog(@"Initializing view...");
	
	CGRect backFrame = CGRectMake(0.0, 20.0, 320.0, 460.0);
	
	UIView *back = [[UIView alloc] initWithFrame:backFrame];
	[back setBackgroundColor:[UIColor blueColor]];
	[self setView:back];
	

	CGRect startButtonFrame = CGRectMake(50.0, 100.0, 100.0, 30.0);
	
	UIButton *startButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	[startButton setFrame:startButtonFrame];

	
	[startButton setBackgroundColor:[UIColor clearColor]];

	[startButton setTitle:@"Start Game" forState:UIControlStateNormal];
	SEL start = @selector(startGame);
	[startButton addTarget:self action:start forControlEvents:UIControlEventTouchUpInside];
	
	[back addSubview:startButton];
}

-(void)startGame {
	NSLog(@"In -[SetingsViewController startGame]");
	
	tttvc = [[TicTacToeViewController alloc] init];
	TicTacToeAppDelegate *appDelegate = (TicTacToeAppDelegate *)[[UIApplication sharedApplication] delegate];
	
	[appDelegate.window addSubview:tttvc.view];
	[tttvc.view.window makeKeyAndVisible];
	[appDelegate release];
	[self release];
}

- (void)dealloc {
	[tttvc release];
    [super dealloc];
}


@end
