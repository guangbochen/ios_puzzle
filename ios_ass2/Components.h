//
//  Component.h
//  ios_ass2
//
//  Created by guangbo on 16/10/13.
//  Copyright (c) 2013 guangbo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Components : NSObject
{
    NSMutableArray *components;
}

-(Components *) init;
-(void) setComponents;
-(int) getMove:(int)row andComponent:(int)component;
-(int) getNextRow:(int)move andComponent:(int)component;
-(BOOL) puzzleIsSolved;

@end
