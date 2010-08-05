/*
 *  Constants.h
 *  TicTacToe
 *
 *  Created by Andrew Gerber-Duffy on 7/8/10.
 *  Copyright 2010 __MyCompanyName__. All rights reserved.
 *
 */





/*************
 *************
 *************
 
 //Constants to cosntruct the grid
 
 Comments are for the purpose of 
 making the grid symmetrical.
 
 If you don't wan't it to be symmetrical,
 ignore all of this...
 
 *************
 *************
 *************/

#define		RECT_WIDTH						5.0
#define		HORIZONTAL_LENGTH				310.0
#define		VERTICAL_LENGTH					370.0
#define		HEIGHT							120.0
#define		WIDTH							100.0
#define		LEFT_RECT_X						105.0
#define		LEFT_RECT_Y						70.0
#define		RIGHT_RECT_X					LEFT_RECT_X + WIDTH + RECT_WIDTH
#define		RIGHT_RECT_Y					LEFT_RECT_Y
#define		TOP_RECT_X						5.0
#define		TOP_RECT_Y						190.0
#define		BOTTOM_RECT_X					TOP_RECT_X
#define		BOTTOM_RECT_Y					TOP_RECT_Y + HEIGHT + RECT_WIDTH