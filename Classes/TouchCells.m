//
//  BoardCells.m
//  TicTacToe
//
//  Created by David Webb on 7/13/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "TouchCells.h"


@implementation TouchCells

@synthesize		filled;
@synthesize		filler;

/*
-(void)checkNeighborsForCell:(TouchCells *)tCell {
	for (TouchCells *neighbor in tCell.neighbors)
*/		

-(id)initWithFrame:(CGRect)frame {
	[super initWithFrame:frame];
	return self;
}

-(id)initWithCell:(CGRect)cell {
	return self;
}


-(id)initGrid:(UIView *)grid WithFrames:(NSArray *)frames {
	
	for (UIView *cell in frames) {
		[self addSubview:cell];
	}
	[frames	release];
	return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)dealloc {
	[self release];
    [super dealloc];
}


@end
