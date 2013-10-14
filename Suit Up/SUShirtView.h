//
//  SUShirtView.h
//  Suit Up
//
//  Created by Josh Pearlstein on 10/2/13.
//  Copyright (c) 2013 Josh Pearlstein. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SUViewController.h"
@class SUViewController;
@interface SUShirtView : UIView
@property (nonatomic,retain) UIImageView *shirt;
@property (nonatomic,retain) UIImageView *shirt_Neck;
@property (nonatomic,strong) NSString *color;
@property (nonatomic,strong) NSString *texture;
@property (nonatomic,strong) SUViewController *controller;
-(void)setShirt:(UIImageView *)shirt andView:(SUViewController *)controller;
-(void)setShirt_Neck:(UIImageView *)shirt_Neck;
- (IBAction)whiteButton:(id)sender;
- (IBAction)lightBlueButton:(id)sender;
- (IBAction)royalBlueButton:(id)sender;
- (IBAction)lavendarButton:(id)sender;
- (IBAction)grayButton:(id)sender;
- (IBAction)stripedButton:(id)sender;
- (IBAction)texturedButton:(id)sender;
- (IBAction)ginghamButton:(id)sender;
- (IBAction)solidButton:(id)sender;

@end
