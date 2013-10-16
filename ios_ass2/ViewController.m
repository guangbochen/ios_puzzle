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
@synthesize spinnerPicker;
- (void)viewDidLoad
{
    [super viewDidLoad];

    //set seed text field keyboard to number mode
    seedTxt.keyboardType = UIKeyboardTypeNumberPad;

    spinnerPicker.delegate = self;
    //spinnerPicker.showsSelectionIndicator = YES;
    //[self.view addSubview:spinnerPicker];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//handles start puzzle button's action
- (IBAction)StartPuzzleAction:(id)sender {

    //validate input seed number
    if([seedTxt.text isEqualToString:@""] ||
       [seedTxt.text intValue] == 0)
    {
        UIAlertView *seedMessage = [[UIAlertView alloc] initWithTitle:@"Sorry"
                message:@"Invalid seed number" delegate:nil
                cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [seedMessage show];
    }
    else
    {
        int seed = [seedTxt.text intValue];
        [seedLabel setText:[NSString stringWithFormat:@"%d",seed]];
        //start puzzle
        [seedTxt setText:@""];
    }

}
- (IBAction)dismissAction:(id)sender {
    //dismiss the keyboard when user click the background
    [seedTxt resignFirstResponder];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow: (NSInteger)row inComponent:(NSInteger)component {
    // Handle the selection
}

// tell the picker how many rows are available for a given component
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    NSUInteger numRows = 5;
    return numRows;
}

// tell the picker how many components it will have
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 5;
}

// tell the picker the value for a given component
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    NSString *title;
    title = [@"" stringByAppendingFormat:@"%d",row+1];

    return title;
}


// tell the spinner picker the width of each row for a given component
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    int sectionWidth = 58;
    return sectionWidth;
}

@end
