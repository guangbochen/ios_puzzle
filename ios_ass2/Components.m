//
//  Component.m
//  ios_ass2
//
//  Created by guangbo on 16/10/13.
//  Copyright (c) 2013 guangbo. All rights reserved.
//

#import "Components.h"
#define maxValue 5
#define minValue 0
#define firstRow 0
#define count 5

@implementation Components

-(Components *) init
{
    self = [super init];
    components = [[NSMutableArray alloc] initWithCapacity:5];
    return self;
}

-(void) setComponents
{
    int row = 0;
    for(int i=0; i<count; i++)
    {
        NSNumber* value = [NSNumber numberWithInt:row];
        [components addObject:value];
    }
}

//this method calculates the total moves of the component
-(int) getMove:(int)row andComponent:(int)component
{
    int move = 0;

    //get the origin row of the component
    NSNumber *value = [components objectAtIndex:component];
    int intVal = [value intValue];

    //calculate the moves for the selected component
    move = row - intVal;

    //update the origin row to the current row after calculate moves
    NSNumber* current = [NSNumber numberWithInt:row];
    [components replaceObjectAtIndex:component withObject:current];

    return move;
}

//this method tells the next row of the snipper component
-(int) getNextRow:(int)move andComponent:(int)component
{

    //get the origin row of the component
    NSNumber *value = [components objectAtIndex:component];
    int intVal = [value intValue];

    int nextRow = intVal + move;

    //if next row is greate than max row
    if (nextRow >= maxValue) nextRow -= maxValue;

    //if next row is less than min row
    if(nextRow< minValue) nextRow += maxValue;

    NSNumber* current = [NSNumber numberWithInt:nextRow];
    [components replaceObjectAtIndex:component withObject:current];
    return nextRow;
}

//this method validates puzzle is solved or not
-(BOOL) puzzleIsSolved
{
    BOOL solved = true;
    for(NSNumber* row in components)
    {
        int intVal = [row intValue];
        if (intVal != firstRow) return false;
    }

    return solved;
}

@end
