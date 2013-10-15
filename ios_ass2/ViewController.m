//
//  ViewController.m
//  ios_ass2
//
//  Created by guangbo on 15/10/13.
//  Copyright (c) 2013 guangbo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize seedLabel;
@synthesize seedTxt;
@synthesize startButton;

- (void)viewDidLoad
{
    [super viewDidLoad];

    //set default keyboard to numberPad
    seedTxt.keyboardType = UIKeyboardTypeNumberPad;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)StartPuzzleAction:(id)sender {
    seedLabel.text = seedTxt.text;
//    if([seedTxt.text ]

}
- (IBAction)dismissAction:(id)sender {
    //dismiss the keyboard when user click the background
    [seedTxt resignFirstResponder];
}

@end
