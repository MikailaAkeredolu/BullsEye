//
//  AboutViewController.m
//  BullsEye
//
//  Created by Mikaila Akeredolu on 12/29/13.
//  Copyright (c) 2013 Mikaila Akeredolu. All rights reserved.
//

#import "AboutViewController.h"

@interface AboutViewController ()

@end

@implementation AboutViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//this line helps close the about screen with an animation
-(IBAction)close{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

//remove status bar
-(BOOL)prefersStatusBarHidden{
    
    
    return YES;
    
}

@end
