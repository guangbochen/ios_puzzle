//
//  ViewController.m
//  ios_ass2
//
//  Created by guangbo on 15/10/13.
//  Copyright (c) 2013 guangbo. All rights reserved.
//

#import "ViewController.h"
#define range 5
#define lastComponet 4
#define firstComponent 0

@interface ViewController ()

-(void)moveComponent:(int)row andComponent:(int)component;

@end

@implementation ViewController

@synthesize seedTxt;
@synthesize startButton;
@synthesize spinnerPicker;
@synthesize values;
@synthesize components;



- (void)viewDidLoad
{
    [super viewDidLoad];

    //set seed text field keyboard to number mode
    seedTxt.keyboardType = UIKeyboardTypeNumberPad;

    spinnerPicker.delegate = self;

    //init components object
    components = [[Components alloc] init];
    [components setComponents];

    //initialise picker components value
    values = [[NSArray alloc] initWithObjects:@"1",@"2",@"3",@"4",@"5",nil];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//handles start puzzle button's action
- (IBAction)StartPuzzleAction:(id)sender {

    //validate input seed number
    if([seedTxt.text isEqualToString:@""])
    {
        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Sorry"
                message:@"Invalid seed number" delegate:nil
                cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [message show];
    }
    else
    {
        int seed = [seedTxt.text intValue];
        srandom(seed);

        //re-initialise components object when new seed is entered
        components = [[Components alloc] init];
        [components setComponents];

        //start puzzle with random value for each component
        for(int i = 0; i<range; i++)
        {
            int rand_num = random() % range;
            //[spinnerPicker selectRow:rand_num inComponent:i animated:TRUE];
            [self moveComponent:rand_num andComponent:i];

        }
    }

}

- (IBAction)dismissAction:(id)sender {
    //dismiss the keyboard when user click the background
    [seedTxt resignFirstResponder];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow: (NSInteger)row
       inComponent:(NSInteger)component {

    // Handle the selection
    [self moveComponent:row andComponent:component];

    //if puzzle is solved show the message dialog
    BOOL solved = [components puzzleIsSolved];
    if (solved) {
        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Congratulations"
                message:@"You have solved spinner" delegate:nil
                cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [message show];
    }

}

// tell the picker how many rows are available for a given component
- (NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component {
    //all the componets have the same number of count as 5
    return [values count];
}

// tell the picker how many components it will have
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 5;
}

// tell the picker the value for a given component
- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [values objectAtIndex:row];
}


// tell the spinner picker the width of each row for a given component
- (CGFloat)pickerView:(UIPickerView *)pickerView
    widthForComponent:(NSInteger)component {
    int sectionWidth = 58;
    return sectionWidth;
}

//this method moves the componet according to the row and component
-(void)moveComponent:(int)row andComponent:(int)component
{
    int leftComponent;
    int rightComponent;
    if(component == firstComponent)
    {
        //if is last component
        leftComponent = 4;
        rightComponent = 1;
    }
    else if(component == lastComponet)
    {

        //if is last component
        leftComponent = 3;
        rightComponent = 0;
    }
    else
    {
        leftComponent = component-1;
        rightComponent = component+1;
    }

    //get the next row for the relative components
    int move = [components getMove:row andComponent:component];
    int leftMove = [components getNextRow:move andComponent:leftComponent];
    int rightMove = [components getNextRow:move andComponent:rightComponent];

    //update the spinner picker
    [spinnerPicker selectRow:row inComponent:component animated:TRUE];
    [spinnerPicker selectRow:leftMove inComponent:leftComponent animated:TRUE];
    [spinnerPicker selectRow:rightMove inComponent:rightComponent animated:TRUE];

}
@end
