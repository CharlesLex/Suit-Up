//
//  SUViewController.m
//  Suit Up
//
//  Created by Josh Pearlstein on 10/1/13.
//  Copyright (c) 2013 Josh Pearlstein. All rights reserved.
//

#import "SUViewController.h"
#import "JKPopup.h"
#import "JKProgressHUD.h"
#import "SURatingPopup.h"
@interface SUViewController ()
@property(nonatomic, strong) JKProgressHUD *popup;
@property(nonatomic, strong) SURatingPopup *popup2;

@end

@implementation SUViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _buttonArray = [NSMutableArray arrayWithObjects:_openButton, _suitButton, _shirtButton, _tieButton, _shoeButton, nil];
    [self setUpColorData];
    [self setUpTextureData];
    CGSize iOSDeviceScreenSize = [[UIScreen mainScreen] bounds].size;
    
    if (iOSDeviceScreenSize.height == 480)
    {
        _size = [NSNumber numberWithInt:48];
    }
    else{
        _size = [NSNumber numberWithInt:57];
    }
    
    _shirtTexture = @"gingham";
    _tieTexture = @"large stripe";
    _suitTexture = @"striped";
    
    _suitColor = @"black";
    _shirtColor = @"gray";
    _tieColor = @"lavender";
    _shoeColor = @"brown";
}
-(void)setUpTextureData{
    NSString *txtFilePath = [[NSBundle mainBundle] pathForResource:@"Texture" ofType:@"csv"];
    NSArray *arrayOfDictionaries = [CSVParser parseCSVIntoArrayOfDictionariesFromFile:txtFilePath
                                                         withSeparatedCharacterString:@","
                                                                 quoteCharacterString:@"\""];
    _textureRating = [arrayOfDictionaries mutableCopy];

}
-(void)setUpColorData{
    NSString *txtFilePath2 = [[NSBundle mainBundle] pathForResource:@"Colors" ofType:@"csv"];
    __block NSArray *dicts;
    [CSVParser parseCSVIntoArrayOfDictionariesFromFile:txtFilePath2
                                                         withSeparatedCharacterString:@","
                                                                 quoteCharacterString:@"\""
                                             withBlock:^(NSArray *array, NSError *error){
                                                 if(error){
                                                     NSLog(@"%@",[error localizedDescription]);
                                                 }
                                                 else{
                                                     dicts = array;
                                                     _colorRating = [dicts mutableCopy];
                                                 }
                                             }];
   
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)checkSuit:(id)sender {
    if(!_shoeView){
        _shoeColor = @"brown";
    }
    else{
        _shoeColor = _shoeView.color;
    }
    NSLog(@"%@",_shoeColor);
    NSPredicate *suitColorFilter = [NSPredicate predicateWithFormat:[NSString stringWithFormat:@"Suit LIKE '%@'",_suitColor]];
    NSPredicate *shirtColorFilter = [NSPredicate predicateWithFormat:[NSString stringWithFormat:@"Shirt LIKE '%@'",_shirtColor]];
    NSPredicate *tieColorFilter = [NSPredicate predicateWithFormat:[NSString stringWithFormat:@"Tie LIKE '%@'",_tieColor]];
    NSPredicate *shoeColorFilter = [NSPredicate predicateWithFormat:[NSString stringWithFormat:@"Shoes LIKE '%@'",_shoeColor]];
    NSArray *filtered = [[[[_colorRating filteredArrayUsingPredicate:suitColorFilter]
                           filteredArrayUsingPredicate:shirtColorFilter]
                         filteredArrayUsingPredicate:tieColorFilter]
                         filteredArrayUsingPredicate:shoeColorFilter];

    NSString *rating = [[filtered firstObject]objectForKey:@"Rating"];
    NSString *comment = [[filtered firstObject]objectForKey:@"Comment"];
    if(!comment){comment = @"Lookin' Good!";}

    NSLog(@"Rating: %@",rating);
    
    NSPredicate *suitTextureFilter = [NSPredicate predicateWithFormat:[NSString stringWithFormat:@"Suit LIKE '%@'",_suitTexture]];
    NSPredicate *shirtTextureFilter = [NSPredicate predicateWithFormat:[NSString stringWithFormat:@"Shirt LIKE '%@'",_shirtTexture]];
    NSPredicate *tieTextureFilter = [NSPredicate predicateWithFormat:[NSString stringWithFormat:@"Tie LIKE '%@'",_tieTexture]];
    NSArray *texture = [[[_textureRating
                          filteredArrayUsingPredicate:suitTextureFilter]
                         filteredArrayUsingPredicate:shirtTextureFilter]
                        filteredArrayUsingPredicate:tieTextureFilter];
    NSString *rating2 = [[texture firstObject]objectForKey:@"Rating"];
    NSString *comment2 = [[texture firstObject]objectForKey:@"Comments"];
    
    NSLog(@"LOOKING FOR: %@, %@, %@", suitTextureFilter, shirtTextureFilter , tieTextureFilter);
    
    if(!comment2){comment2 = @"Nice Suit!";}


    NSNumber *total = [NSNumber numberWithFloat:((([rating integerValue] + [rating2 integerValue])/2)*10)];
	self.popup = [[JKProgressHUD alloc] initWithFrame:CGRectMake(0, 0, 200, 200) andTip:@"Always wear clothes"];
	[self.popup show];
	[self performSelector:@selector(hidePopup:) withObject:nil afterDelay:4.0];

    self.popup2 = [[SURatingPopup alloc]initWithFrame:CGRectMake(0, 0, 200, 200) andTip1:comment andTip2:comment2 andRating:total];
    
    
}
- (void) hidePopup:(id)sender {
	[self.popup hide];
    [self.popup2 show];
}

