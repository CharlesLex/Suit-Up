//
//  SUCommentViewController.m
//  Suit Up
//
//  Created by Josh Pearlstein on 12/9/13.
//  Copyright (c) 2013 Josh Pearlstein. All rights reserved.
//

#import "SUCommentViewController.h"
#import "Suit.h"
#import "SUAppDelegate.h"
@interface SUCommentViewController ()

@end

@implementation SUCommentViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    UILabel *title = (UILabel*)[self.view viewWithTag:1];
    UILabel *comment1 = (UILabel*)[self.view viewWithTag:2];
    UILabel *comment2 = (UILabel*)[self.view viewWithTag:3];
    UILabel *comment3 = (UILabel*)[self.view viewWithTag:4];
    title.text = [NSString stringWithFormat:@"%@",_total];
    comment1.text = _comment1;
    comment2.text = _comment2;
    comment3.text = _comment3;
    
    SUAppDelegate *appDelegate  = (SUAppDelegate *)[[UIApplication sharedApplication]delegate];
    _managedObjectContext = [appDelegate managedObjectContext];
    
}
- (IBAction)saveSuit:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Name Your Suit!" message:nil delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Save", nil];
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    [alert show];
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if(buttonIndex == 1){
        [self save:[alertView textFieldAtIndex:0].text];
    }
}
-(void)save:(NSString*)title{
    NSLog(@"%@",title);
    NSManagedObjectContext *context = [self managedObjectContext];
    Suit *suit = [NSEntityDescription
                      insertNewObjectForEntityForName:@"Suit"
                      inManagedObjectContext:context];
    suit.name = title;
    suit.suit_color = _suitColor;
    suit.shirt_color = _shirtColor;
    suit.tie_color = _tieColor;
    suit.shoes_color = _shoeColor;
    
    suit.suit_texture = _suitTexture;
    suit.shirt_texture = _shirtTexture;
    suit.tie_texture = _tieTexture;
    NSError *error;
    if (![context save:&error]) {
        NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
    }
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Suit Saved!" message:@"Your Suit has been saved!" delegate:self cancelButtonTitle:nil otherButtonTitles:@"Sweet!", nil];
    [alert show];
}
-(void)setUpWithTitle:(NSNumber*)total com1:(NSString*)com1 com2:(NSString*)com2 com3:(NSString*)com3{
    _total = total;
    _comment1 = com1;
    _comment2 = com2;
    _comment3 = com3;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)setColorSelection:(NSString*)suitColor andShirt:(NSString*)shirtColor andTie:(NSString*)tieColor andShoes:(NSString*)shoeColor{
    _suitColor = suitColor;
    _shirtColor = shirtColor;
    _tieColor = tieColor;
    _shoeColor = shoeColor;
}
-(void)setTextureSelection:(NSString*)suitTexture andShirt:(NSString*)shirtTexture andTie:(NSString*)tieTexture{
    _suitTexture = suitTexture;
    _shirtTexture = shirtTexture;
    _tieTexture = tieTexture;
}

@end
