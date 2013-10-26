//
//  SURatingPopup.h
//  Suit Up
//
//  Created by Josh Pearlstein on 10/26/13.
//  Copyright (c) 2013 Josh Pearlstein. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JKPopup.h"
@interface SURatingPopup : JKPopup
@property (nonatomic,retain) UILabel *tip1;
@property (nonatomic,retain) UILabel *tip2;
@property (nonatomic,retain) UILabel *rating;
@property (nonatomic,retain) UIButton *dismiss;

- (id)initWithFrame:(CGRect)frame andTip1:(NSString *)tip1 andTip2:(NSString *)tip2 andRating:(NSNumber *)num;
@end