- (IBAction)openButton:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Warning"
                                                   message:@"This screen has not been designed yet"
                                                  delegate:self
                                         cancelButtonTitle:@"Ok"
                                         otherButtonTitles:nil];
    [alert show];
}

- (IBAction)suitButton:(id)sender {
    _suitView = [[[NSBundle mainBundle] loadNibNamed:@"SuitView" owner:self options:nil] firstObject];
    _suitView.frame = CGRectMake(55, [_size intValue], 100, 580);
    [self.view addSubview:_suitView];
    [_suitView setSuit:_suit andView:self];
    for(UIButton *button in _buttonArray){
        [button setSelected:NO];
    }
    [sender setSelected:YES];
}

- (IBAction)shirtButton:(id)sender {
    _shirtView = [[[NSBundle mainBundle] loadNibNamed:@"ShirtView" owner:self options:nil] firstObject];
    _shirtView.frame = CGRectMake(55, [_size intValue], 100, 580);
    [self.view addSubview:_shirtView];
    [_shirtView setShirt_Neck:_shirtNeck];
    [_shirtView setShirt:_shirt andView:self];
    for(UIButton *button in _buttonArray){
        [button setSelected:NO];
    }
    [sender setSelected:YES];
}

- (IBAction)tieButton:(id)sender {
    _tieView = [[[NSBundle mainBundle] loadNibNamed:@"TieView" owner:self options:nil] firstObject];
    _tieView.frame = CGRectMake(55, [_size intValue], 100, 580);
    [self.view addSubview:_tieView];
    [_tieView setTie:_tie andView:self];
    for(UIButton *button in _buttonArray){
        [button setSelected:NO];
    }
    [sender setSelected:YES];
}

- (IBAction)shoesButton:(id)sender {
    _shoeView = [[[NSBundle mainBundle] loadNibNamed:@"ShoesView" owner:self options:nil] firstObject];
    _shoeView.frame = CGRectMake(55, [_size intValue], 100, 580);
    [self.view addSubview:_shoeView];
    [_shoeView setShoes:_shoes];
    for(UIButton *button in _buttonArray){
        [button setSelected:NO];
    }
    [sender setSelected:YES];
}

@end
