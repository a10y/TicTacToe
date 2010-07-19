//
//  Grid.m
//  TicTacToe
//
//  Created by Caryn Gerber-Duffy on 7/7/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Grid.h"
#import "Constants.h"

@implementation Grid

@synthesize tapView;

@synthesize b00;
@synthesize b01;
@synthesize b02;
@synthesize b10;
@synthesize b11;
@synthesize b12;
@synthesize b20;
@synthesize b21;
@synthesize b22;

/*
-(id)resetBoard {
	/*
	[self.b00 removeFromSuperview];
	[self.b01 removeFromSuperview];
	[self.b02 removeFromSuperview];
	[self.b10 removeFromSuperview];
	[self.b11 removeFromSuperview];
	[self.b12 removeFromSuperview];
	[self.b20 removeFromSuperview];
	[self.b21 removeFromSuperview];
	[self.b22 removeFromSuperview];
	/

	[self.b00 fill:NO];
	[self.b01 fill:NO];
	[self.b02 fill:NO];
	[self.b10 fill:NO];
	[self.b11 fill:NO];
	[self.b12 fill:NO];
	[self.b20 fill:NO];
	[self.b21 fill:NO];
	[self.b22 fill:NO];
	
	[self.b00 setXOrO:0];
	[self.b01 setXOrO:0];
	[self.b02 setXOrO:0];
	[self.b10 setXOrO:0];
	[self.b11 setXOrO:0];
	[self.b12 setXOrO:0];
	[self.b20 setXOrO:0];
	[self.b21 setXOrO:0];
	[self.b22 setXOrO:0];
	
}
*/	

- (id)initWithFrame:(CGRect)frame {
	
	NSLog(@"Creating a Grid Object...");
	
    if ((self = [super initWithFrame:frame])) {
		
		[super initWithFrame:frame];

		//[self setUserInteractionEnabled:NO];
		
		CGRect topLeft		= CGRectMake(LEFT_RECT_X - WIDTH,
										 LEFT_RECT_Y,
										 WIDTH, 
										 HEIGHT);
		
		CGRect topMiddle	= CGRectMake(LEFT_RECT_X + RECT_WIDTH,
										 LEFT_RECT_Y,
										 WIDTH,
										 HEIGHT);
		
		CGRect topRight		= CGRectMake(RIGHT_RECT_X + RECT_WIDTH,
										 RIGHT_RECT_Y,
										 WIDTH, 
										 HEIGHT);
		
		CGRect middleLeft	= CGRectMake(TOP_RECT_X, 
										 TOP_RECT_Y + RECT_WIDTH,
										 WIDTH, 
										 HEIGHT);
		
		CGRect middleMiddle	= CGRectMake(TOP_RECT_X + WIDTH + RECT_WIDTH, 
										 TOP_RECT_Y + RECT_WIDTH,
										 WIDTH, 
										 HEIGHT);
		
		CGRect middleRight	= CGRectMake(RIGHT_RECT_X + RECT_WIDTH,
										 TOP_RECT_Y + RECT_WIDTH,
										 WIDTH,
										 HEIGHT);
		
		CGRect bottomLeft	= CGRectMake(BOTTOM_RECT_X, 
										 BOTTOM_RECT_Y + RECT_WIDTH,
										 WIDTH, 
										 HEIGHT);
		
		CGRect bottomMiddle	= CGRectMake(BOTTOM_RECT_X + WIDTH + RECT_WIDTH, 
										 BOTTOM_RECT_Y + RECT_WIDTH, 
										 WIDTH, 
										 HEIGHT);
		
		CGRect bottomRight	= CGRectMake(RIGHT_RECT_X + RECT_WIDTH,
										 BOTTOM_RECT_Y + RECT_WIDTH,
										 WIDTH,
										 HEIGHT);
		/*
		tl = [[TouchCells alloc] initWithCell:topLeft];
		[self addSubview:tl];
		
		tm = [[TouchCells alloc] initWithCell:topMiddle];
		[self addSubview:tm];
		
		tr = [[TouchCells alloc] initWithCell:topRight];
		[self addSubview:tr];
		
		ml = [[TouchCells alloc] initWithCell:middleLeft];
		[self addSubview:ml];
		
		mm = [[TouchCells alloc] initWithCell:middleMiddle];
		[self addSubview:mm];
		
		mr = [[TouchCells alloc] initWithCell:middleRight];
		[self addSubview:mr];
		
		bl = [[TouchCells alloc] initWithCell:bottomLeft];
		[self addSubview:bl];
		
		bm = [[TouchCells alloc] initWithCell:bottomMiddle];
		[self addSubview:bm];
		
		br = [[TouchCells alloc] initWithCell:bottomRight];
		[self addSubview:br];
		*/
								        
		
		//Add invisible views to detect touch in cells.
		//NOTE: Cells are notated as "b"ij, in which
		//i is row & j is column starting at 0
		
		self.b00 = [[TouchCells alloc] initWithFrame:topLeft];
		[self addSubview:[self b00]];
		
		self.b01 = [[TouchCells alloc] initWithFrame:topMiddle];
		[self addSubview:[self b01]];
		
		self.b02 = [[TouchCells alloc] initWithFrame:topRight];
		[self addSubview:self.b02];	
		
		self.b10 = [[TouchCells alloc] initWithFrame:middleLeft];
		[self addSubview:[self b10]];
		
		self.b11 = [[TouchCells alloc] initWithFrame:middleMiddle];
		[self addSubview:[self b11]];
				
		self.b12 = [[TouchCells alloc] initWithFrame:middleRight];
		[self addSubview:[self b12]];
		
		self.b20 = [[TouchCells alloc] initWithFrame:bottomLeft];
		[self addSubview:[self b20]];
		
		self.b21 = [[TouchCells alloc] initWithFrame:bottomMiddle];
		[self addSubview:[self b21]];
		
		self.b22 = [[TouchCells alloc] initWithFrame:bottomRight];
		[self addSubview:[self b22]];	
		
    }
	return self;
}



