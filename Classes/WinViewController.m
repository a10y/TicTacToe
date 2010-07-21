//
//  Win.m
//  TicTacToe
//
//  Created by Caryn Gerber-Duffy on 7/18/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "WinViewController.h"


@implementation WinViewController


/* // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
	}
    return self;
}
*/


// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
	CGRect back = CGRectMake(5.0, 50.0, 310.0, 150.0);
//	CGRect labelFrame = 
	UIView *popup = [[UIView alloc] initWithFrame:back];
	
	
	UILabel *winLabel = [[UILabel alloc] initWithFrame:back];
	[winLabel setText:@"X WON!"];
	[self setView:popup];
	[popup addSubview:winLabel];
}


/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

- (void)dealloc {
    [super dealloc];
}


@end
