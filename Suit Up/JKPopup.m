//
//  JKPopup.m
//  JKPopup
//
//  Created by Joris Kluivers on 3/2/12.
//  Copyright (c) 2012 Cardcloud. All rights reserved.
//

#import "JKPopup.h"

@interface JKPopup ()
@property(nonatomic, strong) UIWindow *window;
@end

@implementation JKPopup

@synthesize window;

- (void) show {
	[self showAnimated:YES];
}

- (void) showAnimated:(BOOL)animated {
	self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    self.window.windowLevel = UIWindowLevelAlert;
    self.window.backgroundColor = [UIColor clearColor];
	
	self.center = CGPointMake(CGRectGetMidX(self.window.bounds), CGRectGetMidY(self.window.bounds));
	
	[self.window addSubview:self];
	[self.window makeKeyAndVisible];
	
	if (animated) {
		self.window.transform = CGAffineTransformMakeScale(1.5, 1.5);
		self.window.alpha = 0.0f;
		
		__block UIWindow *animationWindow = self.window;
		
		[UIView animateWithDuration:0.3f delay:0.0f options:UIViewAnimationCurveEaseIn animations:^() {
			animationWindow.transform = CGAffineTransformMakeScale(1.0f, 1.0f);
			animationWindow.alpha = 1.0f;
		} completion:nil];
	}
}

- (void) hide {
	[self hideAnimated:YES];
}

- (void) hideAnimated:(BOOL)animated {
	if (animated) {
		__block UIWindow *animationWindow = self.window;
		
		[UIView animateWithDuration:0.3f delay:0.0f options:UIViewAnimationCurveEaseOut animations:^() {
			animationWindow.transform = CGAffineTransformMakeScale(0.5f, 0.5f);
			animationWindow.alpha = 0.0f;
		} completion:^(BOOL finished) {
            		self.window.hidden = YES;
            		self.window = nil;
        	}];
	} else {
		self.window.hidden = YES;
		self.window = nil;
	}
}

@end
