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
#import "SUCommentViewController.h"
#import "Suit.h"
#import "SUTipViewController.h"
@interface SUViewController ()
@property(nonatomic, strong) JKProgressHUD *popup;
@property(nonatomic, strong) SURatingPopup *popup2;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;

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
    UISwipeGestureRecognizer *mSwipeUpRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(hideMenu)];
    
    [mSwipeUpRecognizer setDirection:UISwipeGestureRecognizerDirectionLeft];
    
    [[self view] addGestureRecognizer:mSwipeUpRecognizer];
    
    _doubleTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapped:)];
    [self initWithSelection:@"stripe" andshirt:@"gingham" andTie:@"large stripe" withColor:@"black" shirtColor:@"gray" tieColor:@"lavender" andShoeColor:@"brown"];
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(123, 295, 320, 50)];
    _scrollView.maximumZoomScale = 2.0;
    _scrollView.minimumZoomScale = 1.0;
    _scrollView.clipsToBounds = YES;
    _scrollView.delegate = self;
    [_scrollView setUserInteractionEnabled:YES];
    [_scrollView setScrollEnabled:YES];
    [self initViews];
    [self setUpComments];
}
-(void)initWithSelection:(NSString*)suitText andshirt:(NSString*)shirtText andTie:(NSString*)tieText withColor:(NSString*)suitColor shirtColor:(NSString*)shirtColor tieColor:(NSString*)tieColor andShoeColor:(NSString*)shoeColor
{
    NSLog(@"Here");
    _suitTexture = suitText;
    _shirtTexture = shirtText;
    _tieTexture = tieText;
    _suitColor = suitColor;
    _shirtColor = shirtColor;
    _tieColor = tieColor;
    _shoeColor = shoeColor;
    [_suitView updateSuit:_suitColor andTexture:_suitTexture];
    [_shirtView updateShirt:_shirtColor andTexture:_shirtTexture];
    [_tieView updateTie:_tieColor andTexture:_tieTexture];
    [_shoeView updateShoes:_shoeColor];
}
-(void)setUpComments{
    _positive_comments = [[NSMutableArray alloc]initWithObjects:@"Looking sharp!",@"You’re good to go!",@"You’re dressed for a promotion!",@"You’re gunning for your boss’ job.",@"You’ll be making the right impression today.",@"You might be catching looks on your lunch break.",nil];
    _mid_comments = [[NSMutableArray alloc]initWithObjects:@"Not bad but you can look better", nil];
    _negative_comments = [[NSMutableArray alloc]initWithObjects:@"You can do better",@"That suit won't get you anywhere",@"You look like a clown",@"Really?",nil];
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [_scrollView setZoomScale:1.01 animated:YES];
}
-(void)tapped:(id)sender{
    NSLog(@"Here");
}
- (UIView *) viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return _images;
}
- (CGRect)centeredFrameForScrollView:(UIScrollView *)scroll andUIView:(UIView *)rView {
    CGSize boundsSize = scroll.bounds.size;
    CGRect frameToCenter = rView.frame;
    // center horizontally
    if (frameToCenter.size.width < boundsSize.width) {
        frameToCenter.origin.x = (boundsSize.width - frameToCenter.size.width)*-1 / 3;
    }
    else {
        frameToCenter.origin.x = 0;
    }
    // center vertically
    if (frameToCenter.size.height < boundsSize.height) {
        frameToCenter.origin.y = (boundsSize.height - frameToCenter.size.height)*-1 / 3;
    }
    else {
        frameToCenter.origin.y = 0;
    }
    return frameToCenter;
}
-(void)scrollViewDidZoom:(UIScrollView *)scrollView{
    CGRect new_frame = [self centeredFrameForScrollView:scrollView andUIView:_images];
    [_images setBounds:new_frame];
    [self.view setNeedsLayout];
    
}
-(void)setUpTextureData{
    NSString *txtFilePath = [[NSBundle mainBundle] pathForResource:@"Texture" ofType:@"csv"];
    __block NSArray *arrayOfDicts;
    [CSVParser parseCSVIntoArrayOfDictionariesFromFile:txtFilePath
                                                         withSeparatedCharacterString:@","
                                                                 quoteCharacterString:@"\""
                                                         withBlock:^(NSArray *array, NSError *error){
                                                            if(error){
                                                                NSLog(@"%@",[error localizedDescription]);
                                                            }
                                                            else{
                                                                arrayOfDicts = array;
                                                                _textureRating = [arrayOfDicts mutableCopy];
                                                            }
                                                         }];

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
- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)exitButton:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)checkSuit:(id)sender {
    if(!_shoeView){
        _shoeColor = @"brown";
    }
    else{
        _shoeColor = _shoeView.color;
    }
    NSPredicate *suitColorFilter = [NSPredicate predicateWithFormat:[NSString stringWithFormat:@"Suit LIKE '%@'",_suitColor]];
    NSPredicate *shirtColorFilter = [NSPredicate predicateWithFormat:[NSString stringWithFormat:@"Shirt LIKE '%@'",_shirtColor]];
    NSPredicate *tieColorFilter = [NSPredicate predicateWithFormat:[NSString stringWithFormat:@"Tie LIKE '%@'",_tieColor]];
    NSPredicate *shoeColorFilter = [NSPredicate predicateWithFormat:[NSString stringWithFormat:@"Shoes LIKE '%@'",_shoeColor]];
    NSArray *filtered = [[[[_colorRating filteredArrayUsingPredicate:suitColorFilter]
                           filteredArrayUsingPredicate:shirtColorFilter]
                         filteredArrayUsingPredicate:tieColorFilter]
                         filteredArrayUsingPredicate:shoeColorFilter];

    NSString *rating = [[filtered firstObject]objectForKey:@"Rating"];
    _comment1 = [[filtered firstObject]objectForKey:@"Comment"];
    
    NSPredicate *suitTextureFilter = [NSPredicate predicateWithFormat:[NSString stringWithFormat:@"Suit LIKE '%@'",_suitTexture]];
    NSPredicate *shirtTextureFilter = [NSPredicate predicateWithFormat:[NSString stringWithFormat:@"Shirt LIKE '%@'",_shirtTexture]];
    NSPredicate *tieTextureFilter = [NSPredicate predicateWithFormat:[NSString stringWithFormat:@"Tie LIKE '%@'",_tieTexture]];
    NSArray *texture = [[[_textureRating
                          filteredArrayUsingPredicate:suitTextureFilter]
                         filteredArrayUsingPredicate:shirtTextureFilter]
                        filteredArrayUsingPredicate:tieTextureFilter];
    NSString *rating2 = [[texture firstObject]objectForKey:@"Rating"];
    _comment2 = [[texture firstObject]objectForKey:@"Comment"];
    
    _total = [NSNumber numberWithInt:((([rating floatValue] + [rating2 floatValue])/2.0)*10)];
    
    if([_total intValue] >= 70){
        int random = arc4random() % 5;
        _comment3 = [_positive_comments objectAtIndex:random];
    }
    else if([_total intValue] >= 50){
        int random = arc4random() % 1;
        _comment3 = [_mid_comments objectAtIndex:random];
    }
    else{
        int random = arc4random() % 3;
        _comment3 = [_negative_comments objectAtIndex:random];
    }
    _tipView = [[SUTipViewController alloc]initWithText:@"Testing" andImage:nil andController:self];
    [self.view addSubview:_tipView.view];
    _tipView.controller = self;
    //[self performSelector:@selector(dismissTip) withObject:nil afterDelay:3];
}
-(void)dismissTip{
    [_tipView.view removeFromSuperview];
    [self performSegueWithIdentifier:@"rate" sender:self];
}
-(void)hideMenu{
    [self hideAll];
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    SUCommentViewController *view = segue.destinationViewController;
    [view setUpWithTitle:_total com1:_comment1 com2:_comment2 com3:_comment3];
    [view setColorSelection:_suitColor andShirt:_shirtColor andTie:_tieColor andShoes:_shoeColor];
    [view setTextureSelection:_suitTexture andShirt:_shirtTexture andTie:_tieTexture];
    [view setController:self];
}
- (void) hidePopup:(id)sender {
	[self.popup hide];
    [self.popup2 show];
}
- (IBAction)openButton:(id)sender {
    if(![sender isSelected]){
        [self hideAll];
        [_openView reloadData];
        [self.view addSubview:_openView];
        
        for(UIButton *button in _buttonArray){
            [button setSelected:NO];
        }
        [sender setSelected:YES];
        [self.scrollView setZoomScale:1 animated:YES];

        //images.center = _scrollView.center;
    }
    else{
        [_openView removeFromSuperview];
        [sender setSelected:NO];
    }
}
- (IBAction)suitButton:(id)sender {
    if(![sender isSelected]){
        [self hideAll];
    [self.view addSubview:_suitView];
    for(UIButton *button in _buttonArray){
        [button setSelected:NO];
    }
    [sender setSelected:YES];
        [self.scrollView setZoomScale:1 animated:NO];
        
        [self.scrollView setZoomScale:1.5 animated:YES];
        //images.center = _scrollView.center;

    }
    else{
        [self.scrollView setZoomScale:1 animated:YES];
        _suitView.type = @"fadeOutRight";
        [_suitView removeFromSuperview];
        [sender setSelected:NO];
    }
}
- (IBAction)shirtButton:(id)sender {
    if(![sender isSelected]){
        [self hideAll];
        [self.view addSubview:_shirtView];
        for(UIButton *button in _buttonArray){
            [button setSelected:NO];
        }
        [sender setSelected:YES];
        //[self.scrollView setZoomScale:1 animated:NO];
        [self.scrollView setBounces:NO];
        [self.scrollView setBouncesZoom:NO];
        [self.scrollView zoomToRect:[self centeredFrameForScrollView:_scrollView andUIView:_images] animated:YES];
        [self.scrollView setZoomScale:1.5 animated:YES];

        
    }
    else{
        [self.scrollView setZoomScale:1 animated:YES];
        _shirtView.type = @"fadeOutRight";
        [_shirtView removeFromSuperview];
        [sender setSelected:NO];
    }

}
- (IBAction)tieButton:(id)sender {
    if(![sender isSelected]){
        [self hideAll];
    [self.view addSubview:_tieView];
    for(UIButton *button in _buttonArray){
        [button setSelected:NO];
    }
    [sender setSelected:YES];
        [self.scrollView setZoomScale:1 animated:NO];
        [self.scrollView setZoomScale:2 animated:YES];}
    
    else{
        [self.scrollView setZoomScale:1 animated:YES];
            _tieView.type = @"fadeOutRight";
            [_tieView removeFromSuperview];
            [sender setSelected:NO];
        }
}
- (IBAction)shoesButton:(id)sender {
    if(![sender isSelected]){
        [self hideAll];
        [self.view addSubview:_shoeView];
        [self.scrollView setZoomScale:1 animated:YES];
    for(UIButton *button in _buttonArray){
        [button setSelected:NO];
    }
    [sender setSelected:YES];
    }else{
            [self.scrollView setZoomScale:1 animated:YES];
            _shoeView.type = @"fadeOutRight";
            [_shoeView removeFromSuperview];
            [sender setSelected:NO];
        }
}
-(void)initViews{
    _openView = [[[NSBundle mainBundle] loadNibNamed:@"OpenView" owner:self options:nil] firstObject];
    _openView.frame = CGRectMake(55, [_size intValue], 100, 580);
    [_openView setup:self];
    _suitView = [[[NSBundle mainBundle] loadNibNamed:@"SuitView" owner:self options:nil] firstObject];
    _suitView.frame = CGRectMake(55, [_size intValue], 100, 580);
    [_suitView setSuit:_suit andView:self];
    _shirtView = [[[NSBundle mainBundle] loadNibNamed:@"ShirtView" owner:self options:nil] firstObject];
    _shirtView.frame = CGRectMake(55, [_size intValue], 100, 580);
    [_shirtView setShirt_Neck:_shirtNeck];
    [_shirtView setShirt:_shirt andView:self];
    _tieView = [[[NSBundle mainBundle] loadNibNamed:@"TieView" owner:self options:nil] firstObject];
    _tieView.frame = CGRectMake(55, [_size intValue], 100, 580);
    [_tieView setTie:_tie andView:self];
    _shoeView = [[[NSBundle mainBundle] loadNibNamed:@"ShoesView" owner:self options:nil] firstObject];
    _shoeView.frame = CGRectMake(55, [_size intValue], 100, 580);
    [_shoeView setShoes:_shoes];
}
-(void)hideAll{
    [_openView removeFromSuperview];
    [_suitView removeFromSuperview];
    [_shirtView removeFromSuperview];
    [_tieView removeFromSuperview];
    [_shoeView removeFromSuperview];
    [self.scrollView setZoomScale:1 animated:YES];
    for(UIButton *button in _buttonArray){
        [button setSelected:NO];
    }
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self hideAll];
}
-(void)displaySuit:(Suit*)suit{
    _shirtTexture = suit.shirt_texture;
    _tieTexture = suit.tie_texture;
    _suitTexture = suit.suit_texture;
    _suitColor = suit.suit_color;
    _shirtColor = suit.shirt_color;
    _tieColor = suit.tie_color;
    _shoeColor = suit.shoes_color;
    
    [_suitView updateSuit:_suitColor andTexture:_suitTexture];
    [_shirtView updateShirt:_shirtColor andTexture:_shirtTexture];
    [_tieView updateTie:_tieColor andTexture:_tieTexture];
    [_shoeView updateShoes:_shoeColor];
}
@end
