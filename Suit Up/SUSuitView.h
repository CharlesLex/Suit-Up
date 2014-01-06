//
//  SUSuitView.h
//  Suit Up
//
//  Created by Josh Pearlstein on 10/2/13.
//  Copyright (c) 2013 Josh Pearlstein. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SUViewController.h"
@class SUViewController;
@interface SUSuitView : CSAnimationView
@property (nonatomic,retain) UIImageView *suit;
@property (nonatomic,strong) NSString *color;
@property (nonatomic,strong) NSString *texture;
@property (nonatomic,strong) SUViewController *controller;
@property (nonatomic,retain) NSMutableArray *buttons;

//Buttons
@property (strong, nonatomic) IBOutlet UIButton *black;
@property (strong, nonatomic) IBOutlet UIButton *navy;
@property (strong, nonatomic) IBOutlet UIButton *lGray;
@property (strong, nonatomic) IBOutlet UIButton *dGray;
@property (strong, nonatomic) IBOutlet UIButton *brown;


- (IBAction)blackButtonPressed:(id)sender;
- (IBAction)navyButtonPressed:(id)sender;
- (IBAction)lGrayButtonPressed:(id)sender;
- (IBAction)dGrayButtonPressed:(id)sender;
- (IBAction)brownButtonPressed:(id)sender;
- (IBAction)stripedButtonPressed:(id)sender;
- (IBAction)texturedButtonPressed:(id)sender;
- (IBAction)solidButtonPressed:(id)sender;
- (void)setSuit:(UIImageView *)suit andView:(SUViewController *)controller;
-(void)updateSuit:(NSString*)suitColor andTexture:(NSString*)suitTexture;
@end