- (void)drawRect:(CGRect)rect {
	
	CGRect leftLine	=	CGRectMake(LEFT_RECT_X, 
								   LEFT_RECT_Y, 
								   RECT_WIDTH, 
								   VERTICAL_LENGTH);
	
	
	CGRect rightLine =	CGRectMake(RIGHT_RECT_X, 
								   RIGHT_RECT_Y, 
								   RECT_WIDTH, 
								   VERTICAL_LENGTH);
	
	
	CGRect topLine =	CGRectMake(TOP_RECT_X, 
								   TOP_RECT_Y, 
								   HORIZONTAL_LENGTH, 
								   RECT_WIDTH);
	
	
	CGRect bottomLine = CGRectMake(BOTTOM_RECT_X,
								   BOTTOM_RECT_Y,
								   HORIZONTAL_LENGTH, 
								   RECT_WIDTH);
	
	
	
	
	
	
	//Add the grid
	UIView *line1 = [[UIView alloc] initWithFrame:leftLine];
	[line1 setBackgroundColor:[UIColor whiteColor]];
	
	UIView *line2 = [[UIView alloc] initWithFrame:rightLine];
	[line2 setBackgroundColor:[UIColor whiteColor]];
	
	UIView *line3 = [[UIView alloc] initWithFrame:topLine];
	[line3 setBackgroundColor:[UIColor whiteColor]];
	
	UIView *line4 = [[UIView alloc] initWithFrame:bottomLine];
	[line4 setBackgroundColor:[UIColor whiteColor]];
	
	
	
	
	[self addSubview:line1];
	[self addSubview:line2];
	[self addSubview:line3];
	[self addSubview:line4];
	

}


- (void)dealloc {
	
	
	
    [super dealloc];
}


@end
