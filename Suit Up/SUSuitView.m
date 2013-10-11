//
//  SUSuitView.m
//  Suit Up
//
//  Created by Josh Pearlstein on 10/2/13.
//  Copyright (c) 2013 Josh Pearlstein. All rights reserved.
//

#import "SUSuitView.h"

@implementation SUSuitView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}
-(void)setSuit:(UIImageView *)suit{
    _suit = suit;
    if(!_texture){
        _texture = @"striped";
    }
    if(!_color){
        _color = @"black";
    }
}
- (IBAction)blackButtonPressed:(id)sender {
    _color = @"black";
    [self adjustImage];
}

- (IBAction)navyButtonPressed:(id)sender {
    _color = @"navy";
    [self adjustImage];

}

- (IBAction)lGrayButtonPressed:(id)sender {
    _color = @"lGray";
    [self adjustImage];

}

- (IBAction)dGrayButtonPressed:(id)sender {
    _color = @"dGray";
    [self adjustImage];

}

- (IBAction)brownButtonPressed:(id)sender {
    _color = @"brown";
    [self adjustImage];

}

- (IBAction)stripedButtonPressed:(id)sender {
    _texture = @"striped";
    [self adjustImage];

}

- (IBAction)texturedButtonPressed:(id)sender {
    _texture = @"textured";
    [self adjustImage];

}

- (IBAction)solidButtonPressed:(id)sender {
    _texture = @"solid";
    [self adjustImage];

}
-(void)adjustImage{
    if([_texture isEqualToString:@"striped"]){
        if([_color isEqualToString:@"black"]){
            _suit.image = [UIImage imageNamed:@"SUITBLS"];
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
    else if([_texture isEqualToString:@"textured"]){
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
