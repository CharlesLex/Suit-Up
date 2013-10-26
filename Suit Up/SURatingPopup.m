//
//  SURatingPopup.m
//  Suit Up
//
//  Created by Josh Pearlstein on 10/26/13.
//  Copyright (c) 2013 Josh Pearlstein. All rights reserved.
//

#import "SURatingPopup.h"
@implementation SURatingPopup

- (id)initWithFrame:(CGRect)frame andTip1:(NSString *)tip1 andTip2:(NSString *)tip2  andRating:(NSNumber *)num
{
    self = [super initWithFrame:frame];
    if (self) {
		self.backgroundColor = [UIColor colorWithWhite:1 alpha:0.9f];
		self.layer.cornerRadius = 9.0f;
        
        _tip1 = [[UILabel alloc]init];
        _tip2 = [[UILabel alloc]init];
        _rating = [[UILabel alloc]init];
        _dismiss = [[UIButton alloc]init];
        [_rating setText:[num stringValue]];
        [_tip1 setText:tip1];
        [_tip2 setText:tip2];
        
        _rating.lineBreakMode = NSLineBreakByWordWrapping;
        _rating.textAlignment = NSTextAlignmentCenter;
        _rating.numberOfLines = 0;
        _rating.font = [UIFont systemFontOfSize:50];
        _tip1.lineBreakMode = NSLineBreakByWordWrapping;
        _tip1.textAlignment = NSTextAlignmentCenter;
        _tip1.numberOfLines = 0;
        _tip2.lineBreakMode = NSLineBreakByWordWrapping;
        _tip2.textAlignment = NSTextAlignmentCenter;
        _tip2.numberOfLines = 0;
        _tip2.font = [UIFont systemFontOfSize:12];
        _tip1.font = [UIFont systemFontOfSize:12];
        [_dismiss setTitle:@"Ok!" forState:UIControlStateNormal];
        [_dismiss setBackgroundImage:[UIImage imageNamed:@"splash_button"] forState:UIControlStateNormal];
        [_dismiss addTarget:self action:@selector(dismiss:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_dismiss];
        [self addSubview:_tip1];
        [self addSubview:_tip2];
        [self addSubview:_rating];
    }
    return self;
}
- (void) layoutSubviews {
	[super layoutSubviews];
    _tip1.frame = CGRectMake(10, 15, 180, 180);
    _tip2.frame = CGRectMake(10, 50, 180, 180);
    _rating.frame = CGRectMake(0, -50, 200, 200);
    _dismiss.frame = CGRectMake(70, 160, 60, 30);
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/
-(void)dismiss:(id)sender{
    [self hideAnimated:YES];
}
-(void) showAnimated:(
                       
                       BOOL)animated {
	[super showAnimated:animated];
}

@end