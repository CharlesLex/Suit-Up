//
//  SUCommentViewController.h
//  Suit Up
//
//  Created by Josh Pearlstein on 12/9/13.
//  Copyright (c) 2013 Josh Pearlstein. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SUViewController.h"
@interface SUCommentViewController : UIViewController <UIAlertViewDelegate>
@property (nonatomic,retain) NSString *comment1;
@property (nonatomic,retain) NSString *comment2;
@property (nonatomic,retain) NSString *comment3;
@property (nonatomic,retain) NSNumber *total;
@property (nonatomic,strong) NSManagedObjectContext* managedObjectContext;
@property (nonatomic,retain) SUViewController *controller;
@property (nonatomic,retain) NSString *suitColor;
@property (nonatomic,retain) NSString *shirtColor;
@property (nonatomic,retain) NSString *tieColor;
@property (nonatomic,retain) NSString *shoeColor;

@property (nonatomic,retain) NSString *suitTexture;
@property (nonatomic,retain) NSString *shirtTexture;
@property (nonatomic,retain) NSString *tieTexture;


-(void)setUpWithTitle:(NSNumber*)total com1:(NSString*)com1 com2:(NSString*)com2 com3:(NSString*)com3;
-(void)setColorSelection:(NSString*)suitColor andShirt:(NSString*)shirtColor andTie:(NSString*)tieColor andShoes:(NSString*)shoeColor;
-(void)setTextureSelection:(NSString*)suitTexture andShirt:(NSString*)shirtTexture andTie:(NSString*)tieTexture;
-(void)setController:(SUViewController *)controller;

@end
