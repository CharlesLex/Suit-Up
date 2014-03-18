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
    _text = [[UITextView alloc]init];
    _text.text = _text_holder;
    _image = [[UIImageView alloc]initWithImage:_image_holder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)rate:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
