//
//  SUTipViewController.h
//  Suit Up
//
//  Created by Josh Pearlstein on 2/26/14.
//  Copyright (c) 2014 Josh Pearlstein. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SUViewController.h"

@interface SUTipViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextView *text;
@property (strong, nonatomic) IBOutlet UIImageView *image;
@property (strong, nonatomic) IBOutlet UIButton *rate;
@property (nonatomic,retain) NSString *text_holder;
@property (nonatomic,retain) UIImage *image_holder;
@property (nonatomic,retain) SUViewController *controller;
- (IBAction)rate:(id)sender;
-(id)initWithText:(NSString*)text andImage:(UIImage*)image andController:(SUViewController*)controller;
@end
