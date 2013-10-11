//
//  SUShoesView.m
//  Suit Up
//
//  Created by Josh Pearlstein on 10/2/13.
//  Copyright (c) 2013 Josh Pearlstein. All rights reserved.
//

#import "SUShoesView.h"

@implementation SUShoesView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
- (IBAction)setBlackShoes:(id)sender {
    _shoes.image = [UIImage imageNamed:@"Black Shoes"];
    _color = @"black";
    [_shoes reloadInputViews];
}

- (IBAction)setBrownShoes:(id)sender {
    _shoes.image = [UIImage imageNamed:@"Brown Shoes"];
    _color = @"brown";
    [_shoes reloadInputViews];
}

-(void)setShoes:(UIImageView *)shoes{
    _shoes = shoes;
    if(!_color){
        _color = @"brown";
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
