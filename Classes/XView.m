//
//  XView.m
//  TicTacToe
//
//  Created by David Webb on 7/6/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "XView.h"



@implementation XView
@synthesize		hasWon;

- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
		
		[super initWithFrame:frame];
		[self setBackgroundColor:[UIColor darkGrayColor]];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
	CGContextRef context = UIGraphicsGetCurrentContext();
	
	CGContextBeginPath(context);
	
	/*
	CGContextMoveToPoint(context, 5, 5);
	CGContextAddLineToPoint(context, 65, 65);
	CGContextMoveToPoint(context, 5, 65);
	CGContextAddLineToPoint(context, 65, 5);
	*/
	
	CGContextMoveToPoint(context, 20, 30);
	CGContextAddLineToPoint(context, 80, 90);
	CGContextMoveToPoint(context, 20, 90);
	CGContextAddLineToPoint(context, 80, 30);
	
	
	CGContextClosePath(context);
	
	[[UIColor blackColor] set]; 
	CGContextSetLineWidth(context, 6.5);
	CGContextStrokePath(context);

	 
}


- (void)dealloc {
    [super dealloc];
}


@end
