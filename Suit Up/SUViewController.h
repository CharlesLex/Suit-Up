//
//  SUViewController.h
//  Suit Up
//
//  Created by Josh Pearlstein on 10/1/13.
//  Copyright (c) 2013 Josh Pearlstein. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SUSuitView.h"
#import "SUShirtView.h"
#import "SUShoesView.h"
#import "SUTieView.h"
@interface SUViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *shoes;
@property (strong, nonatomic) IBOutlet UIImageView *shirtNeck;
@property (strong, nonatomic) IBOutlet UIImageView *suit;
@property (strong, nonatomic) IBOutlet UIImageView *tie;
@property (strong, nonatomic) IBOutlet UIImageView *shirt;
@property (strong, nonatomic) IBOutlet UIButton *openButton;
@property (strong, nonatomic) IBOutlet UIButton *suitButton;
@property (strong, nonatomic) IBOutlet UIButton *shirtButton;
@property (strong, nonatomic) IBOutlet UIButton *tieButton;
@property (strong, nonatomic) IBOutlet UIButton *shoeButton;
@property (strong, nonatomic) NSMutableArray *textureRating;
@property (strong, nonatomic) NSMutableArray *colorRating;
@property (strong, nonatomic) NSMutableArray *buttonArray;
@property (strong,nonatomic) NSNumber *size;
@property (strong,nonatomic) SUShirtView *shirtView;
@property (strong,nonatomic) SUShoesView *shoeView;
@property (strong,nonatomic) SUTieView *tieView;
@property (strong,nonatomic) SUSuitView *suitView;

- (IBAction)checkSuit:(id)sender;
- (IBAction)openButton:(id)sender;
- (IBAction)suitButton:(id)sender;
- (IBAction)shirtButton:(id)sender;
- (IBAction)tieButton:(id)sender;
- (IBAction)shoesButton:(id)sender;

@end
