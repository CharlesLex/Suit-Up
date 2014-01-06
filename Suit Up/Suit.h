//
//  Suit.h
//  Suit Up
//
//  Created by Josh Pearlstein on 1/5/14.
//  Copyright (c) 2014 Josh Pearlstein. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Suit : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * shirt_color;
@property (nonatomic, retain) NSString * shirt_texture;
@property (nonatomic, retain) NSString * shoes_color;
@property (nonatomic, retain) NSString * shoes_texture;
@property (nonatomic, retain) NSString * suit_color;
@property (nonatomic, retain) NSString * suit_texture;
@property (nonatomic, retain) NSString * tie_color;
@property (nonatomic, retain) NSString * tie_texture;

@end
