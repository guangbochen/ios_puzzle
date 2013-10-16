//
//  Component.m
//  ios_ass2
//
//  Created by guangbo on 16/10/13.
//  Copyright (c) 2013 guangbo. All rights reserved.
//

#import "Component.h"

@implementation Component

-(Component *) init:(int)value
{
    self = [super init];
    component = &value;
    return self;
}

@end
