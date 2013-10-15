//
//  ViewController.h
//  ios_ass2
//
//  Created by guangbo on 15/10/13.
//  Copyright (c) 2013 guangbo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *startButton;
@property (weak, nonatomic) IBOutlet UILabel *seedLabel;
- (IBAction)StartPuzzleAction:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *seedTxt;

@end
