//
//  SUSuitView.m
//  Suit Up
//
//  Created by Josh Pearlstein on 10/2/13.
//  Copyright (c) 2013 Josh Pearlstein. All rights reserved.
//

#import "SUSuitView.h"
#import "SUViewController.h"

@implementation SUSuitView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}
-(void)setSuit:(UIImageView *)suit andView:(SUViewController *)controller{
    self.suit  = suit;
    self.texture = controller.suitTexture;
    self.color = controller.suitColor;
    self.controller = controller;
    _buttons = [[NSMutableArray alloc]initWithObjects:
                _black,_brown,_lGray,_dGray,_navy,nil];
}
-(void)updateSuit:(NSString*)suitColor andTexture:(NSString*)suitTexture{
    _color = suitColor;
    _texture = suitTexture;
    [self adjustImage];
}
-(void)selectButton:(id)sender{
    for(UIButton *btn in _buttons){
        [btn setSelected:NO];
    }
    [sender setSelected:YES];
}
- (IBAction)blackButtonPressed:(id)sender {
    _color = @"black";
    self.controller.suitColor = @"black";
    [self adjustImage];
    [self selectButton:sender];
}

- (IBAction)navyButtonPressed:(id)sender {
    _color = @"navy";
    self.controller.suitColor = @"navy";
    [self selectButton:sender];

    [self adjustImage];
}

- (IBAction)lGrayButtonPressed:(id)sender {
    _color = @"lGray";
    self.controller.suitColor = @"lGray";
    [self selectButton:sender];

    [self adjustImage];

}

- (IBAction)dGrayButtonPressed:(id)sender {
    _color = @"dGray";
    self.controller.suitColor = @"dGray";
    [self selectButton:sender];
    [self adjustImage];

}

- (IBAction)brownButtonPressed:(id)sender {
    _color = @"brown";
    self.controller.suitColor = @"brown";
    [self selectButton:sender];
    [self adjustImage];

}

- (IBAction)stripedButtonPressed:(id)sender {
    _texture = @"stripe";
    self.controller.suitTexture = @"stripe";
    [self adjustImage];

}

- (IBAction)texturedButtonPressed:(id)sender {
    _texture = @"texture";
    self.controller.suitTexture = @"texture";
    [self adjustImage];

}

- (IBAction)solidButtonPressed:(id)sender {
    _texture = @"solid";
    self.controller.suitTexture = @"solid";
    [self adjustImage];

}
-(void)adjustImage{
    if([_texture isEqualToString:@"stripe"]){
        if([_color isEqualToString:@"black"]){
            _suit.image = [UIImage imageNamed:@"SUITBLST"];
        }
        else if([_color isEqualToString:@"navy"]){
            _suit.image = [UIImage imageNamed:@"SUITNST"];
            
        }
        else if([_color isEqualToString:@"lGray"]){
            _suit.image = [UIImage imageNamed:@"SUITLGST"];
            
        }
        else if([_color isEqualToString:@"dGray"]){
            _suit.image = [UIImage imageNamed:@"SUITDGST"];
            
        }
        else if([_color isEqualToString:@"brown"]){
            _suit.image = [UIImage imageNamed:@"SUITBRST"];
            
        }
    }
    else if([_texture isEqualToString:@"texture"]){
        if([_color isEqualToString:@"black"]){
            _suit.image = [UIImage imageNamed:@"SUITBLT"];
        }
        else if([_color isEqualToString:@"navy"]){
            _suit.image = [UIImage imageNamed:@"SUITNT"];
            
        }
        else if([_color isEqualToString:@"lGray"]){
            _suit.image = [UIImage imageNamed:@"SUITLGT"];
            
        }
        else if([_color isEqualToString:@"dGray"]){
            _suit.image = [UIImage imageNamed:@"SUITDGT"];
            
        }
        else if([_color isEqualToString:@"brown"]){
            _suit.image = [UIImage imageNamed:@"SUITBRT"];
            
        }
    }
    else if([_texture isEqualToString:@"solid"]) {
        if([_color isEqualToString:@"black"]){
            _suit.image = [UIImage imageNamed:@"SUITBLS"];
        }
        else if([_color isEqualToString:@"navy"]){
            _suit.image = [UIImage imageNamed:@"SUITNS"];
            
        }
        else if([_color isEqualToString:@"lGray"]){
            _suit.image = [UIImage imageNamed:@"SUITLGS"];
            
        }
        else if([_color isEqualToString:@"dGray"]){
            _suit.image = [UIImage imageNamed:@"SUITDGS"];
            
        }
        else if([_color isEqualToString:@"brown"]){
            _suit.image = [UIImage imageNamed:@"SUITBRS"];
            
        }
    }
    else{
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Error"
                                                       message:@"Invalid Selection"
                                                      delegate:self
                                             cancelButtonTitle:@"Ok"
                                             otherButtonTitles: nil];
        [alert show];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
