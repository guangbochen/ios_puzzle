//
//  ViewController.h
//  ios_ass2
//
//  Created by guangbo on 15/10/13.
//  Copyright (c) 2013 guangbo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIPickerViewDelegate, UIPickerViewDataSource>

@property (weak, nonatomic) IBOutlet UIButton *startButton;
@property (weak, nonatomic) IBOutlet UILabel *seedLabel;
@property (weak, nonatomic) IBOutlet UITextField *seedTxt;

//start puzzle button
- (IBAction)StartPuzzleAction:(id)sender;

//spinner picker 
@property (weak, nonatomic) IBOutlet UIPickerView *spinnerPicker;

@end
