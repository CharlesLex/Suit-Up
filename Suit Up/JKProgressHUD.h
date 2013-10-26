//
//  JKProgressHUD.h
//  JKPopup
//
//  Created by Joris Kluivers on 3/2/12.
//  Copyright (c) 2012 Cardcloud. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "JKPopup.h"
#import "TJSpinner.h"
@interface JKProgressHUD : JKPopup
@property(nonatomic, readonly) TJSpinner *activityView;
@property(nonatomic,retain) UILabel *tip;
@property(nonatomic,retain) UILabel *label; 
- (id) initWithFrame:(CGRect)frame andTip:(NSString*)tip;
@end
