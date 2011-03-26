    //
//  Demo.m
//  TicTacToe
//
//  Created by David Webb on 9/28/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Demo.h"


@implementation Demo


// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}



// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
	CGRect back = CGRectMake(0, 0, 320, 480);
	UIView *backgroundView = [[UIView alloc] initWithFrame:back];
	
	[self setView:backgroundView];
	
	CGRect buttonBack = CGRectMake(60, 160, 80, 40);
	press = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	[press setFrame:buttonBack];

	[press setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
	[press setTitle:@"Press Me!" forState:UIControlStateNormal];
	[press setBackgroundColor:[UIColor clearColor]];

	[press addTarget:self action:@selector(touch) forControlEvents:UIControlEventTouchUpInside];
	
	labelNum = 0;
	
	//
//	
	CGRect clearFrame = CGRectMake(150, 160, 80, 40);
	clear = [[UIView alloc] initWithFrame:clearFrame];
	[clear setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
	[clear setTitle:@"Clear" forState:UIControlStateNormal];
//		
	[clear setBackgroundColor:[UIColor clearColor]];
//	
//	[clear addTarget:self action:@selector(clearScreen) forControlEvents:UIControlEventTouchUpInside];
//	
	[self.view addSubview:press];
	[self.view addSubview:clear];

}


-(void)touch{

	
		NSLog(@"Button Pressed!\n");
	CGRect labelBack = CGRectMake((2*labelNum)+107, (2*labelNum)+230, 107, 50);
		
	UILabel *hello = [[UILabel alloc] initWithFrame:labelBack];
	hello.textColor = [UIColor greenColor];
	hello.text = @"Hello Touch!";
	[hello setBackgroundColor:[UIColor clearColor]];
	[self.view addSubview:hello];
	[hello release];
	
	labelNum += 1;
	
}

-(void)clearScreen{
	labelNum = 0;

	CGRect back = CGRectMake(0, 0, 320, 480);
	UIView *temp = [[UIView alloc] initWithFrame:back];

	[self setView:temp];
	[self.view release];
	
}
- (void)dealloc {
	[press release];
	[clear release];
	
    [super dealloc];
}


@end
