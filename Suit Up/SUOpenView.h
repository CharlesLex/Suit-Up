//
//  SUOpenView.h
//  Suit Up
//
//  Created by Josh Pearlstein on 11/7/13.
//  Copyright (c) 2013 Josh Pearlstein. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SUViewController.h"
@interface SUOpenView : CSAnimationView <UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (nonatomic,retain) NSMutableArray *suits;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong,nonatomic) SUViewController *controller;
-(void)setup:(SUViewController*)view;
@end
