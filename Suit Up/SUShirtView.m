//
//  SUShirtView.m
//  Suit Up
//
//  Created by Josh Pearlstein on 10/2/13.
//  Copyright (c) 2013 Josh Pearlstein. All rights reserved.
//

#import "SUShirtView.h"

@implementation SUShirtView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
-(void)setShirt:(UIImageView *)shirt andView:(SUViewController *)controller{
    _shirt = shirt;
    _texture = controller.shirtTexture;
    _color = controller.shirtColor;
    _controller = controller;
    
}
-(void)setShirt_Neck:(UIImageView *)shirt_Neck{
    _shirt_Neck = shirt_Neck;
}

- (IBAction)whiteButton:(id)sender {
    _color = @"white";
    self.controller.shirtColor = @"white";
    [self updateImage];
}

- (IBAction)lightBlueButton:(id)sender {
    _color = @"lBlue";
    self.controller.shirtColor = @"lBlue";

    [self updateImage];
}

- (IBAction)royalBlueButton:(id)sender {
    _color = @"rBlue";
    self.controller.shirtColor = @"rBlue";

    [self updateImage];
}

- (IBAction)lavendarButton:(id)sender {
    _color = @"lavender";
    self.controller.shirtColor = @"lavender";

    [self updateImage];
}

- (IBAction)grayButton:(id)sender {
    _color = @"gray";
    self.controller.shirtColor = @"gray";
    [self updateImage];
}

- (IBAction)stripedButton:(id)sender {
    _texture = @"small stripe";
    self.controller.shirtTexture = @"small stripe";
    [self updateImage];
}

- (IBAction)texturedButton:(id)sender {
    _texture = @"large stripe";
    self.controller.shirtTexture = @"large stripe";

    [self updateImage];
}

- (IBAction)ginghamButton:(id)sender {
    _texture = @"gingham";
    self.controller.shirtTexture = @"gingham";

    [self updateImage];
}

- (IBAction)solidButton:(id)sender {
    _texture = @"solid";
    self.controller.shirtTexture = @"solid";

    [self updateImage];
}

-(void)updateImage{
    
    if([_texture isEqualToString:@"small stripe"]){
        if([_color isEqualToString:@"white"]){
            _shirt.image = [UIImage imageNamed:@"SHIRTWSS"];
            _shirt_Neck.image = [UIImage imageNamed:@"SHIRTNECKWSS"];
        }
        else if([_color isEqualToString:@"lBlue"]){
            _shirt.image = [UIImage imageNamed:@"SHIRTLBSS"];
            _shirt_Neck.image = [UIImage imageNamed:@"SHIRTNECKLBSS"];
        }
        else if([_color isEqualToString:@"rBlue"]){
            _shirt.image = [UIImage imageNamed:@"SHIRTRBSS"];
            _shirt_Neck.image = [UIImage imageNamed:@"SHIRTNECKRBSS"];
        }
        else if([_color isEqualToString:@"lavender"]){
            _shirt.image = [UIImage imageNamed:@"SHIRTLSS"];
            _shirt_Neck.image = [UIImage imageNamed:@"SHIRTNECKLSS"];
        }
        else if([_color isEqualToString:@"gray"]){
            _shirt.image = [UIImage imageNamed:@"SHIRTGSS"];
            _shirt_Neck.image = [UIImage imageNamed:@"SHIRTNECKGSS"];
        }
    }
    else if([_texture isEqualToString:@"large stripe"]){
        if([_color isEqualToString:@"white"]){
            _shirt.image = [UIImage imageNamed:@"SHIRTWLS"];
            _shirt_Neck.image = [UIImage imageNamed:@"SHIRTNECKWLS"];
        }
        else if([_color isEqualToString:@"lBlue"]){
            _shirt.image = [UIImage imageNamed:@"SHIRTLBLS"];
            _shirt_Neck.image = [UIImage imageNamed:@"SHIRTNECKLBLS"];

        }
        else if([_color isEqualToString:@"rBlue"]){
            _shirt.image = [UIImage imageNamed:@"SHIRTRBLS"];
            _shirt_Neck.image = [UIImage imageNamed:@"SHIRTNECKRBLS"];

        }
        else if([_color isEqualToString:@"lavender"]){
            _shirt.image = [UIImage imageNamed:@"SHIRTLLS"];
            _shirt_Neck.image = [UIImage imageNamed:@"SHIRTNECKLLS"];
            
        }
        else if([_color isEqualToString:@"gray"]){
            _shirt.image = [UIImage imageNamed:@"SHIRTGLS"];
            _shirt_Neck.image = [UIImage imageNamed:@"SHIRTNECKGLS"];

        }
    }
    else if([_texture isEqualToString:@"gingham"]) {
        if([_color isEqualToString:@"white"]){
            _shirt.image = [UIImage imageNamed:@"SHIRTWG"];
            _shirt_Neck.image = [UIImage imageNamed:@"SHIRTNECKWG"];
        }
        else if([_color isEqualToString:@"lBlue"]){
            _shirt.image = [UIImage imageNamed:@"SHIRTLBG"];
            _shirt_Neck.image = [UIImage imageNamed:@"SHIRTNECKLBG"];
        }
        else if([_color isEqualToString:@"rBlue"]){
            _shirt.image = [UIImage imageNamed:@"SHIRTRBG"];
            _shirt_Neck.image = [UIImage imageNamed:@"SHIRTNECKRBG"];
        }
        else if([_color isEqualToString:@"lavender"]){
            _shirt.image = [UIImage imageNamed:@"SHIRTLG"];
            _shirt_Neck.image = [UIImage imageNamed:@"SHIRTNECKLG"];
        }
        else if([_color isEqualToString:@"gray"]){
            _shirt.image = [UIImage imageNamed:@"SHIRTGG"];
            _shirt_Neck.image = [UIImage imageNamed:@"SHIRTNECKGG"];
        }
        
    }
    else if([_texture isEqualToString:@"solid"]){
        if([_color isEqualToString:@"white"]){
            _shirt.image = [UIImage imageNamed:@"SHIRTWS"];
            _shirt_Neck.image = [UIImage imageNamed:@"SHIRTNECKWS"];

        }
        else if([_color isEqualToString:@"lBlue"]){
            _shirt.image = [UIImage imageNamed:@"SHIRTLBS"];
            _shirt_Neck.image = [UIImage imageNamed:@"SHIRTNECKLBS"];
            
        }
        else if([_color isEqualToString:@"rBlue"]){
            _shirt.image = [UIImage imageNamed:@"SHIRTRBS"];
            _shirt_Neck.image = [UIImage imageNamed:@"SHIRTNECKRBS"];
        }
        else if([_color isEqualToString:@"lavender"]){
            _shirt.image = [UIImage imageNamed:@"SHIRTLS"];
            _shirt_Neck.image = [UIImage imageNamed:@"SHIRTNECKLS"];
        }
        else if([_color isEqualToString:@"gray"]){
            _shirt.image = [UIImage imageNamed:@"SHIRTGS"];
            _shirt_Neck.image = [UIImage imageNamed:@"SHIRTNECKGS"];
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
