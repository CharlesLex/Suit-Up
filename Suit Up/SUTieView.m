//
//  SUTieView.m
//  Suit Up
//
//  Created by Josh Pearlstein on 10/2/13.
//  Copyright (c) 2013 Josh Pearlstein. All rights reserved.
//

#import "SUTieView.h"

@implementation SUTieView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)setTie:(UIImageView *)tie andView:(SUViewController *)controller{
    _tie = tie;
    _texture = controller.tieTexture;
    _color = controller.tieColor;
    self.controller = controller;
}


- (IBAction)whiteButton:(id)sender {
    _color = @"white";
    self.controller.tieColor = @"white";
    [self updateImage];
}

- (IBAction)lightBlueButton:(id)sender {
    _color = @"lBlue";
    self.controller.tieColor = @"lBlue";
    [self updateImage];
}

- (IBAction)royalBlueButton:(id)sender {
    _color = @"rBlue";
    self.controller.tieColor = @"rBlue";

    [self updateImage];
}

- (IBAction)lavendarButton:(id)sender {
    _color = @"lavender";
    self.controller.tieColor = @"lavender";
    [self updateImage];
}

- (IBAction)grayButton:(id)sender {
    _color = @"gray";
    self.controller.tieColor = @"gray";
    [self updateImage];
}

- (IBAction)stripedButton:(id)sender {
    _texture = @"small stripe";
    self.controller.tieTexture = @"small stripe";
    [self updateImage];
}

- (IBAction)texturedButton:(id)sender {
    _texture = @"large stripe";
    self.controller.tieTexture = @"large stripe";
    [self updateImage];
}

- (IBAction)ginghamButton:(id)sender {
    _texture = @"gingham";
    self.controller.tieTexture = @"gingham";
    [self updateImage];
}

- (IBAction)solidButton:(id)sender {
    _texture = @"solid";
    self.controller.tieTexture = @"solid";
    [self updateImage];
}
-(void)updateImage{
    if([_texture isEqualToString:@"small stripe"]){
        if([_color isEqualToString:@"white"]){
            _tie.image = [UIImage imageNamed:@"TIEWSS"];
        }
        else if([_color isEqualToString:@"lBlue"]){
            _tie.image = [UIImage imageNamed:@"TIELBSS"];

        }
        else if([_color isEqualToString:@"rBlue"]){
            _tie.image = [UIImage imageNamed:@"TIERBSS"];

        }
        else if([_color isEqualToString:@"lavender"]){
            _tie.image = [UIImage imageNamed:@"TIELSS"];

        }
        else if([_color isEqualToString:@"gray"]){
            _tie.image = [UIImage imageNamed:@"TIEGSS"];

        }
    }
    else if([_texture isEqualToString:@"large stripe"]){
        if([_color isEqualToString:@"white"]){
            _tie.image = [UIImage imageNamed:@"TIEWLS"];
        }
        else if([_color isEqualToString:@"lBlue"]){
            _tie.image = [UIImage imageNamed:@"TIELBLS"];
            
        }
        else if([_color isEqualToString:@"rBlue"]){
            _tie.image = [UIImage imageNamed:@"TIERBLS"];
            
        }
        else if([_color isEqualToString:@"lavender"]){
            _tie.image = [UIImage imageNamed:@"TIELLS"];
            
        }
        else if([_color isEqualToString:@"gray"]){
            _tie.image = [UIImage imageNamed:@"TIEGLS"];
            
        }
    }
    else if([_texture isEqualToString:@"gingham"]) {
        if([_color isEqualToString:@"white"]){
            _tie.image = [UIImage imageNamed:@"TIEWG"];
        }
        else if([_color isEqualToString:@"lBlue"]){
            _tie.image = [UIImage imageNamed:@"TIELBG"];
            
        }
        else if([_color isEqualToString:@"rBlue"]){
            _tie.image = [UIImage imageNamed:@"TIERBG"];
            
        }
        else if([_color isEqualToString:@"lavender"]){
            _tie.image = [UIImage imageNamed:@"TIELG"];
            
        }
        else if([_color isEqualToString:@"gray"]){
            _tie.image = [UIImage imageNamed:@"TIEGG"];
            
        }
        
    }
    else if([_texture isEqualToString:@"solid"]){
        if([_color isEqualToString:@"white"]){
            _tie.image = [UIImage imageNamed:@"TIEWS"];
        }
        else if([_color isEqualToString:@"lBlue"]){
            _tie.image = [UIImage imageNamed:@"TIELBS"];
            
        }
        else if([_color isEqualToString:@"rBlue"]){
            _tie.image = [UIImage imageNamed:@"TIERBS"];
            
        }
        else if([_color isEqualToString:@"lavender"]){
            _tie.image = [UIImage imageNamed:@"TIELS"];
            
        }
        else if([_color isEqualToString:@"gray"]){
            _tie.image = [UIImage imageNamed:@"TIEGS"];
            
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
/*;
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
