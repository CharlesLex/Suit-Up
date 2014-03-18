//
//  SUTieView.h
//  Suit Up
//
//  Created by Josh Pearlstein on 10/2/13.
//  Copyright (c) 2013 Josh Pearlstein. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SUViewController.h"
@interface SUTieView : CSAnimationView
@property (nonatomic,retain) UIImageView *tie;
@property (nonatomic,strong) NSString *color;
@property (nonatomic,strong) NSString *texture;
@property (nonatomic,strong) SUViewController *controller;
@property (nonatomic,retain) NSMutableArray *buttons;

//Buttons
@property (strong, nonatomic) IBOutlet UIButton *blackButton;
@property (strong, nonatomic) IBOutlet UIButton *brownButton;
@property (strong, nonatomic) IBOutlet UIButton *greyButton;
@property (strong, nonatomic) IBOutlet UIButton *lBlueButton;
@property (strong, nonatomic) IBOutlet UIButton *royalBlueButton;
@property (strong, nonatomic) IBOutlet UIButton *lavendarButton;
@property (strong, nonatomic) IBOutlet UIButton *orangeButton;
@property (strong, nonatomic) IBOutlet UIButton *yellowButton;
@property (strong, nonatomic) IBOutlet UIButton *greenButton;
@property (strong, nonatomic) IBOutlet UIButton *redButton;









-(void)setTie:(UIImageView *)tie andView:(SUViewController *)controller;
- (IBAction)redButton:(id)sender;
- (IBAction)lightBlueButton:(id)sender;
- (IBAction)royalBlueButton:(id)sender;
- (IBAction)lavendarButton:(id)sender;
- (IBAction)grayButton:(id)sender;
- (IBAction)blackButton:(id)sender;
- (IBAction)brownButton:(id)sender;
- (IBAction)orangeButton:(id)sender;
- (IBAction)yellowButton:(id)sender;
- (IBAction)greenButton:(id)sender;

- (IBAction)stripedButton:(id)sender;
- (IBAction)texturedButton:(id)sender;
- (IBAction)ginghamButton:(id)sender;
- (IBAction)solidButton:(id)sender;
-(void)updateTie:(NSString*)tieColor andTexture:(NSString*)tieTexture;
-(void)updateImage;

@end
