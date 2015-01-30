//
//  ViewController.h
//  BullsEye
//
//  Created by Mikaila Akeredolu on 12/29/13.
//  Copyright (c) 2013 Mikaila Akeredolu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIAlertViewDelegate>

//create an oulet property for the slider

@property (strong, nonatomic) IBOutlet UISlider *sliderOutlet;
//used above@property so you could reference the slider anywhere from within the view
//controller, and that you could ask the slider for its value through
//self.slideroutlet.value


//create  a property outlet for target label
@property (strong, nonatomic) IBOutlet UILabel *targetLabel;

@property (strong, nonatomic) IBOutlet UILabel *scoreLabel;

@property (strong, nonatomic) IBOutlet UILabel *roundLabel;

- (IBAction)showAlert:(id)sender;

//need action with functionality for slider when moved by user
- (IBAction)sliderMoved:(UISlider *)slider;

- (IBAction)startOver:(id)sender;

@end



//we use self.dot when refering to the view controllers property such as the sliderOutlet hence self.sliderOutlet

//we use [self startOver] calling one of the view contrllers methods