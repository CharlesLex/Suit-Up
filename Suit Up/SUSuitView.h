//
//  SUSuitView.h
//  Suit Up
//
//  Created by Josh Pearlstein on 10/2/13.
//  Copyright (c) 2013 Josh Pearlstein. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SUSuitView : UIView
@property (nonatomic,retain) UIImageView *suit;
@property (nonatomic,strong) NSString *color;
@property (nonatomic,strong) NSString *texture;

- (IBAction)blackButtonPressed:(id)sender;
- (IBAction)navyButtonPressed:(id)sender;
- (IBAction)lGrayButtonPressed:(id)sender;
- (IBAction)dGrayButtonPressed:(id)sender;
- (IBAction)brownButtonPressed:(id)sender;
- (IBAction)stripedButtonPressed:(id)sender;
- (IBAction)texturedButtonPressed:(id)sender;
- (IBAction)solidButtonPressed:(id)sender;



-(void)setSuit:(UIImageView *)suit;
@end
