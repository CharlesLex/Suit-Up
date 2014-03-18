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
    _buttons = [[NSMutableArray alloc]initWithObjects:
                _blackButton,_brownButton,_greyButton,_lBlueButton,_royalBlueButton,_lavendarButton,_orangeButton,_yellowButton,_greenButton,_redButton
                , nil];
    
}
-(void)selectButton:(id)sender{
    for(UIButton *btn in _buttons){
        [btn setSelected:NO];
    }
    [sender setSelected:YES];
}
-(void)updateTie:(NSString*)tieColor andTexture:(NSString*)tieTexture{
    _color = tieColor;
    _texture = tieTexture;
    [self updateImage];
    for(UIButton *btn in _buttons){
        [btn setSelected:NO];
    }
}
- (IBAction)redButton:(id)sender {
    _color = @"red";
    self.controller.tieColor = @"red";
    [self updateImage];
    [self selectButton:sender];
}

- (IBAction)lightBlueButton:(id)sender {
    _color = @"lBlue";
    self.controller.tieColor = @"lBlue";
    [self updateImage];
    [self selectButton:sender];

}

- (IBAction)royalBlueButton:(id)sender {
    _color = @"rBlue";
    self.controller.tieColor = @"rBlue";

    [self updateImage];
    [self selectButton:sender];

}

- (IBAction)lavendarButton:(id)sender {
    _color = @"lavender";
    self.controller.tieColor = @"lavender";
    [self updateImage];
    [self selectButton:sender];

}

- (IBAction)grayButton:(id)sender {
    _color = @"gray";
    self.controller.tieColor = @"gray";
    [self updateImage];
    [self selectButton:sender];

}

- (IBAction)blackButton:(id)sender {
    _color = @"black";
    self.controller.tieColor = @"black";
    [self updateImage];
    [self selectButton:sender];

}

- (IBAction)brownButton:(id)sender {
    _color = @"brown";
    self.controller.tieColor = @"brown";
    [self updateImage];
    [self selectButton:sender];

}

- (IBAction)orangeButton:(id)sender {
    _color = @"orange";
    self.controller.tieColor = @"orange";
    [self updateImage];
    [self selectButton:sender];

}

- (IBAction)yellowButton:(id)sender {
    _color = @"yellow";
    self.controller.tieColor = @"yellow";
    [self updateImage];
    [self selectButton:sender];

}

- (IBAction)greenButton:(id)sender {
    _color = @"green";
    self.controller.tieColor = @"green";
    [self updateImage];
    [self selectButton:sender];

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
        if([_color isEqualToString:@"red"]){
            _tie.image = [UIImage imageNamed:@"TIERSS"];
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
        else if([_color isEqualToString:@"black"]){
            _tie.image = [UIImage imageNamed:@"TIEBLSS"];
            
        }
        else if([_color isEqualToString:@"brown"]){
            _tie.image = [UIImage imageNamed:@"TIEBRSS"];
            
        }
        else if([_color isEqualToString:@"orange"]){
            _tie.image = [UIImage imageNamed:@"TIEOSS"];
            
        }
        else if([_color isEqualToString:@"yellow"]){
            _tie.image = [UIImage imageNamed:@"TIEYSS"];
            
        }
        else if([_color isEqualToString:@"green"]){
            _tie.image = [UIImage imageNamed:@"TIEGRSS"];
        }
    }
    else if([_texture isEqualToString:@"large stripe"]){
        if([_color isEqualToString:@"red"]){
            _tie.image = [UIImage imageNamed:@"TIERLS"];
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
        else if([_color isEqualToString:@"black"]){
            _tie.image = [UIImage imageNamed:@"TIEBLLS"];
            
        }
        else if([_color isEqualToString:@"brown"]){
            _tie.image = [UIImage imageNamed:@"TIEBRLS"];
            
        }
        else if([_color isEqualToString:@"orange"]){
            _tie.image = [UIImage imageNamed:@"TIEOLS"];
            
        }
        else if([_color isEqualToString:@"yellow"]){
            _tie.image = [UIImage imageNamed:@"TIEYLS"];
            
        }
        else if([_color isEqualToString:@"green"]){
            _tie.image = [UIImage imageNamed:@"TIEGRLS"];
        }
    }
    else if([_texture isEqualToString:@"gingham"]) {
        if([_color isEqualToString:@"red"]){
            _tie.image = [UIImage imageNamed:@"TIERG"];
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
        else if([_color isEqualToString:@"black"]){
            _tie.image = [UIImage imageNamed:@"TIEBLG"];
            
        }
        else if([_color isEqualToString:@"brown"]){
            _tie.image = [UIImage imageNamed:@"TIEBRG"];
            
        }
        else if([_color isEqualToString:@"orange"]){
            _tie.image = [UIImage imageNamed:@"TIEOG"];
            
        }
        else if([_color isEqualToString:@"yellow"]){
            _tie.image = [UIImage imageNamed:@"TIEYG"];
            
        }
        else if([_color isEqualToString:@"green"]){
            _tie.image = [UIImage imageNamed:@"TIEGRG"];
        }
        
    }
    else if([_texture isEqualToString:@"solid"]){
        if([_color isEqualToString:@"red"]){
            _tie.image = [UIImage imageNamed:@"TIERS"];
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
        else if([_color isEqualToString:@"black"]){
            _tie.image = [UIImage imageNamed:@"TIEBLS"];
            
        }
        else if([_color isEqualToString:@"brown"]){
            _tie.image = [UIImage imageNamed:@"TIEBRS"];
            
        }
        else if([_color isEqualToString:@"orange"]){
            _tie.image = [UIImage imageNamed:@"TIEOS"];
            
        }
        else if([_color isEqualToString:@"yellow"]){
            _tie.image = [UIImage imageNamed:@"TIEYS"];
            
        }
        else if([_color isEqualToString:@"green"]){
            _tie.image = [UIImage imageNamed:@"TIEGRS"];
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
