//
//  JKProgressHUD.m
//  JKPopup
//
//  Created by Joris Kluivers on 3/2/12.
//  Copyright (c) 2012 Cardcloud. All rights reserved.
//

#import "JKProgressHUD.h"

#import <QuartzCore/QuartzCore.h>

@implementation JKProgressHUD

@synthesize activityView=_activityView;

- (id) initWithFrame:(CGRect)frame andTip:(NSString*)tip {
	self = [super initWithFrame:frame];
	if (self) {
		self.backgroundColor = [UIColor colorWithWhite:1 alpha:0.9f];
		self.layer.cornerRadius = 9.0f;
		_activityView  = [[TJSpinner alloc] initWithSpinnerType:kTJSpinnerTypeCircular];
        _activityView.hidesWhenStopped = YES;
        _activityView.radius = 30;
        _activityView.pathColor = [UIColor whiteColor];
        _activityView.fillColor = [UIColor redColor];
        _activityView.thickness = 10;
		[self addSubview:_activityView];
        _tip = [[UILabel alloc]init];
        _label = [[UILabel alloc]init];
        [_label setText:@"Today's Tip: "];
        [_tip setText:tip];
        [self addSubview:_label];
        [self addSubview:_tip];
        
	}
	return self;
}

- (void) layoutSubviews {
	[super layoutSubviews];
	CGRect activityFrame = self.activityView.frame;
	activityFrame.origin = CGPointMake(
	   floorf((CGRectGetWidth(self.frame) - CGRectGetWidth(activityFrame)) / 2.0f),
	   floorf((CGRectGetHeight(self.frame) - CGRectGetHeight(activityFrame)) / 2.0f)-35
	);
	self.activityView.frame = activityFrame;
    self.label.frame = CGRectMake(50, 90, 200, 100);
    self.tip.frame = CGRectMake(20, 120, 200, 100);
}

- (void) showAnimated:(BOOL)animated {
	[self.activityView startAnimating];
	[super showAnimated:animated];
}

@end
