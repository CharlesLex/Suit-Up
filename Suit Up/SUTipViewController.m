//
//  SUTipViewController.m
//  Suit Up
//
//  Created by Josh Pearlstein on 2/26/14.
//  Copyright (c) 2014 Josh Pearlstein. All rights reserved.
//

#import "SUTipViewController.h"
@interface SUTipViewController ()

@end

@implementation SUTipViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(id)initWithText:(NSString*)text andImage:(UIImage*)image andController:(SUViewController*)controller{
    self = [super init];
    if (self) {
    
        [_rate addTarget:self action:@selector(rate) forControlEvents:UIControlEventTouchUpInside];
        _text_holder = text;
        _image_holder = image;
        _controller = controller;
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    int rand = arc4random() %3 + 1;
    NSLog(@"%x",rand);
    if(rand == 1){
        [self tip1];
    }
    else if(rand == 2){
        [self tip2];
    }
    else if(rand == 3){
        [self tip3];
    }
    [self.view layoutSubviews];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)rate:(id)sender {
    NSLog(@"Hereerere");
    [_controller dismissTip];
}

-(void)tip1{
    [self.text setFont:[UIFont fontWithName:@"Bariol-Regular" size:4]];
    [self.text setText:@"Do your pants touch the ground when you aren’t wearing shoes? If so, you need to get your pants hemmed."];
    [self.image setImage:[UIImage imageNamed:@"tip1"]];
}
-(void)tip2{
    [self.text setFont:[UIFont fontWithName:@"Bariol-Regular" size:4]];
    [self.text setText:@"When standing with your arms at your sides, 1/4 - 1/2 inches of your shirt's sleeve should show under your suit."];
    [self.image setImage:[UIImage imageNamed:@"tip2"]];
}
-(void)tip3{
    [self.text setFont:[UIFont fontWithName:@"Bariol-Regular" size:4]];
    [self.text setText:@"If you are unsure about what socks to wear with a suit, you cannot go wrong with matching them to your suit, shoes or both. Don't worry if they do not perfectly match, they are made of different materials."];
    [self.image setImage:[UIImage imageNamed:@"tip3"]];
}
-(UITextView *)text{
    if(!_text){
        _text = [[UITextView alloc]init];
    }
    return _text;
}
-(UIImageView *)image{
    if(!_image){
        _image = [[UIImageView alloc]init];
    }
    return _image;
}
@end
