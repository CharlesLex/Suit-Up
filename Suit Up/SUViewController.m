//
//  SUViewController.m
//  Suit Up
//
//  Created by Josh Pearlstein on 10/1/13.
//  Copyright (c) 2013 Josh Pearlstein. All rights reserved.
//

#import "SUViewController.h"


@interface SUViewController ()

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
    NSString *suitColor;
    NSString *shirtColor;
    NSString *tieColor;
    NSString *shoeColor;
    
    if(_suitView.color != NULL){
        suitColor = _suitView.color;
    }
    else{
        suitColor = @"black";
    }
    
    if(_shirtView.color != NULL){
        shirtColor = _shirtView.color;
    }
    else{
        shirtColor = @"gray";
    }
    if(_tieView.color != NULL){
        tieColor = _tieView.color;
    }
    else{
        tieColor = @"lavender";
    }
    if(_shoeView.color != NULL){
        shoeColor = _shoeView.color;
    }
    else{
        shoeColor = @"brown";
    }

    NSPredicate *suitColorFilter = [NSPredicate predicateWithFormat:[NSString stringWithFormat:@"Suit LIKE '%@'",suitColor]];
    NSPredicate *shirtColorFilter = [NSPredicate predicateWithFormat:[NSString stringWithFormat:@"Shirt LIKE '%@'",shirtColor]];
    NSPredicate *tieColorFilter = [NSPredicate predicateWithFormat:[NSString stringWithFormat:@"Tie LIKE '%@'",tieColor]];
    NSPredicate *shoeColorFilter = [NSPredicate predicateWithFormat:[NSString stringWithFormat:@"Shoes LIKE '%@'",shoeColor]];
    NSArray *filtered = [[[[_colorRating filteredArrayUsingPredicate:suitColorFilter]
                           filteredArrayUsingPredicate:shirtColorFilter]
                         filteredArrayUsingPredicate:tieColorFilter]
                         filteredArrayUsingPredicate:shoeColorFilter];
    
    NSString *rating = [[filtered firstObject]objectForKey:@"Rating"];
    NSString *comment = [[filtered firstObject]objectForKey:@"Comment"];
    if(!comment){comment = @"Lookin' Good!";}
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:[NSString stringWithFormat:@"This suit has Color rating: %@",rating]
                                                   message:[NSString stringWithFormat:@"%@",comment]
                                                  delegate:Nil
                                         cancelButtonTitle:@"Cool!"
                                         otherButtonTitles:nil];
    [alert show];
    NSLog(@"Rating: %@",rating);
    NSString *suitTexture;
    NSString *shirtTexture;
    NSString *tieTexture;
    
    if(_suitView.texture != NULL){
        suitTexture = _suitView.texture;
    }
    else{
        suitTexture = @"striped";
    }
    
    if(_shirtView.texture != NULL){
        shirtTexture = _shirtView.texture;
    }
    else{
        shirtTexture = @"large stripe";
    }
    if(_tieView.texture != NULL){
        tieTexture = _tieView.texture;
    }
    else{
        tieTexture = @"large stripe";
    }
    NSPredicate *suitTextureFilter = [NSPredicate predicateWithFormat:[NSString stringWithFormat:@"Suit LIKE '%@'",suitTexture]];
    NSPredicate *shirtTextureFilter = [NSPredicate predicateWithFormat:[NSString stringWithFormat:@"Shirt LIKE '%@'",shirtTexture]];
    NSPredicate *tieTextureFilter = [NSPredicate predicateWithFormat:[NSString stringWithFormat:@"Tie LIKE '%@'",tieTexture]];
    NSArray *texture = [[[_textureRating
                          filteredArrayUsingPredicate:suitTextureFilter]
                         filteredArrayUsingPredicate:shirtTextureFilter]
                        filteredArrayUsingPredicate:tieTextureFilter];
    NSString *rating2 = [[texture firstObject]objectForKey:@"Rating"];
    NSString *comment2 = [[texture firstObject]objectForKey:@"Comments"];
    if(!comment2){comment2 = @"Nice Suit!";}
    UIAlertView *alert2 = [[UIAlertView alloc]initWithTitle:[NSString stringWithFormat:@"This suit has Texture rating: %@",rating2]
                                                   message:[NSString stringWithFormat:@"%@",comment2]
                                                  delegate:Nil
                                         cancelButtonTitle:@"Cool!"
                                         otherButtonTitles:nil];
    
    [alert2 show];

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
    [_suitView setSuit:_suit];
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
    [_shirtView setShirt:_shirt];
    for(UIButton *button in _buttonArray){
        [button setSelected:NO];
    }
    [sender setSelected:YES];
}

- (IBAction)tieButton:(id)sender {
    _tieView = [[[NSBundle mainBundle] loadNibNamed:@"TieView" owner:self options:nil] firstObject];
    _tieView.frame = CGRectMake(55, [_size intValue], 100, 580);
    [self.view addSubview:_tieView];
    [_tieView setTie:_tie];
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
