//
//  SUShoesView.h
//  Suit Up
//
//  Created by Josh Pearlstein on 10/2/13.
//  Copyright (c) 2013 Josh Pearlstein. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SUShoesView : UIView
@property (nonatomic,retain) UIImageView *shoes;
@property (strong,nonatomic) NSString *color;
- (IBAction)setBlackShoes:(id)sender;
- (IBAction)setBrownShoes:(id)sender;
-(void)setShoes:(UIImageView *)shoes;
@end
