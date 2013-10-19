//
//  ViewController.h
//  ios_ass2
//
//  Created by guangbo on 15/10/13.
//  Copyright (c) 2013 guangbo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Components.h"

@interface ViewController : UIViewController<UIPickerViewDelegate, UIPickerViewDataSource>

@property (weak, nonatomic) IBOutlet UIButton *startButton;
@property (weak, nonatomic) IBOutlet UITextField *seedTxt;

//start puzzle button
- (IBAction)StartPuzzleAction:(id)sender;

//spinner picker 
@property (weak, nonatomic) IBOutlet UIPickerView *spinnerPicker;

//data source for spinner picker
@property (strong, nonatomic) NSArray* values;
@property (strong, nonatomic) Components* components;

@end
