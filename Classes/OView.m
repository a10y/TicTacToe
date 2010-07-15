//
//  OView.m
//  TicTacToe
//
//  Created by Caryn Gerber-Duffy on 7/6/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "OView.h"


@implementation OView
@synthesize		hasWon;

- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
	
		[super initWithFrame:frame];
		[self setBackgroundColor:[UIColor darkGrayColor]];
    
	}
	
    return self;
}


- (void)drawRect:(CGRect)rect {

	CGContextRef context = UIGraphicsGetCurrentContext();
	
	CGContextBeginPath(context);
	
	CGContextAddArc(context, 50, 60, 30, 0, 2*M_PI, 10);
	
	CGContextClosePath(context);
	
	[[UIColor	blackColor] set];
	CGContextSetLineWidth(context, 6.5);
	CGContextStrokePath(context);


}


- (void)dealloc {
    [super dealloc];
}


@end
