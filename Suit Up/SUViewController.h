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
#import "SUOpenView.h"
#import "Suit.h"
#import "SUTipViewController.h"

@class SUSuitView,SUShirtView,SUTieView,SUOpenView,SUTipViewController;
@interface SUViewController : UIViewController <UIScrollViewDelegate, UIGestureRecognizerDelegate>
@property (strong, nonatomic) IBOutlet UIView *images;
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
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *doubleTap;
@property (strong, nonatomic) NSMutableArray *textureRating;
@property (strong, nonatomic) NSMutableArray *colorRating;
@property (strong, nonatomic) NSMutableArray *buttonArray;
@property (strong,nonatomic) NSNumber *size;
@property (strong,nonatomic) SUShirtView *shirtView;
@property (strong,nonatomic) SUShoesView *shoeView;
@property (strong,nonatomic) SUTieView *tieView;
@property (strong,nonatomic) SUSuitView *suitView;
@property (strong,nonatomic) SUOpenView *openView;
@property (nonatomic,retain) SUTipViewController *tipView;
@property (strong, nonatomic) NSString *suitColor;
@property (strong, nonatomic) NSString *shirtColor;
@property (strong, nonatomic) NSString *tieColor;
@property (strong, nonatomic) NSString *shoeColor;
@property (strong, nonatomic) NSString *suitTexture;
@property (strong, nonatomic) NSString *shirtTexture;
@property (strong, nonatomic) NSString *tieTexture;
@property (nonatomic,retain) NSString *comment1;
@property (nonatomic,retain) NSString *comment2;
@property (nonatomic,retain) NSString *comment3;
@property (nonatomic,retain) NSNumber *total;
@property (nonatomic,retain) NSMutableArray *positive_comments;
@property (nonatomic,retain) NSMutableArray *mid_comments;
@property (nonatomic,retain) NSMutableArray *negative_comments;
- (IBAction)exitButton:(id)sender;

- (IBAction)checkSuit:(id)sender;
- (IBAction)openButton:(id)sender;
- (IBAction)suitButton:(id)sender;
- (IBAction)shirtButton:(id)sender;
- (IBAction)tieButton:(id)sender;
- (IBAction)shoesButton:(id)sender;
-(void)displaySuit:(Suit*)suit;
-(void)initWithSelection:(NSString*)suitText andshirt:(NSString*)shirtText andTie:(NSString*)tieText withColor:(NSString*)suitColor shirtColor:(NSString*)shirtColor tieColor:(NSString*)tieColor andShoeColor:(NSString*)shoeColor;
-(void)hideMenu;
-(void)dismissTip;
@end
