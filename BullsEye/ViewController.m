//
//  ViewController.m
//  BullsEye
//
//  Created by Mikaila Akeredolu on 12/29/13.
//  Copyright (c) 2013 Mikaila Akeredolu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

{
    //declare an instance variable here called current value/ always underscore ivars
    int _currentValue;
    
    // ivariable to calculate ranndom num funtc
    int _targetValue;
    
    //instance variable to hold score
    int _score;
    
    int _round;
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// calling the method startNewGame method from below it also includes startnewround inside it
    [self startNewGame];
    
    //calling the update labels method
    [self updateLabels]; //updates the label when the view loads
    
    //coding designs for the slider
    UIImage *thumbImageNormal = [UIImage
                                 imageNamed:@"SliderThumb-Normal"];
    
    [self.sliderOutlet setThumbImage:thumbImageNormal
                      forState:UIControlStateNormal];
   
    UIImage *thumbImageHighlighted = [UIImage
                                      imageNamed:@"SliderThumb-Highlighted"];
    [self.sliderOutlet setThumbImage:thumbImageHighlighted
                      forState:UIControlStateHighlighted];
    
    UIImage *trackLeftImage =
    [[UIImage imageNamed:@"SliderTrackLeft"]
     resizableImageWithCapInsets:UIEdgeInsetsMake(0, 14, 0, 14)];
    [self.sliderOutlet setMinimumTrackImage:trackLeftImage
                             forState:UIControlStateNormal];
    UIImage *trackRightImage =
    [[UIImage imageNamed:@"SliderTrackRight"]
     
     resizableImageWithCapInsets:UIEdgeInsetsMake(0, 14, 0, 14)];
    [self.sliderOutlet setMaximumTrackImage:trackRightImage
                             forState:UIControlStateNormal];
    
}



- (void)updateLabels //help update targe label by passing in target value then use the stringwithformat method to convert target value int to string
{
    //self is view controller. targetlabel is property of vc
    self.targetLabel.text = [NSString stringWithFormat:@"%d",
                             _targetValue];
    
     //self is view controller. score- label is property of vc
   self.scoreLabel.text = [NSString stringWithFormat:@"%d",_score];
    self.roundLabel.text = [NSString stringWithFormat:@"%d",_round];
}


- (void)startNewRound //method called start new round used above in viewdidload
{
    _round = _round + 1;
    _targetValue = 1 + arc4random_uniform(100);
    _currentValue = 50; //created on the fly within startnewround method
    
    self.sliderOutlet.value = _currentValue; //self is vc.sliderOutlet is outlet of uislider
    
}


//create new method called start new game
//this method will reset the score and round number and start a new round as well.

- (void)startNewGame
{
    _score = 0;
    _round = 0;
    
    [self startNewRound];//calling startnew round method inside startnewgam method
}

- (IBAction)startOver:(id)sender {
    
    [self startNewGame]; //calling startnewgame method
    [self updateLabels]; //this is were you get to update label on screen
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showAlert:(id)sender {
    //calculate difference between slider and target value(rand#)
    //using ab(function) - aka absolute value turn neg to pos
    
    int difference = abs(_targetValue - _currentValue);
    
    //create an int variable for points on the fly
    int points = 100 - difference;
    
    //create ns string to rep title in alertview based on scores to encourage users
    NSString *title;
    
    if (difference == 0) {
        title = @"Perfect!";
        //give user 100 more points if score is perfect
        points += 100; //or points = points  + 100
        
    } else if (difference < 5) {
        title = @"You almost had it!";
        if (difference == 1) {
            points += 50;
        }
    } else if (difference < 10) {
        title = @"Pretty good!";
    } else {
        title = @"Not even close...";
    }
    
    
    //now use the score variable to add points
    _score = _score + points; //or _score+=points adds user points to total score
    

    
    //show points in alertview message
    
    NSString *message =[NSString stringWithFormat:@"You scored %d", points];
    
    //then create a ui Alert view and pass in message ivar
        UIAlertView *alertView = [[UIAlertView alloc]
                                  initWithTitle:title
                                  message:message
                                  delegate:self  //making VC alertview delegate as in .h file
                                  cancelButtonTitle:@"OK"
                                  otherButtonTitles:nil];
    [alertView show];
    
}


- (void)alertView:(UIAlertView *)alertView
didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    [self startNewRound]; //again calling startnew round
    [self updateLabels]; //this is were you get to update label on screen
}

//updating currentvalue of slider when moved
- (IBAction)sliderMoved:(UISlider *)slider
{
    
    _currentValue = lroundf(slider.value);
    
    //above You use the function lroundf() to round the decimal number to the nearest whole
    //number and you then store that rounded-off number into the _currentValue
    //variable.
    
}



//remove status bar
-(BOOL)prefersStatusBarHidden{
    
    return YES;
    
}

@end
