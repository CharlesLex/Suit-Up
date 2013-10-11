//
//  SUTieView.h
//  Suit Up
//
//  Created by Josh Pearlstein on 10/2/13.
//  Copyright (c) 2013 Josh Pearlstein. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SUTieView : UIView
@property (nonatomic,retain) UIImageView *tie;
@property (nonatomic,strong) NSString *color;
@property (nonatomic,strong) NSString *texture;

-(void)setTie:(UIImageView *)tie;
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
